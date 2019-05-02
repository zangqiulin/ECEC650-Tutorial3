#!/bin/bash

cd ~
. /etc/profile.d/modules.sh
module load shared
module load proteus
module load sge/univa
module load gcc/4.8.1
module load qiime2/2018.8.0

. $CONDA_HOME/etc/profile.d/conda.sh
conda create --name myenv
conda activate myenv
conda install -c bioconda metabat2
conda install -c bioconda/label/cd201901 metabat2

mkdir MetaBAT
cp .conda/pkgs/metabat2-2.12.1*/bin/* ~/MetaBAT/
