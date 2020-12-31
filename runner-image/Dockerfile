FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update
RUN apt-get install -y wget libdlib-dev libblas-dev liblapack-dev libjpeg-turbo8

