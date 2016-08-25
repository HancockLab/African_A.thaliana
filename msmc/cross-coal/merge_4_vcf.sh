#!/bin/bash
# script to merge two VCFs that are tabix'd and bgzipped
# usage: merge_vcf.sh <#> <#>
set -e 
set -u

DIR=~/msmc2-final/

vcf-merge ${DIR}data/andrea_vcfs/${1}.vcf.gz ${DIR}data/andrea_vcfs/${2}.vcf.gz ${DIR}data/andrea_vcfs/${3}.vcf.gz ${DIR}data/andrea_vcfs/${4}.vcf.gz | bgzip -c > ~/msmc2-xcoal/data/merged_vcfs/${1}_${2}x${3}_${4}.vcf.gz
