#!/bin/bash
# run symlink_masks.sh on the files we want. Should be able to just do a for loop bc it takes like a second to run this.
# 

set -e
set -u

### Morocco

#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/M/ -name "*bam.mpileup.mask.txt.b.gz" | grep -f data/all_samples.txt`; do
#    bash scripts/preprocessing/symlink_masks.sh ${file} -m
#done

### Tanz

#bash scripts/preprocessing/symlink_masks.sh /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001_final/Tanz-4003.35520_GTGAAA_C8DE0ANXX_4_20160129B_20160129.bam.mpileup.mask.txt.b.gz -m


### Iberia

#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/I/ -name "*mpileup.mask.txt.b.gz" | grep -f data/all_samples.txt`; do
#    bash scripts/preprocessing/symlink_masks.sh ${file} -o
#done

### Other

#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001_final/ -name "*mpileup.mask.txt.b.gz" | grep -f data/all_samples.txt`; do
#    bash scripts/preprocessing/symlink_masks.sh ${file} -o
#done

### Caucasus
#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001_the20/ -name "*.mpileup.mask.txt"`;
#do
#    bash scripts/preprocessing/symlink_masks.sh ${file} -o
#done

for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/herb/ -name "*bam.mpileup.mask.txt"`; do 
    bash scripts/preprocessing/symlink_masks.sh ${file} -m 
done
