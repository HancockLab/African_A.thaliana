while read p;
do
    a=`echo ${p} | cut -f 1 -d "x"`
    b=`echo ${p} | cut -f 2 -d "x"`
    a1=`echo ${a} | cut -f 1 -d "_"`
    a2=`echo ${a} | cut -f 2 -d "_"`
    b1=`echo ${b} | cut -f 1 -d "_"`
    b2=`echo ${b} | cut -f 2 -d "_"`

    submit2sge -q cluster "/home/CIBIV/arun/software/msmc2-test/build/release/msmc2 -P 0,0,1,1 -o across/${p} data/msmc_input/${p}.chr?.txt"
    submit2sge -q cluster "/home/CIBIV/arun/software/msmc2-test/build/release/msmc2 -I 0,1 -o within2/${a} data/msmc_input/${p}.chr?.txt"
    submit2sge -q cluster "/home/CIBIV/arun/software/msmc2-test/build/release/msmc2 -I 2,3 -o within2/${b} data/msmc_input/${p}.chr?.txt"
done < qar_bik_comparisons.txt
#done < herbarium_comparisons.txt
#done<qar_etna_comparisons.txt
#done < no_admix_comparisons.txt
#done < zin_comparisons.txt
#done < comparisons.txt

#for p in "35520_211399x22001_22000" "35520_211399x9764_21138" "22001_22000x9764_21138"
#for p in "9925_9935x9764_21138" "768_772x9764_21138"
#for p in "768_772x9764_21138" 
#do
#    a=`echo ${p} | cut -f 1 -d "x"`
#    b=`echo ${p} | cut -f 2 -d "x"`
#    a1=`echo ${a} | cut -f 1 -d "_"`
#    a2=`echo ${a} | cut -f 2 -d "_"`
#    b1=`echo ${b} | cut -f 1 -d "_"`
#    b2=`echo ${b} | cut -f 2 -d "_"`

#    submit2sge -q cluster "/home/CIBIV/arun/software/msmc2-test/build/release/msmc2 -P 0,0,1,1 -o across/${p} data/msmc_input/${p}.chr?.txt"
#    submit2sge -q cluster "/home/CIBIV/arun/software/msmc2-test/build/release/msmc2 -I 0,1 -o within2/${a} data/msmc_input/${p}.chr?.txt"
#    submit2sge -q cluster "/home/CIBIV/arun/software/msmc2-test/build/release/msmc2 -I 2,3 -o within2/${b} data/msmc_input/${p}.chr?.txt"
#done
