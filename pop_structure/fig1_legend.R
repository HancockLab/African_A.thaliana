# --------------------
# 1. Legend
# --------------------
setwd("/biodata/dep_coupland/grp_hancock/africa_arabidopsis/fullset5/")
#----
setEPS()
postscript("plots/legend1a.eps",width=12)
#----
plot(1, type="n", axes=FALSE, xlab="", ylab="")
legend.names <- c("Rif", "N. Mid Atlas", "S. Mid Atlas","High Atlas", "Tanzania")
legend.symbols <- c(19,19,19,19,17)
legend.colors <- c("#FDD42E", "#FF4534", "#FE7C2E", "#F1A916", "#940107")
legend("bottomleft",pch=legend.symbols,legend=legend.names,col=legend.colors, bty="n", cex=0.9)
#----
dev.off()
#----

#----
setEPS()
postscript("plots/legend1b.eps",width=12)
#----
plot(1, type="n", axes=FALSE, xlab="", ylab="")
legend.names <- c("Cape Verde", "Tanzania", "South Africa", "Algeria", "Iberian Relict (IR)")
legend.symbols <- c(17,15,15,15,17)
legend.colors <- c("#FDFA2F", "#8A6148", "#DB6E00", "#FCA874", "#9FD627")
legend("bottomleft",pch=legend.symbols,legend=legend.names,col=legend.colors, bty="n", cex=0.9)
#----
dev.off()
#----

#----
setEPS()
postscript("plots/legend1c.eps",width=12)
#----
plot(1, type="n", axes=FALSE, xlab="", ylab="")
legend.names <- c("W. Europe", "Germany", "N. Sweden", "Iberia Non-Relict (INR)", "Central Asia")
legend.symbols <- c(18,18,18,18,18)
legend.colors <- c("#2E9CFD", "#5124F1", "#1543F1", "#008A32", "#D52EED")
legend("bottomleft",pch=legend.symbols,legend=legend.names,col=legend.colors, bty="n", cex=0.9)
#----
dev.off()
#----

#----
setEPS()
postscript("plots/legend1d.eps",width=12)
#----
plot(1, type="n", axes=FALSE, xlab="", ylab="")
legend.names <- c("S. Sweden", "Italy, Balkans, Caucasus (IBC)", "Central Europe","Mount Qartaba","Mount Etna")
legend.symbols <- c(18,18,18,17,17)
legend.colors <- c("#336DFF", "#8F30FE", "#763CFF","#EA32E0","#67029E")
legend("bottomleft",pch=legend.symbols,legend=legend.names,col=legend.colors, bty="n", cex=0.9)
#----
dev.off()
#----

