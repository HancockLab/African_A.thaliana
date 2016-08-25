library(data.table)
library(adegenet)
library(ape)


###########
### PCA
###########
setwd("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset5")
pca <- fread("data/Morocco1001.filtered.filter10.pruned.nomissing.eigenvec")
cols <- fread("data/filter10.labels.colors.csv")


#----
setEPS()
postscript("plots/PCA.eps")
#----
plot(pca$V3,pca$V4,col=cols$V3, pch=cols$V4, xlab="Principal Component 1", ylab="Principal Compenent 2",cex=1.5)
#----
dev.off()
#----


##########
# admixture
###########
colz <- as.character(c("#2E9CFD","#F1A916","#FF4534","#FDD42E"))
admix <- read.table("data/Morocco1001.filtered.filter7.pruned.nomissing.4-reordered.Q")
names <- c("H. Atlas", "S. Mid Atlas", "N. Mid Atlas", "Rif", "IR", "INR", "W. Europe", "Germany", "C. Europe", "S. Sweden", "N. Sweden", "IBC", "C. Asia")

#----
setEPS()
postscript("plots/admixture.eps",width=8,height=4)
#----
barplot(t(as.matrix(admix)), col=colz,xlab="", ylab="Ancestry", border=NA, space=0)
axis(1, at=seq(3,length(admix$V1),by=7), labels=names, las=2, tick=F, cex.axis=0.9)
axis(1, at=seq(0,length(admix$V1),by=7), labels=NA)

for (i in seq(7,length(labels$V2)-7,by=7)){
  abline(v=i,lty=2,col="white")
}
#----
dev.off()
#----



###################
#### NJ
###################
x <- read.PLINK("data/Morocco1001.filtered.filter10.pruned.nomissing.raw",parallel = F)
labs <- fread("data/filter10.labels.colors.csv", stringsAsFactors = T)
x <- seploc(x, n.block=10, parallel=FALSE)
lD <- lapply(x, function(e) dist(as.matrix(e)))
D <- Reduce("+", lD)

cols <- as.character(labs$V3)
t3 <- nj(D)

#----
setEPS()
postscript("plots/NJ.eps")
#----
plot.phylo(t3,tip.color=cols, type="unrooted",no.margin=T,show.tip.label=F)
tiplabels(pch=labs$V4,col=cols, cex=2)
#----
dev.off()
#----

#----
setEPS()
postscript("plots/NJ.hsnps.label.eps")
#----
plot.phylo(t3, tip.color=cols, type="unrooted", cex=0.5)
#----
dev.off()
#----

D <- Reduce("+", lD)
t3 <- nj(D)
#----
setEPS()
postscript("plots/NJ.hsnps2.label2.eps")
#----
plot.phylo(t3, tip.color=cols, type="unrooted", cex=0.5)
#----
dev.off()
#----

#################
# WHOLE SAMPLE MAP
#################
library(maps)
library(data.table)
labels <- fread("data/labels-plink5-regions-colors-lat-long-sorted.csv",header=F)
colors <- fread("data/colors3.txt", header = F)

lab.col <- merge(colors, labels, by.x="V1", by.y="V3")
lab.col <- lab.col[nrow(lab.col):1, ]

#----
setEPS()
postscript("plots/sample_map.eps")
#----
map("world", col="black", interior=F,xlim=c(-24, 77),ylim=c(-34,70))
points(lab.col$V5,lab.col$V4, pch=lab.col$V3, col=lab.col$V2.x)
#----
dev.off()
#----


####################
#### WHOLE SET TREE
####################
x <- read.PLINK("data/Morocco1001.filtered.pruned.nomissing.raw",parallel = F) # had to remove 35520 because it's not there. Add it back in later
labs <- fread("data/labels-plink5-regions-colors.csv", stringsAsFactors = T)
x <- seploc(x, n.block=10, parallel=FALSE)
lD <- lapply(x, function(e) dist(as.matrix(e)))
D <- Reduce("+", lD)

#attr(D, "Labels") <- paste(labs$V3, rownames(D)) # <- causes problems!

cols <- rainbow(nlevels(labs$V3))
group <- as.factor(labs$V3)
pchs <- 1:nlevels(labs$V3)
t3 <- nj(D)

#----
setEPS()
postscript("plots/WholeSetNJ.eps")
#----
plot.phylo(t3, tip.color=cols[group], type="unrooted", cex=0.3, edge.width=0.1, no.margin=T,show.tip.label=F)
tiplabels(labs$V3,col=cols[group], cex=0.3, bg=NA, frame="none")
#----
dev.off()
#----

##################
## all admixture
##################
c25 <- c("dodgerblue2","#E31A1C", # red
         "green4",
         "#6A3D9A", # purple
         "#FF7F00", # orange
         "black","gold1",
         "skyblue2","#FB9A99", # lt pink
         "palegreen2",
         "#CAB2D6", # lt purple
         "#FDBF6F", # lt orange
         "gray70", "khaki2",
         "maroon","orchid1","deeppink1","blue1","steelblue4",
         "darkturquoise","green1","yellow4","yellow3",
         "darkorange4","brown")
names <- c("W Europe","C Europe",  "Germany", "N Sweden", "S Sweden", "Iberia", "C Asia", "IBC", "Ib Relict", "H Atlas", "N Mid Atlas", "Rif", "S Mid Atlas")
plotadmix <- function(path,k){
  admix <- read.table(path)
  barplot(t(as.matrix(admix)), col=c25,xlab="", ylab=paste("Ancestry K=", k, sep=""), border=NA, space=0)
  #axis(1, at=seq(3,length(admix$V1),by=7), labels=names, las=2, tick=F, cex.axis=0.9)
  #axis(1, at=seq(0,length(admix$V1),by=7), labels=NA)
  
  for (i in seq(7,length(labels$V2)-7,by=7)){
    abline(v=i,lty=2,col="white")
  }
}

plotadmix2 <- function(path,k){
  admix <- read.table(path)
  barplot(t(as.matrix(admix)), col=c25,xlab="", ylab=paste("Ancestry K=", k, sep=""), border=NA, space=0)
  axis(1, at=seq(3,length(admix$V1),by=7), labels=names, las=2, tick=F, cex.axis=0.9)
  axis(1, at=seq(0,length(admix$V1),by=7), labels=NA)
  
  for (i in seq(7,length(labels$V2)-7,by=7)){
    abline(v=i,lty=2,col="white")
  }
}

#----
setEPS()
postscript("plots/supp.admixture.eps",width=8.3,height=11.7)
par(mfrow=c(15,1), mar=c(0.5,4,0,0.1))
#----
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.2.Q",2)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.3.Q",3)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.4.Q",4)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.5.Q",5)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.6.Q",6)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.7.Q",7)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.8.Q",8)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.9.Q",9)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.10.Q",10)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.11.Q",11)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.12.Q",12)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.13.Q",13)
plotadmix("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.14.Q",14)
plotadmix2("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset4/admixture/replicate5.10/Morocco1001.filtered.filter7.pruned.nomissing.15.Q",15)
plot(1, type="n", axes=F, xlab="", ylab="")
#----
dev.off()
#----
