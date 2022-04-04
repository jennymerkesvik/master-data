#! bin/bash

set -eux

>comparison_GCA_GCF.csv

printf 'key;GCA;GCF' >> comparison_GCA_GCF.csv

end=5

for i in {1..$end}
do
 GCA = gunzip protein_data/$i.faa.gz
 GCF = gunzip protein_data_GCF/$i.faa.gz
 GCA_count = 

