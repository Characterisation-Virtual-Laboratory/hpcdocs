.. _gpu-jobs:

****************
Running GPU Jobs
****************

Running GPU Batch Jobs
======================

Requesting GPU resources
------------------------

M3 is equipped with the following NVIDIA GPU cards:

    - 60 Tesla V100
    - 28 Tesla P100
    - 44 Tesla K80
    - 8 Grid K1

When requesting a Tesla V100 GPU, you need to specify ``--partition=m3g``

.. code-block:: bash

    #SBATCH --gres=gpu:V100:1 
    #SBATCH --account=nq46 
    #SBATCH --partition=m3g

When requesting a Tesla P100 GPU, you need to specify ``--partition=m3h``

.. code-block:: bash

    #SBATCH --gres=gpu:P100:1 
    #SBATCH --account=nq46 
    #SBATCH --partition=m3h


When requesting a Tesla K80 GPU, you need to specify ``--partition=m3c``

.. code-block:: bash

    #SBATCH --gres=gpu:1 
    #SBATCH --account=nq46 
    #SBATCH --partition=m3c

When requesting a Grid K1 GPU, you need to specify ``--partition=m3f``

.. code-block:: bash

    #SBATCH --gres=gpu:1
    #SBATCH --account=nq46
    #SBATCH --partition=m3f


Sample GPU Slurm scripts
------------------------

To submit a job, if you need 1 node with 3 cores and 1 GPU, then the slurm submission script should look like:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    #SBATCH --account=nq46
    #SBATCH --time=01:00:00
    #SBATCH --ntasks=3
    #SBATCH --cpus-per-task=1
    #SBATCH --gres=gpu:1
    #SBATCH --partition=m3f

If you need 6 nodes with 4 cpu cores and 2 GPUs on each node, then the slurm submission script should look like:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=MyJob
    #SBATCH --account=nq46
    #SBATCH --time=01:00:00
    #SBATCH --ntasks=24
    #SBATCH --ntasks-per-node=4
    #SBATCH --cpus-per-task=1
    #SBATCH --gres=gpu:2
    #SBATCH --partition=m3c


Compiling your own CUDA or OpenCL codes for use on M3
=====================================================

M3 has been configured to allow CUDA (or OpenCL) applications to be compiled (device independent code ONLY) on the Login
node (no GPUs installed) for execution on a Compute node (with GPU).

.. image:: /_static/massive-gpu-structure.png

``Login node``: can compile some of CUDA (or OpenCL) source code (device independent code ONLY) but cannot run it

``Compute node``: can compile all CUDA (or OpenCL) source code as well as execute it.

We strongly suggest you compile your code on a compute node. To do that, you need to use an ``smux`` session to gain access to a compute node

.. code-block:: bash

    smux new-session --gres=gpu:1 --partition=m3c

Once your interactive session has begun, load the cuda module

.. code-block:: bash

    module load cuda

To check the GPU device information

.. code-block:: bash

    nvidia-smi
    deviceQuery

Then you should be able to compile the GPU code. Once compilation has run to completion, without error, you can execute your GPU code.

.. attention::
    If you attempt to run any CUDA (or OpenCL) application (compiled executable) on the Login node, ‘no CUDA device found’ error may be
    reported. This is because no CUDA-enabled GPUs are installed on the Login node. You must run GPU code on a compute node.
