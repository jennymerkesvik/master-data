#! bin/bash

set -eux

if [ -f annos_mod.csv ]
then
rm annos_mod.csv
fi

for file in annotations_zipped/*.gz
do

name=$(basename "$file" .emapper.annotations.gz)
file_unzip=~/annotations_zipped/"$name".emapper.annotations

gunzip $file

sed '/^##/d' "$file_unzip"  > "$name"_tmp.csv
awk -F'\t' '{print name,"\t",$2,"\t",$3,"\t",$4,"\t",$5,"\t",$8,"\t",$9,"\t",$10,"\t",$12,"\t",$13,"\t",$17,"\t",$21}' name="$name" "$name"_tmp.csv >> annos_mod.csv

rm "$name"_tmp.csv

gzip "$file_unzip"

done
