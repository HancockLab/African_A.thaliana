#!/bin/bash
# undo the gzip, append missing columns, bgzip (with new filename [sample number]), tabix
# usage: prepare_vcf.sh /[MI]/<andrea vcf> -m
# -m if morocco input
# -o if other
# Moroccans are like : M_sma-Til2.18510_AAGACGGA_C41F2ACXX_6_20140423B_20140423.bam.mpileup.all.snp.vcf.b.gz
# All others are like : /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/1001/9725.mpileup.all.snp.vcf
# or : /home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/I/9544.mpileup.all.snp.vcf.b.gz


set -e
set -u

#BASE_DIR="/home/CIBIV/andreaf/canaries/rawData/bam/callsPerIsland/"
if [[ ${2} = "-o" ]]; then
    SAMPLE_NAME=`basename "${1}"` #need to get sample NUMBER
    SAMPLE_NUMBER=`echo ${SAMPLE_NAME} | cut -d "." -f 1`
fi
if [[ ${2} = "-m" ]]; then
    SAMPLE_NAME=`basename "${1}"` #need to get sample NUMBER
    S=`echo ${SAMPLE_NAME} | cut -d "." -f 2`
    SAMPLE_NUMBER=`echo ${S} | cut -d "_" -f 1`
fi

if [[ ${1} =~ \.gz$ ]]; then
    awk -v SAMPLE="${SAMPLE_NUMBER}" '$1 == "#CHROM" {print $0"\tFORMAT\t"SAMPLE} $1 !~ "#CHROM" {print $0"\tGT\t1"}' <(gzip -dc $1) | bgzip -c > ${HOME}/msmc2-final/data/andrea_vcfs/${SAMPLE_NUMBER}.vcf.gz
else
    awk -v SAMPLE="${SAMPLE_NUMBER}" '$1 == "#CHROM" {print $0"\tFORMAT\t"SAMPLE} $1 !~ "#CHROM" {print $0"\tGT\t1"}' $1 | bgzip -c > ${HOME}/msmc2-final/data/andrea_vcfs/${SAMPLE_NUMBER}.vcf.gz
fi

tabix -p vcf ${HOME}/msmc2-final/data/andrea_vcfs/${SAMPLE_NUMBER}.vcf.gz
