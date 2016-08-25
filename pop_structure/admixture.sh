for i in {1..20};
do
    mkdir -p replicate.$i
    cd replicate.$i
    for k in {2..15};
    do
        admixture --cv -s time ../../data/Morocco1001.filtered.filter7.pruned.nomissing.bed ${k} -j4 | tee filter7.log${k}.out
    done    
    cd ..
done
