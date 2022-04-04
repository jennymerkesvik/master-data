#! bin/bash

set -eux

if [ -d annotation_extracts ]
then
  if [ -f annotation_extracts/*.* ]
  then
   for file in annotation_extracts/*.*
   do
     rm $file
   done
  fi
else
 mkdir annotation_extracts
fi

cd ~/annotation_extracts
>COG.csv
>GO.csv
>KO.csv
cd ..

for file in annotations_mod/*.tsv
do
 #eggnog_OGs
  cut -f 1,6 $file >> annotation_extracts/COG.csv

 #GOs
  cut -f 1,9 $file >> annotation_extracts/GO.csv

 #KEGG_KOs
  cut -f 1,10 $file >> annotation_extracts/KO.csv
done

for file in annotation_extracts/*.csv
do
 name=$(basename "$file" .csv)
 sort $file | uniq -u > annotation_extracts/"$name"_uniques.csv
done

for file in annotation_extracts/*_uniques.csv
do
 name=$(basename "$file" _uniques.csv)
 sed '/key/d' $file > "$name"_tmp.csv
 echo -e 'key\t'"$name" | cat - "$name"_tmp.csv > annotation_extracts/"$name"_final.csv
 rm "$name"_tmp.csv
done
