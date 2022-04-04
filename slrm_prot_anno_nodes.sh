#!/bin/bash

#SBATCH --job-name="prot_anno_test_nodes"
#SBATCH --mail-user="jennm@stud.ntnu.no"
#SBATCH --mail-type=ALL
#SBATCH --output=/cluster/home/jennm/annoTest/protein_annotation/%A.out
#SBATCH --time=05:00:00
#SBATCH --array=1-4
#SBATCH --nodes=4

i=${SLURM_ARRAY_TASK_ID}

gunzip /cluster/home/jennm/annoTest/protein_data/$i.faa.gz
emapper.py -i /cluster/home/jennm/annoTest/protein_data/$i.faa -o 4_nodes_$i
gzip /cluster/home/jennm/annoTest/protein_data/$i.faa
