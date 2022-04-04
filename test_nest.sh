#! bin/bash

set -eux

declare -a resub=(2882 1302 2530 1565 901 880 268 872 1027 3131 1080 1388 2317 1354)

for i in {0..10}
do
 echo ${resub[$i]}
done
