library(data.table)
setwd("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset5/slocus")
data<- fread("tableS3_modified.csv")
# A;AC;C;B
colz <- c("khaki1", "lightskyblue", "seagreen", "firebrick3")

s.pie <- function (counts){
  f.name <- deparse(substitute(counts)) #grab the variable name
  setEPS()
  postscript(paste(f.name, ".eps", sep=""))
  pie(counts, NA, col=colz, border = NA, cex=2)
  dev.off()
}


rif <- c(14.3,0,14.3,71.4)
nma <- c(50,14.3,35.7,0)
sma <- c(32,8,60,0)
ha <- c(100,0,0,0)
we <- c(31.3,61.3,7.5,0)
ibc <- c(61.5,32.3,6.2,0)
ce <- c(70,22.5,7.5,0)
ca <- c(94.1,0,5.9,0)
ss <- c(73.2,21.8,4.9,0)
ns <- c(75,25,0,0)
g <- c(29.8,68.9,1.2,0)
ibr <- c(77.3,4.5,18.2,0)
ib <- c(50.7,45.1,4.2,0)
tanz <- c(0,0,100,0)

s.pie(rif)
s.pie(nma)
s.pie(sma)
s.pie(ha)
s.pie(we)
s.pie(ibc)
s.pie(ce)
s.pie(ca)
s.pie(ss)
s.pie(ns)
s.pie(g)
s.pie(ibr)
s.pie(ib)
s.pie(tanz)


#----
setEPS()
postscript("legend.eps",width=10)
#----
plot(1, type="n", axes=FALSE, xlab="", ylab="")
legend.names <- c("Hap A", "Hap A/C", "Hap C", "Hap B")

legend("bottomleft",legend=legend.names,fill=colz, bty="n", cex=0.9)
#----
dev.off()
#----