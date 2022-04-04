#! bin/bash

set -eux

declare -a arr=( 2882 1302 2530 1565 901 880 268 872 1027 3131 1080 1388 2317 1354 2124 )

for i in "${arr[@]}"
do
 rm annotations_zipped/$i.emapper.annotations.gz
 cp protein_annotation/$i.emapper.annotations annotations_zipped/$i.emapper.annotations
 gzip annotations_zipped/$i.emapper.annotations
done

cat annotations_zipped/*.gz > all_annotations_ver2.annotations.gz
