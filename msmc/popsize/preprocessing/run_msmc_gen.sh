#!/bin/bash

#for file in `ls data/merged_vcfs`;
#do
#    ONE=`echo ${file} | cut -d "x" -f 1`
#    TWO=`echo ${file} | cut -d "." -f 1 | cut -d "x" -f 2`      
#    SAMPLE=`echo ${file} | cut -d "." -f 1`
#    for chrom in 1 2 3 4 5;
#    do
#	submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#    done
#done

#for file in `ls data/merged_vcfs/*6911*`;
#do
#    ONE=`basename ${file} | cut -d "x" -f 1`
#    TWO=`basename ${file} | cut -d "." -f 1 | cut -d "x" -f 2`
#    SAMPLE=`basename ${file} | cut -d "." -f 1`
#    for chrom in 1 2 3 4 5;
#    do
#        submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#    done
#done


#for file in `ls data/merged_vcfs/*7063*`;
#do
#    ONE=`basename ${file} | cut -d "x" -f 1`
#    TWO=`basename ${file} | cut -d "." -f 1 | cut -d "x" -f 2`
#    SAMPLE=`basename ${file} | cut -d "." -f 1`
#    for chrom in 1 2 3 4 5;
#    do
#        submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#    done
#done

#SAMPLE=9764x9762
#ONE=9764
#TWO=9762
#for chrom in 1 2 3 4 5;
#do
#    submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#done

#while read p;
#do
#    ONE=`echo ${p} | cut -d "x" -f 1`
#    TWO=`echo ${p} | cut -d "." -f 1 | cut -d "x" -f 2`      
#    SAMPLE=`echo ${p} | cut -d "." -f 1`
#   for chrom in 1 2 3 4 5;
#    do
#       submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#    done
#done<data/caucasus.txt

#SAMPLE=35520x211399
#ONE=35520
#TWO=211399
#for chrom in 1 2 3 4 5;
#do
#    submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#done

#SAMPLE=9764x21138
#ONE=9764
#TWO=21138
#for chrom in 1 2 3 4 5;
#do
#    submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
#done

while read p;
do
    ONE=`echo ${p} | cut -d "x" -f 1`
    TWO=`echo ${p} | cut -d "." -f 1 | cut -d "x" -f 2`      
    SAMPLE=`echo ${p} | cut -d "." -f 1`
   for chrom in 1 2 3 4 5;
    do
       submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
    done
done<data/w_sah.txt

while read p;
do
    ONE=`echo ${p} | cut -d "x" -f 1`
    TWO=`echo ${p} | cut -d "." -f 1 | cut -d "x" -f 2`      
    SAMPLE=`echo ${p} | cut -d "." -f 1`
   for chrom in 1 2 3 4 5;
    do
       submit2sge -q cluster -N msmcgen${SAMPLE} "/usr/bin/python scripts/preprocessing/msmc_gen.py ${chrom} 2 data/merged_vcfs/${SAMPLE}.vcf.gz data/masks/${ONE}.txt.gz data/masks/${TWO}.txt.gz"
    done
done<data/w_tanzh.txt
