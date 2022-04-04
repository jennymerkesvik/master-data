#! /bin/bash
set -eux

ok=0
na=0

>protein_GCF_links_working.txt
>protein_GCF_links_broken.txt

while read url
do
 if wget --spider -q "${url}"
 then
  echo "${url}" >> protein_GCF_links_working.txt
  ok=$((ok+1)) 
else
  echo "${url}" >> protein_GCF_links_broken.txt
  na=$((na+1))
 fi
done < protein_GCF_links.txt

echo 'ok:$ok, na:$na'
