setwd("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset5/")
all <- data.frame(read.table("data/Morocco1001.filtered.filter10.pruned.nomissing.eigenvec"))
labels <- fread("data/filter10.labels.colors.csv")
names(all) <- c("ID", "ID", paste("PC", 1:20))

var <- fread("data/Morocco1001.filtered.filter10.pruned.nomissing.eigenval")


#----
setEPS()
postscript("plots/PCA_all.eps")
#----
pairs(all[,3:6],pch=labels$V4, col=as.character(labels$V3), upper.panel = NULL, main="Principal Components")
#----
dev.off()
#----


#----
setEPS()
postscript("plots/PCA_variance.eps")
#----
barplot(var$V1[1:20], ylab="Percent variance explained", xlab="Principal Component", names.arg=1:20, col="skyblue", border=NA)
#----
dev.off()
#----
