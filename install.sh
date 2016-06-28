#!/usr/bin/env bash

# June 28, 2016 v0.03 (for ubuntu:xenial)

SOFTWARE='/home'

apt-get update
apt-get install -y wget unzip git nano task-spooler

mkdir -p ${SOFTWARE}

# ADMIXTURE
cd ${SOFTWARE}; \
wget http://www.genetics.ucla.edu/software/admixture/binaries/admixture_linux-1.3.0.tar.gz; \
tar -xzf admixture_linux-1.3.0.tar.gz; \
rm admixture_linux-1.3.0.tar.gz; \
ln -s ${SOFTWARE}/admixture_linux-1.3.0/admixture /usr/local/bin

# PLINK
cd ${SOFTWARE}; \
mkdir plink; \
cd plink; \
wget https://www.cog-genomics.org/static/bin/plink160607/plink_linux_x86_64.zip; \
unzip plink_linux_x86_64.zip; \
ln -s ${SOFTWARE}/plink/plink /usr/local/bin

# EIGENSOFT
apt-get install -y libgsl0-dev libgfortran3 libopenblas-dev; \
cd ${SOFTWARE}; \
# git clone https://github.com/DReichLab/EIG.git; \
wget https://data.broadinstitute.org/alkesgroup/EIGENSOFT/EIG6.1.1.tar.gz; \
tar -xzf EIG6.1.1.tar.gz; \
rm EIG6.1.1.tar.gz; \
ln -s ${SOFTWARE}/EIG6.1.1/bin/convertf /usr/local/bin; \
ln -s ${SOFTWARE}/EIG6.1.1/bin/smartpca /usr/local/bin; \
wget http://gnu.mirror.vexxhost.com/gsl/gsl-1.6.tar.gz; \
tar -zxvf gsl-1.6.tar.gz; \
rm gsl-1.6.tar.gz; \
cd gsl-1.6; \
./configure; \
make; \
sudo make install; \
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc; \
echo 'export CFLAGS="-I/usr/local/include"' >> ~/.bashrc; \
echo 'export LDFLAGS="-L/usr/local/lib"' >> ~/.bashrc; \
source ~/.bashrc

# ALDER
apt-get install -y libfftw3-3 libfftw3-double3 libfftw3-long3 libfftw3-single3 liblapack3 libblas3; \
cd ${SOFTWARE}; \
wget http://groups.csail.mit.edu/cb/alder/alder_v1.03.tar.gz; \
tar -xzf alder_v1.03.tar.gz; \
rm alder_v1.03.tar.gz; \
ln -s ${SOFTWARE}/alder/alder  /usr/local/bin

# BWA
cd ${SOFTWARE}; \
git clone https://github.com/lh3/bwa.git; \
cd bwa; \
make; \
ln -s ${SOFTWARE}/bwa/bwa  /usr/local/bin

# Node.js
NODE_VERSION='v6.2.2'
cd ${SOFTWARE}; \
wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz; \
apt-get install xz-utils; \
tar -xf node-${NODE_VERSION}-linux-x64.tar.xz; \
rm node-${NODE_VERSION}-linux-x64.tar.xz; \
ln -s ${SOFTWARE}/node-${NODE_VERSION}-linux-x64/bin/node  /usr/local/bin
ln -s ${SOFTWARE}/node-${NODE_VERSION}-linux-x64/bin/npm  /usr/local/bin

# REDIS
REDIS='redis-3.2.1'
apt-get install -y make gcc; \
cd ${SOFTWARE}; \
wget http://download.redis.io/releases/${REDIS}.tar.gz; \
tar -xzf ${REDIS}.tar.gz; \
rm ${REDIS}.tar.gz; \
cd ${REDIS}/deps; \
make hiredis lua jemalloc linenoise; \
cd ..; \
make; \
make install