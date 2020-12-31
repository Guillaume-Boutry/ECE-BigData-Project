FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update
RUN apt-get install -y libdlib-dev libblas-dev liblapack-dev libjpeg-turbo8-dev golang-go swig git

ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
ENV CGO_CXXFLAGS "-ldlib -lstdc++ -std=c++11 -lblas -lm -llapack -lsass"
ENV CGO_LDFLAGS "-llapack -ldlib -lblas -ljpeg"
WORKDIR /app
