#!/bin/bash

mpirun -np $1 simpleFoam -parallel > log &      #to run in on local machine
#srun -n $1 simpleFoam -parallel > log &  #to run on clusters either interactive node or sbatch

wait $!