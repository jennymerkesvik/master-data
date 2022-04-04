#!/bin/bash

#SBATCH --job-name="prot_annotation_resubmission"
#SBATCH --mail-user="jennm@stud.ntnu.no"
#SBATCH --mail-type=ALL
#SBATCH --output=/cluster/home/jennm/protein_annotation/resub_job_%A_%a.out
#SBATCH --time=36:00:00
#SBATCH --array=1-15
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2

i=${SLURM_ARRAY_TASK_ID}

declare -a resub=(0 2882 1302 2530 1565 901 880 268 872 1027 3131 1080 1388 2317 1354 2124)


gunzip /cluster/home/jennm/protein_data_GCF/${resub[$i]}.faa.gz
emapper.py -i /cluster/home/jennm/protein_data_GCF/${resub[$i]}.faa -o /cluster/home/jennm/protein_annotation/resubmitted/${resub[$i]}
gzip /cluster/home/jennm/protein_data_GCF/${resub[$i]}.faa
