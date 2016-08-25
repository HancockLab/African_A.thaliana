library(data.table)
setwd("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset2/")
gen <- 1.0/1000 # division is so that units are thousand years ago
mu <- 7e-9
xlim1 <- 120000/1000
xlim2 <- 20000/1000
# temp
temp <- fread("msmc2-xcoal/temp.csv")
# eurasia
Group1xGroup2<-read.table("msmc2-xcoal/combined/9925_9935x768_772.combined.txt", header=TRUE)

# Moroccan lines
HAxNMA<-read.table("msmc2-xcoal/combined/22010_18516x22001_22000.combined.txt", header=TRUE)
HAxR<-read.table("msmc2-xcoal/combined/22010_18516x22007_21999.combined.txt", header=TRUE)
RxNMA<-read.table("msmc2-xcoal/combined/22001_22000x22007_21999.combined.txt", header=TRUE)
SMAxHA<-read.table("msmc2-xcoal/combined/22010_18516x22002_18514.combined.txt", header=TRUE)
SMAxNMA<-read.table("msmc2-xcoal/combined/22002_18514x22001_22000.combined.txt", header=TRUE)
SMAxR<-read.table("msmc2-xcoal/combined/22002_18514x22007_21999.combined.txt", header=TRUE)

# Levant and Tanzania!
#MorxLev<-read.table("msmc2-xcoal/combined2/22001_22000x9764_21138.combined.txt", header=TRUE)
MorxLev<-read.table("msmc2-xcoal/combined2/22001_22000x9764_9761.combined.txt", header=TRUE)
TanzxMor<-read.table("msmc2-xcoal/combined2/35520_211399x22001_22000.combined.txt", header=TRUE)
#TanzxLev<-read.table("msmc2-xcoal/combined2/35520_211399x9764_21138.combined.txt", header=TRUE)
TanzxLev<-read.table("msmc2-xcoal/combined2/35520_211399x9764_9761.combined.txt", header=TRUE)

# Herbarium
SaHxTanz <- read.table("msmc2-xcoal/combined2/AH0001_AH0002x35520_211399.combined.txt", header=TRUE)
SaHxMO <- read.table("msmc2-xcoal/combined2/22001_22000xAH0001_AH0002.combined.txt", header=TRUE)

# Others added in
Group1xNMA<-read.table("msmc2-xcoal/combined/9925_9935x22001_22000.combined.txt", header=TRUE)
Group2xNMA<-read.table("msmc2-xcoal/combined/768_772x22001_22000.combined.txt", header=TRUE)

# Levant eurasia
Group1xLevant<-read.table("msmc2-xcoal/combined2/9925_9935x9764_21138.combined.txt", header=TRUE)
Group2xLevant<-read.table("msmc2-xcoal/combined2/768_772x9764_21138.combined.txt", header=TRUE)


# means
mor.l00 <- rowMeans(cbind(Group1xNMA$lambda_00,Group2xNMA$lambda_00))
mor.l01 <- rowMeans(cbind(Group1xNMA$lambda_01,Group2xNMA$lambda_01))
mor.l11 <- rowMeans(cbind(Group1xNMA$lambda_11,Group2xNMA$lambda_11))

# set up plot (years on top)


#----
setEPS()
postscript("msmc2-xcoal/3B-new_levant.eps")
#----
par(oma=c(0,0,0,2))
plot(Group1xNMA$left_time_boundary*gen/mu, 2 * Group1xNMA$lambda_01 / (Group1xNMA$lambda_00 + Group1xNMA$lambda_11), xlim=rev(c(xlim2,xlim1)),ylim=c(0,1), type="n", xlab="Thousand years ago", ylab="Relative Cross-Coalescence Rate", main="",log="x")

# add in lines
lines(Group1xNMA$left_time_boundary*gen/mu, 2 * mor.l01 / (mor.l00 + mor.l11), col="darkolivegreen4", type="s", lwd=2)

lines(Group1xGroup2$left_time_boundary*gen/mu, 2 * Group1xGroup2$lambda_01 / (Group1xGroup2$lambda_00 + Group1xGroup2$lambda_11), col="blue", type="s", lwd=2)

lines(MorxLev$left_time_boundary*gen/mu, 2 * MorxLev$lambda_01 / (MorxLev$lambda_00 + MorxLev$lambda_11), col="Turquoise", type="s", lwd=2)
lines(TanzxMor$left_time_boundary*gen/mu, 2 * TanzxMor$lambda_01 / (TanzxMor$lambda_00 + TanzxMor$lambda_11), col="firebrick", type="s", lwd=2)
lines(TanzxLev$left_time_boundary*gen/mu, 2 * TanzxLev$lambda_01 / (TanzxLev$lambda_00 + TanzxLev$lambda_11), col="sienna2", type="s", lwd=2)


# Herbariun
lines(SaHxTanz$left_time_boundary*gen/mu, 2 * SaHxTanz$lambda_01 / (SaHxTanz$lambda_00 + SaHxTanz$lambda_11), col="goldenrod", type="s", lwd=2)
lines(SaHxMO$left_time_boundary*gen/mu, 2 * SaHxMO$lambda_01 / (SaHxMO$lambda_00 + SaHxMO$lambda_11), col="pink", type="s", lwd=2)


# add in temp
par(new=T)
plot(temp$top_age/1000, temp$temp, xlim=rev(c(xlim2,xlim1)), ylim=c(-10,0),col="grey",xaxt="n",yaxt="n",xlab="",ylab="", type="s", lty=5, log='x')
mtext("Temperature change from present",side=4,line=2.5) 
axis(4)

# legend for all
legend("bottomleft", c("Europe-Asia", "Morocco-Eurasia", "Morocco-Levant", "Morocco-Tanzania", "Levant-Tanzania", "S. Africa (H)-Morocco", "S. Africa (H)-Tanzania", expression(paste(Delta,degree,"C"))), col=c("blue", "darkolivegreen4", "turquoise", "firebrick", "sienna2","pink","goldenrod", "grey"), lty=c(1,1,1,1,1,1,1,5), bty="n", cex=0.9)  

#----
dev.off()
#----
