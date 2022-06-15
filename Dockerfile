ARG BASE_OS="ubuntu:18.04"
FROM ${BASE_OS}

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y cmake gcc make git python3-pip autoconf \
    automake psmisc libtbb-dev libjemalloc-dev libboost-all-dev libpapi-dev \
    libjpeg-dev wget software-properties-common asciidoctor time
RUN pip3 install pymemcache redis matplotlib networkx
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/bionic llvm-toolchain-bionic-9 main"
RUN apt-get update
RUN apt-get install -y llvm-9 llvm-9-dev clang-9 llvm-9-tools

ENV PMEM_MMAP_HINT=600000000000
ENV PMEM_IS_PMEM_FORCE=1
ENV NDCTL_ENABLE=n
ENV LLVM9_HOME=/usr/lib/llvm-9/
ENV LLVM9_BIN=/usr/bin
ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++
ENV WITCHER_HOME=/root/witcher/

RUN for x in $LLVM9_BIN/*-9; do cp $x ${x/-9/}; done
COPY benchmark $WITCHER_HOME/benchmark
COPY giri $WITCHER_HOME/giri
COPY pmdk-1.8 $WITCHER_HOME/pmdk-1.8
COPY replay $WITCHER_HOME/replay
COPY third_party $WITCHER_HOME/third_party
COPY script $WITCHER_HOME/script
WORKDIR $WITCHER_HOME/script
RUN ./build.sh
RUN python3 instrument.py
COPY collect-resources.sh /usr/bin/collect-resources
