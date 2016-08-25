#!/bin/bash
# run prepare_vcf.sh on the files we want. Should be able to just do a for loop bc it takes like a second to run this.
# 

set -e
set -u

### Morocco

#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/M/ -name "*snp.vcf.b.gz" | grep -f data/all_samples.txt`; do
#    bash scripts/preprocessing/prepare_vcf.sh ${file} -m
#done

### Tanz

#bash scripts/preprocessing/prepare_vcf.sh /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001/Tanz-4003.35520_GTGAAA_C8DE0ANXX_4_20160129B_20160129.bam.mpileup.all.snp.vcf.b.gz -m


### Iberia

#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/I/ -name "*snp.vcf.b.gz" | grep -f data/all_samples.txt`; do
#    bash scripts/preprocessing/prepare_vcf.sh ${file} -o
#done

### Other

#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001/ -name "*snp.vcf" | grep -f data/all_samples.txt`; do
#    bash scripts/preprocessing/prepare_vcf.sh ${file} -o
#done

### Caucasus
#for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001_the20/ -name "*snp.vcf"`; do
#    bash scripts/preprocessing/prepare_vcf.sh ${file} -o
#done

for file in `find /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/herb/ -name "*snp.vcf"`; do 
    bash scripts/preprocessing/prepare_vcf.sh ${file} -m                                                                                                  
done  
