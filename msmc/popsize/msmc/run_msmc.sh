#!/bin/bash

#for file in `ls data/msmc_input/*chr1.txt`;
#do
#    comp=`echo ${file} | cut -d "." -f 1`
#    ONE=`basename ${comp} | cut -d "x" -f 1`
#    TWO=`basename ${comp} | cut -d "x" -f 2`
#    submit2sge -N msmc${ONE}x${TWO} -q cluster "bash scripts/msmc/msmc.sh ${ONE}x${TWO}"    
#done

#for file in `ls data/msmc_input/*6911*chr1.txt`;
#do
#    comp=`echo ${file} | cut -d "." -f 1`
#    ONE=`basename ${comp} | cut -d "x" -f 1`
#    TWO=`basename ${comp} | cut -d "x" -f 2`
#    submit2sge -N msmc${ONE}x${TWO} -q cluster "bash scripts/msmc/msmc.sh ${ONE}x${TWO}"
#done


#for file in `ls data/msmc_input/*7063*chr1.txt`;
#do
#    comp=`echo ${file} | cut -d "." -f 1`
#    ONE=`basename ${comp} | cut -d "x" -f 1`
#    TWO=`basename ${comp} | cut -d "x" -f 2`
#    submit2sge -N msmc${ONE}x${TWO} -q cluster "bash scripts/msmc/msmc.sh ${ONE}x${TWO}"
#done

#while read p;
#do
#    comp=`echo ${p} | cut -d "." -f 1`
#    ONE=`basename ${comp} | cut -d "x" -f 1`
#    TWO=`basename ${comp} | cut -d "x" -f 2`
#    submit2sge -N msmc${ONE}x${TWO} -q cluster "bash scripts/msmc/msmc.sh ${ONE}x${TWO}"    
#done<data/caucasus.txt

while read p;
do
    comp=`echo ${p} | cut -d "." -f 1`
    ONE=`basename ${comp} | cut -d "x" -f 1`
    TWO=`basename ${comp} | cut -d "x" -f 2`
    submit2sge -N msmc${ONE}x${TWO} -q cluster "bash scripts/msmc/msmc.sh ${ONE}x${TWO}"
done<data/w_sah.txt

while read p;
do
    comp=`echo ${p} | cut -d "." -f 1`
    ONE=`basename ${comp} | cut -d "x" -f 1`
    TWO=`basename ${comp} | cut -d "x" -f 2`
    submit2sge -N msmc${ONE}x${TWO} -q cluster "bash scripts/msmc/msmc.sh ${ONE}x${TWO}"
done<data/w_tanzh.txt

