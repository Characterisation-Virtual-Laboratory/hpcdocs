.. attention::
    This documentation is under active development, meaning that it can
    change over time as we refine it. Please email help@massive.org.au if
    you require assistance, or have suggestions to improve this documentation.

.. _m3deeplearning:

Deep Learning on M3
*******************

Software
========

There are a number of deep learning packages available on M3. 

Caffe
^^^^^
To use Caffe on M3:

.. code-block:: bash

    nvidia-modprobe -u 
    module load caffe
    your-caffe-script-here 

TensorFlow
^^^^^^^^^^
To use TensorFlow on M3:

.. code-block:: bash

    # Loading module
    module load tensorflow/1.3.0-python2.7.12-gcc5
    
    # Unloading module
    module unload tensorflow/1.3.0-python2.7.12-gcc5


Reference datasets
==================

ImageNet
^^^^^^^^
ImageNet is a collection of approximately 14 million annotated images often used
to benchmark and test image classification and object detection models. Each
image has been categorised according to a WordNet ID, and additional
annotations, such as bounding boxes, can be obtained via ImageNet APIs. The
dataset is described in full at
`http://www.image-net.org <http://www.image-net.org>`_.

Users can access the Fall 2011 version of the ImageNet database by `registering
their acceptance of the terms of access
<https://hpc.erc.monash.edu.au/karaage/software/16/>`_.


Quick guide for checkpointing
=============================

Why checkpointing?
^^^^^^^^^^^^^^^^^^
Checkpoints in Machine/Deep Learning experiments prevent you from losing your experiments due to maximum walltime reached, blackout, OS faults or other types of bad errors. Sometimes you want just to resume a particular state of the training for new experiments or try different things. 

Pytorch:
""""""""
First of all define a save_checkpoint function which handles all the instructions about the number of checkpoints to keep and the serialization on file:

.. code-block:: python

 def save_checkpoint(state, condition, filename='/output/checkpoint.pth.tar'):
    """Save checkpoint if the condition achieved"""
    if condition:
        torch.save(state, filename)  # save checkpoint
    else:
        print ("=> Validation condition not meet")

Then, inside the training (usually a for loop with the number of epochs), we define the checkpoint frequency (at the end of every epoch) and the information (epochs, model weights and best accuracy achieved) we want to save:

.. code-block:: python

 # Training the Model
 for epoch in range(num_epochs):
    train(...)  # Train
    acc = eval(...)  # Evaluate after every epoch
 
    # Some stuff with acc(accuracy)
    ...
    # Get bool not ByteTensor
    is_best = bool(acc.numpy() > best_accuracy.numpy())
    # Get greater Tensor to keep track best acc
    best_accuracy = torch.FloatTensor(max(acc.numpy(), best_accuracy.numpy()))
    # Save checkpoint if is a new best
    save_checkpoint({
        'epoch': start_epoch + epoch + 1,
        'state_dict': model.state_dict(),
        'best_accuracy': best_accuracy
    }, is_best)

To resume a checkpoint, before the training we have to load the weights and the meta information we need:

.. code-block:: python

  checkpoint = torch.load(resume_weights)
  start_epoch = checkpoint['epoch']
  best_accuracy = checkpoint['best_accuracy']
  model.load_state_dict(checkpoint['state_dict'])
  print("=> loaded checkpoint '{}' (trained for {} epochs)".format(resume_weights, checkpoint['epoch']))

Keras
"""""

Keras provides a set of functions called callback: you can think of it as events that will triggered at certain training state. The callback we need for checkpointing is the ModelCheckpoint which provides all the features we need according to the checkpoint strategy adopted.

.. code-block:: python

  from keras.callbacks import ModelCheckpoint
  # Checkpoint In the /output folder
  filepath = "/output/mnist-cnn-best.hdf5"
 
  # Keep only a single checkpoint, the best over test accuracy.
  checkpoint = ModelCheckpoint(filepath,
                            monitor='val_acc',
                            verbose=1,
                            save_best_only=True,
                            mode='max')
  # Train
  model.fit(x_train, y_train,
                batch_size=batch_size,
                epochs=epochs,
                verbose=1,
                validation_data=(x_test, y_test),
                callbacks=[checkpoint])  # <- Apply our checkpoint strategy
 

Keras models have the load_weights() method which load the weights from a hdf5 file.
To load the model's weight you have to add this line just after the model definition:

.. code-block:: python

  ... # Model Definition
  model.load_weights(resume_weights)

Tensorflow
""""""""""
The tf.train.Saver class provides methods to save and restore models. The tf.saved_model.simple_savefunction is an easy way to build a saved model suitable for serving. Estimators automatically save and restore variables in the model_dir.

.. code-block:: python

  # Create some variables.
  v1 = tf.get_variable("v1", shape=[3], initializer = tf.zeros_initializer)
  v2 = tf.get_variable("v2", shape=[5], initializer = tf.zeros_initializer)

  inc_v1 = v1.assign(v1+1)
  dec_v2 = v2.assign(v2-1)

  # Add an op to initialize the variables.
  init_op = tf.global_variables_initializer()

  # Add ops to save and restore all the variables.
  saver = tf.train.Saver()

  # Later, launch the model, initialize the variables, do some work, and save the
  # variables to disk.
  with tf.Session() as sess:
    sess.run(init_op)
    # Do some work with the model.
    inc_v1.op.run()
    dec_v2.op.run()
    # Save the variables to disk.
    save_path = saver.save(sess, "/tmp/model.ckpt")
    print("Model saved in path: %s" % save_path)


After a model has been trained, it can be restored using tf.train.Saver() which restores Variables from a given checkpoint. For many cases, tf.train.Saver() provides a simple mechanism to restore all or just a few variables.

.. code-block:: python

  # Create some variables.
  v1 = tf.Variable(..., name="v1")
  v2 = tf.Variable(..., name="v2")
  ...
  # Add ops to restore all the variables.
  restorer = tf.train.Saver()
 
  # Add ops to restore some variables.
  restorer = tf.train.Saver([v1, v2])
 
  # Later, launch the model, use the saver to restore variables from disk, and
  # do some work with the model.
  with tf.Session() as sess:
    # Restore variables from disk.
    restorer.restore(sess, "/tmp/model.ckpt")
    print("Model restored.")
    # Do some work with the model
    ...
