#! bin/bash
set -eux
counter=1

while [ $counter -le 3307 ]
do
if [ ! -f annotations_zipped/$counter.emapper.annotations.gz ]
then
cp protein_annotation/$counter.emapper.annotations annotations_zipped/$counter.emapper.annotations
gzip annotations_zipped/$counter.emapper.annotations
fi
((counter++))
done

cat annotations_zipped/*.gz > all_annotations.annotations.gz
