
Install MetaBAT2

1. On Proteus, the 'metabat2' file is ready to run. If you want to install its version in the future, you can run 'bash install_on_proteus.sh' 
2. To install on your local environment, go to https://bitbucket.org/berkeleylab/metabat/src/master/ for instructions.


Run MetaBAT2

./metabat2 -i <input.fasta> -o <bin directory>/<bin header> -v -m <min contig length>(optional) -a <depthfile>(optional)


Generate depth file (before running metabat,optional)

./jgi_summarize_bam_contig_depths --outputDepth depth.txt *.bam



Run CheckM

module load perl-threaded/5.26.2
module load oracle/jdk/1.7.0_current
module load samtools/1.2
module load bwa/master
module load groopm/0.3.5

checkm lineage_wf -f <resultfile> -t 8 -x fa <bin folder> <output folder>

(CheckM will take a long time to run. You can use submitter to run multiple jobs.)


visulization
In R:
>source('http://portal.nersc.gov/dna/RD/Metagenome_RD/MetaBAT/Files/benchmark.R')  # download scripts for visualizing the CheckM result
>printPerf(list(calcPerfBySCG("<checkm resultfile>")), rec=c(seq(.1,.9,.1),.95), prec=c(seq(.6,.9,.1),.95,.99))    #generate 'Recall vs Precision' matrix


>res <- list(calcPerfBySCG("<checkm resultfile>")
>pdf("Performance_By_Bin.pdf", width=8, height=8)
>plotPerf(res)    #recall,precision,F1 and F0.5 plots
>dev.off()
