bcftools view -i 'FMT/GQ>=25 & DP>=3' -r Chr1,Chr2,Chr3,Chr4,Chr5 -m2 -M2 -v snps data/superVcf_29-7-16.vcf.b.gz | bgzip -c > data/superVcf_29-7-16.chronly.biallelic.nomissing.quality.depth.vcf.b.gz

plink --vcf data/superVcf_29-7-16.chronly.biallelic.nomissing.quality.depth.vcf.b.gz --biallelic-only --snps-only --keep data/labels-plink5.csv --indiv-sort f data/labels-plink5.csv --make-bed --keep-allele-order --out data/Morocco1001.filtered
###########
# fullset #
###########
# get only unlinked SNPs
bsub -q normal "plink --bfile data/Morocco1001.filtered --indep-pairwise 50 10 0.1 --keep-allele-order --out data/indep.filtered"
# extract unlinked SNPs
bsub -q normal "plink --bfile data/Morocco1001.filtered --extract data/indep.filtered.prune.in --make-bed --keep-allele-order --out data/Morocco1001.filtered.pruned"
# use only non-missing SNPs
bsub -q normal "plink --bfile data/Morocco1001.filtered.pruned --geno 0.000 --make-bed --keep-allele-order --out data/Morocco1001.filtered.pruned.nomissing"
plink --bfile data/Morocco1001.filtered.pruned.nomissing --recodeA --out data/Morocco1001.filtered.pruned.nomissing --keep-allele-order


############
# filtered #
############
# filter individuals
bsub -q normal "plink --bfile data/Morocco1001.filtered --keep data/filter10.csv --indiv-sort f data/filter10.csv --make-bed --keep-allele-order --out data/Morocco1001.filtered.filter10"
# get only unlinked SNPs
bsub -q normal "plink --bfile data/Morocco1001.filtered.filter10 --indep-pairwise 50 10 0.1 --keep-allele-order --out data/indep.filtered.filter10"
# extract unlinked SNPs
bsub -q normal "plink --bfile data/Morocco1001.filtered.filter10 --extract data/indep.filtered.filter10.prune.in --indiv-sort f data/filter10.csv --make-bed --keep-allele-order --out data/Morocco1001.filtered.filter10.pruned"
# use only non-missing SNPs
bsub -q normal "plink --bfile data/Morocco1001.filtered.filter10.pruned --geno 0.000 --indiv-sort f data/filter10.csv --make-bed --keep-allele-order --out data/Morocco1001.filtered.filter10.pruned.nomissing"

# Try PCA
plink --bfile data/Morocco1001.filtered.filter10.pruned.nomissing --pca --out data/Morocco1001.filtered.filter10.pruned.nomissing
# Get raw file for NJ
plink --bfile data/Morocco1001.filtered.filter10.pruned.nomissing --recodeA --out data/Morocco1001.filtered.filter10.pruned.nomissing --keep-allele-order

