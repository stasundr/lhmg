#!/usr/bin/env bash

# April 11, 2016 v0.01

RUN apt-get update
RUN apt-get install -y wget unzip git nano task-spooler

RUN mkdir /root/software

# ADMIXTURE
	cd /root/software; \
	wget http://www.genetics.ucla.edu/software/admixture/binaries/admixture_linux-1.3.0.tar.gz; \
	tar -xzf admixture_linux-1.3.0.tar.gz; \
	rm admixture_linux-1.3.0.tar.gz; \
	ln -s /root/software/admixture_linux-1.3.0/admixture /usr/local/bin

# PLINK
	cd /root/software; \
	mkdir plink; \
	cd plink; \
	wget https://www.cog-genomics.org/static/bin/plink160331/plink_linux_x86_64.zip; \
	unzip plink_linux_x86_64.zip; \
	ln -s /root/software/plink/plink /usr/local/bin

# EIGENSOFT
	apt-get install -y libgsl0ldbl libgfortran3; \
	cd /root/software; \
	git clone https://github.com/DReichLab/EIG.git; \
	ln -s /root/software/EIG/bin/convertf /usr/local/bin; \
	ln -s /root/software/EIG/bin/smartpca /usr/local/bin

# ALDER
	apt-get install -y libfftw3-3 libfftw3-double3 libfftw3-long3 libfftw3-single3 liblapack3 libblas3; \
	cd /root/software; \
	wget http://groups.csail.mit.edu/cb/alder/alder_v1.03.tar.gz; \
	tar -xzf alder_v1.03.tar.gz; \
	rm alder_v1.03.tar.gz; \
	ln -s /root/software/alder/alder  /usr/local/bin

# Node.js
	cd /root/software; \
	wget https://nodejs.org/dist/v5.10.1/node-v5.10.1-linux-x64.tar.xz; \
	apt-get install xz-utils; \
	tar -xf node-v5.10.1-linux-x64.tar.xz; \
	rm node-v5.10.1-linux-x64.tar.xz; \
	ln -s /root/software/node-v5.10.1-linux-x64/bin/node  /usr/local/bin

# Dataset from Lazaridis et al., 2014
    mkdir /data; \
    cd /data; \
    wget http://genetics.med.harvard.edu/reich/Reich_Lab/Datasets_files/EuropeFullyPublic.tar.gz; \
    tar -xzf EuropeFullyPublic.tar.gz; \
    rm EuropeFullyPublic.tar.gz