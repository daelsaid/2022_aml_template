#!/bin/bash

config_file=$1

sbatch -p owners,menon -J movementstats --mem=16GB --time=1:00:00 --wrap="ml math matlab; ml biology afni; matlab -nodesktop -nosplash -r \"addpath(genpath('/oak/stanford/groups/menon/projects/daelsaid/2019_met/scripts/taskfmri/movement_stats/')); movementstatsfmri('${config_file}'))\"";
