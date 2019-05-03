source('http://portal.nersc.gov/dna/RD/Metagenome_RD/MetaBAT/Files/benchmark.R')
res <- list(m2500=calcPerfBySCG("bins_2500/CheckM.txt", removeStrain=F),m2000=calcPerfBySCG("bins_2000/CheckM.txt"),m1500=calcPerfBySCG("bins_1500/CheckM.txt"),maxP90_minS65=calcPerfBySCG("bins_0000/CheckM.txt))

res1 <- list(MetaBAT=calcPerfBySCG("bins_2500/CheckM.txt"),CONCOCT=calcPerfBySCG("concoct_output/CheckM.txt"))

printPerf(res)
printPerf(res1)

pdf("Performance_By_Bin.pdf", width=8, height=8)
plotPerf(res,xlim=30)
plotPerf3(res1,prec=.9)
dev.off()

