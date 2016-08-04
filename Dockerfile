FROM ubuntu:xenial
COPY install.sh /home
RUN sh /home/install.sh; rm /home/install.sh

# qp3Pop precompiled
RUN mkdir /home/AdmixTools
COPY misc/qp3Pop /home/AdmixTools
RUN ln -s /home/AdmixTools/qp3Pop /usr/local/bin