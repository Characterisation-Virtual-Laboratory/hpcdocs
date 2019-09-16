.. attention::

    This documentation is under active development, meaning that it can change over time as we refine it. 
    Please email `help@massive.org.au <mailto:help@massive.org.au>`_ if you require assistance, or have suggestions 
    to improve this documentation.

.. _bioinformaticsindex:

Bioinformatics
==============
MASSIVE supports the bioinformatics, genomics and translational medicine community with storage and compute services.
On these pages we will provide examples of workflows and software settings for running common bioinformatics software 
on M3.

Requesting an account on M3
---------------------------
If you are requesting an account on M3 and are working in collaboration with the Monash Bioinformatics Platform,
please ensure you indicate this in the application and request that the appropriate Platform members are added to
your M3 project. This will enable them to assist in your analysis.

Getting started
---------------

Importing the bioinformatics module environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

M3 has a number of bioinformatics packages available in the default set of modules. These include versions of bwa, 
bamtools, bcftools, bedtools, GATK, bcl2fastq, BEAST, BEAST2, bowtie, bowtie2, cufflinks, cytoscape, fastx-toolkit, 
kallisto, macs2, muscle, phyml, picard, qiime2, raxml, rstudio, samtools, star, sra-tools, subread, tophat, varscan, 
vep (this list shouldn't be regarded as exhaustive !).

A software stack of additional packages (known as 
`bio-ansible <https://github.com/MonashBioinformaticsPlatform/bio-ansible>`_) is maintained by the Monash 
Bioinformatics Platform (MBP). 

Tools are periodically added as required by the user community.

Modules maintained by MBP are installed at: ``/usr/local2/bioinformatics/``

To access these additional tools, type:

.. code-block:: bash

    source /usr/local2/bioinformatics/bioansible_env.sh

This loads the bio-ansible modules into your environment alongside the default M3 modules.
If you are using this frequently you might like to source this in your ``.profile`` / ``.bash_profile``.

To list all modules:

.. code-block:: bash

    module avail

You will see the additionals tools listed under the ``/usr/local2/bioinformatics/software/modules/bio`` section, 
followed by the default M3 modules.

Installing additional software with Bioconda
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In addition to the pre-installed modules available on M3, `Bioconda <https://bioconda.github.io/>`_ provides a 
streamlined way to install reproducible enviroments of bioinformatics tools in your home directory.

`conda` is already installed on M3 under the `anaconda` module.

.. code-block:: bash
    
    module load anaconda

    conda config --add channels r
    conda config --add channels defaults
    conda config --add channels conda-forge
    conda config --add channels bioconda

These channels will now be listed in `~/.condarc` and will be searched when installing packages by name.

Create a conda enviroment for your analysis / pipeline / project
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Conda works by installing a set of pre-compiled tools and their dependencies in a self-contained 'enviroments' which 
you can switch between.
Unlike modules loaded via ``module load``, you can only have a single Conda environment active at one time.

To create an enviroment ``my_proj_env`` with a specific version of STAR, subread and asciigenome:

.. code-block:: bash

    # Change this to your M3 project ID
    export PROJECT=df22
    export CONDA_ENVS=/projects/$PROJECT/$USER/conda_envs

    mkdir -p $CONDA_ENVS

    module load anaconda

    conda create --yes -p $CONDA_ENVS/my_proj_env star=2.5.4a subread=1.5.2 asciigenome=1.12.0

    # To use the environment
    source activate $CONDA_ENVS/my_proj_env

    # Leave the enviroment
    source deactivate

You can search for packages on the commandline with: ``conda search <package_name>``, or on the web using the 
`Bioconda recipes list <https://bioconda.github.io/recipes.html>`_.

For further detail see the official `Bioconda documentation <https://bioconda.github.io/#using-bioconda>`_.


Running the RNAsik RNA-seq pipeline on M3
-----------------------------------------

The RNAsik pipeline runs on the BigDataScript workflow engine. 
A template BigDataScript config file pre-configured for M3 has been prepared, however you need to create a copy and 
modify the ``tmpDir`` setting to reflect your M3 project.

If the file ``~/.bds/bds.config`` doesn't exist, create a copy and edit the ``tmpDir`` setting like:

.. code-block:: bash
    
    # Ensure the BigDataScript module is loaded
    source /usr/local2/bioinformatics/bioansible_env.sh
    ml load BigDataScript

    # Create a copy of the config file in your home directory
    mkdir ~/.bds
    cp $(which bds).config ~/.bds/

    # Change this to your M3 project ID
    export PROJECT=df22

    # Edit the tmpDir setting to point to your scratch area 
    # (you can alternatively do this with vim / nano / emacs / $EDITOR)
    sed -i 's/.*tmpDir.*/tmpDir = \/scratch\/${PROJECT}\/tmp\//' ~/.bds/bds.config

Create a SLURM sbatch script, ``rnasik_sbatch.sh``, containing:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --account=${PROJECT}
    #SBATCH --profile=All
    #SBATCH --no-requeue
    #SBATCH --ntasks=1
    #SBATCH --ntasks-per-node=1
    #SBATCH --cpus-per-task=2
    #SBATCH --mem=2000
    #SBATCH -t 3-0:00  # time limit (D-HH:MM)
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --mail-user=example.user@monash.edu
    #SBATCH --job-name=rnasik
    
    # NOTE: The SBATCH options above only apply to the BigDataScript (bds) process.
    # (This is why --mem and --cpus-per-task allocations are small since these only reflect the 
    # resources allocated to the BigDataScript pipeine runner, not STAR, picard etc).
    #
    # As part of running the pipeline, bds submits jobs to the queue with the appropriate (larger) 
    # --cpus-per-task and --mem flags. If you need to add SBATCH flags to every job submitted by 
    # bds (eg --account=myacct --reservation=special_nodes), add these flag to the 
    # clusterRunAdditionalArgs variable in the bds.config file.
    #
    # Default CPU and memory requirements are defined in bds.config and sik.config.
  
    ##
    # Modify these variables as required
    ##

    PROJECT=df22
    export REFERENCE_GENOMES="/scratch/${PROJECT}/references"
    export FASTA_REF="${REFERENCE_GENOMES}/iGenomes/Mus_musculus/Ensembl/GRCm38/Sequence/WholeGenomeFasta/genome.fa"
    export GTF_FILE="${REFERENCE_GENOMES}/iGenomes/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf"
    export FASTQ_DIR="./fastqs"
    export SIK_VERSION="b55f2c7"
    ##############################

    source "/usr/local2/bioinformatics/bioansible_env.sh"

    ml unload perl
    ml load BigDataScript
    ml load RNAsik-pipe/${SIK_VERSION}
    ml load R
    ml load python/3.6.2
    ml load bwa
    ml load hisat2
    ml load bedtools2/2.25.0
    ml load qualimap/v2.2.1
    ml load gcc/6.1.0
    ml load multiqc/1.4
    ml load picard/2.18.0

    ml list

    # A precaution to ensure Java app wrapper scripts control -Xmx etc
    unset _JAVA_OPTIONS

    # BigDataScript sometimes needs ParallelGCThreads set, but we don't want jobs
    # to inherit these JVM settings.
    # export _JAVA_OPTIONS=-Xms256M -Xmx728M -XX:ParallelGCThreads=1

    export BDS_CONFIG="${HOME}/.bds/bds.config"

    # /usr/local2/bioinformatics/software/apps/RNAsik-pipe-${SIK_VERSION}
    export SIK_ORIGIN="$(dirname $(which RNAsik))/../"

    # Run RNAsik bypassing the usual wrapper script so that we can specify additional options
    bds -c ${BDS_CONFIG} -log -reportHtml "${SIK_ORIGIN}/src/RNAsik.bds" \
        -configFile "${SIK_ORIGIN}/configs/sik.config" \
        -fastaRef ${FASTA_REF} \
        -fqDir ${FASTQ_DIR} \
        -gtfFile ${GTF_FILE} \
        -align star \
        -counts \
        -all \
        -extn ".fastq.gz" \
        -paired \
        -pairIds "_R1,_R2"

Run like:

.. code-block:: bash

    sbatch rnasik_sbatch.sh

FAQ
---
Q : You have version xx and I need version YY, how do I get the software?

A : You should consider installing the software in your home directory. The `Bioconda <https://bioconda.org>`_ project 
helps streamline this process with many pre-packaged tools for bioinformatics. If you are unable to install the 
version you need, please contact the helpdesk `help@massive.org.au <mailto:help@massive.org.au>`_
