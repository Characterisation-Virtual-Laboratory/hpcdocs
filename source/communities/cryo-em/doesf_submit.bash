#!/bin/bash
# Author: Lance Wilson (lance.wilson@monash.edu)
# Script to process a range of mrcs files. Takes input of start and finish numbers.
#SBATCH --job-name=ImageCorrection
#SBATCH --time=01:00:00
#SBATCH --ntasks=4
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:K80:4

# Load necessary modules
module load gnuparallel/20160822
module load motioncorr2/20160822
module load libtiff/3.9.7

time(

# Set default gpu number
gpu_num=0
# Create array of files
i=(*_movie.mrcs)
# echo ${i[*]}
for (( c=$1-1; c<=$2; c++ ))
do
    echo $c; echo "Processing file " ${i[$c]}
    echo "Using gpu " $gpu_num
    sem --id $SLURM_JOB_ID --no-notice -j 8 dosefgpu_driftcorr -InMrc ${i[$c]} -OutMrc $(echo ${i[$c]} | cut -c1-4).mrc -bft 100 -gpu $gpu_num -fcs
    if [ $gpu_num -eq 0 ]; then
            gpu_num=1
    elif [ $gpu_num -eq 1 ]; then
            gpu_num=2
    elif [ $gpu_num -eq 2 ]; then
            gpu_num=3
    elif [ $gpu_num -eq 3 ]; then
            gpu_num=0
    fi
    date
done
sem --id $SLURM_JOB_ID --wait

)