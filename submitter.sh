#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -M qz85@drexel.edu
#$ -P rosenclassPrj
#$ -l h_rt=5:00:00
#$ -l h_vmem=10G
#$ -l m_mem_free=10G
#$ -q all.q
. /etc/profile.d/modules.sh
module load proteus
module load gcc/4.8.1
module load sge/univa
module load shared
module load perl-threaded/5.26.2
module load oracle/jdk/1.7.0_current
module load samtools/1.2
module load bwa/master
module load groopm/0.3.5

./metabat2 -i gsa_anonymous.fasta -o bins_dir/bins -v 

checkm lineage_wf -f bins_dir/CheckM.txt -t 8 -x fa bins_dir/ bins_dir/SCG


