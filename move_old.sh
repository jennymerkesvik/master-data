#! bin/bash

set -eux

declare -a arr=(2882 1302 2530 1565 901 880 268 872 1027 3131 1080 1388 2317 1354 2124)

for i in "${arr[@]}":
do
 mv protein_annotation/$i.* protein_annotation/old_GCA
done

for file in protein_annotation/resubmitted/*.*
do
  cp $file{,.copy}
  mv $file protein_annotation
done
