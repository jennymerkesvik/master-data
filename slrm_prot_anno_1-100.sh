#!/bin/bash

#SBATCH --job-name="prot_annotation_1-100"
#SBATCH --mail-user="jennm@stud.ntnu.no"
#SBATCH --mail-type=ALL
#SBATCH --output=/cluster/home/jennm/protein_annotation/job_%A.out
#SBATCH --time=36:00:00
#SBATCH --array=1-100
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2

i=${SLURM_ARRAY_TASK_ID}

gunzip /cluster/home/jennm/protein_data/$i.faa.gz
emapper.py -i /cluster/home/jennm/protein_data/$i.faa -o /cluster/home/jennm/protein_annotation/$i
gzip /cluster/home/jennm/protein_data/$i.faa
