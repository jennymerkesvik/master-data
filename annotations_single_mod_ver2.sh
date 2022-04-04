#! bin/bash

set -eux

declare -a arr=(2882 1302 2530 1565 901 880 268 872 1027 3131 1080 1388 2317 1354 2124)
#mkdir annotations_mod/old_GCA

for i in "${arr[@]}"
do
 name="$i"
#  mv annotations_mod/"$name".tsv annotations_mod/old_GCA/"$name".tsv
#  gunzip annotations_zipped/"$name".emapper.annotations.gz
#  sed '/^#/d' annotations_zipped/"$name".emapper.annotations  > "$name"_tmp.csv
#  awk -F'\t' '{print name"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$8"\t"$9"\t"$10"\t"$12"\t"$13"\t"$17"\t"$21}' name="$name" "$name"_tmp.csv >> annotations_mod/"$name"_tmp.csv
  echo -e 'key\tquery\tseed_ortholog\tevalue\tscore\teggNOG_OGs\tdescription\tpreferred_name\tGOs\tKEGG_ko\tKEGG_pathway\tbrite\tPFAMs' | cat - annotations_mod/"$name"_tmp.csv > annotations_mod/"$name".tsv

  rm annotations_mod/"$name"_tmp.csv
  rm "$name"_tmp.csv

  gzip annotations_zipped/"$name".emapper.annotations
done
