m<-read.table("data/w_m.txt.y.array.txt")
e<-read.table("data/w_europe.txt.y.array.txt")
i<-read.table("data/within_iberia_no_rel.txt.y.array.txt")
a<-read.table("data/central_asia.txt.y.array.txt")


datalist = list()
for (j in 1:32){

    eurasia <- kruskal.test(list(e[,j],i[,j],a[,j]))
    morocco <- kruskal.test(list(m[,j],e[,j],i[,j],a[,j]))

#    datalist[[j]] <- c(j, eurasia$p.value, morocco$p.value)    
     datalist[[j]] <- c(j, morocco$p.value)
}
bob <- do.call(rbind,datalist)
write.table(bob,file="kw_test.txt", row.names=F, col.names=F)

#bob <- read.table("significance_test.txt")

#pdf("plots/KW.test.pdf")
#plot(bob$V1, bob$V2, xlim=rev(c(1,32)), ylim=rev(c(1e-29,1)), log="y", pch=19, ylab="log(p-value)", xlab="Time step", col="blue", main="Kruskal-Wallis Rank Sum test across MSMC time bins")
#points(bob$V1, bob$V3, pch=19, col="orange")
#abline(h=0.05, lty=2, col="#DCDCDC")
#abline(h=0.01, lty=2, col="#A9A9A9")
#abline(h=0.001, lty=2, col="#696969")
#abline(h=0.0001, lty=2, col="black")
#legend("topleft", legend=c("Mor, Ib., Asia, Eur", "Ib., Asia, Eur"), pch=19, col=c("orange", "blue"), bty="n")
#dev.off()