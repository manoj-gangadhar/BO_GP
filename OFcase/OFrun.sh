#!/bin/bash
srun simpleFoam -parallel > log &
wait $!