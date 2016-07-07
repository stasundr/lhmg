FROM ubuntu:xenial
COPY install.sh /home
RUN sh /home/install.sh; rm /home/install.sh