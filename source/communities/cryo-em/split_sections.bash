#!/bin/bash
# Author: Lance Wilson (lance.wilson@monash.edu)
# Script to split a directory listing of specific files into groups for batch processing and submit slurm jobs.
#
# Get number of files
num_files=$(ls -l *.mrcs | wc -l)
echo "The number of files to process is " $num_files
# Set size of each array to process based on compute time
num_split=100
let rounds=($num_files / $num_split); echo $rounds
start_value=1
for (( c=1; c<=$rounds; c++ ))
do
    let finish_value=($start_value+$num_split)
    sbatch ~/scripts/dosef_submit.sh $start_value $finish_value
    let start_value=$finish_value
done
# Do remaining tasks
sbatch ~/scripts/dosef_submit.sh $start_value $num_files
# Let the user know that the script is complete
echo "Job submission completed"