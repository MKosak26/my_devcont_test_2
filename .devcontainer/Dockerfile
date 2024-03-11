FROM ubuntu:22.04

# install base packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    software-properties-common \
    canmatrix-utils \
    clangd \
    clang-format \
    clang-tidy \
    cmake \
    cmake-format \
    cppcheck \
    dos2unix \
    doxygen \
    doxygen-latex \
    gcc \
    g++ \
    gcc-multilib \
    g++-multilib \
    gcc-arm-none-eabi \
    gdb-multiarch \
    git \
    gnupg2 \
    graphviz \
    libnewlib-arm-none-eabi \
    locales \
    make \
    ninja-build \
    openocd \
    openssh-client \
    python3 \
    python3-pip \
    srecord \
    stlink-tools \
    udev \
    unzip \
    wget \
    zip \
    nano \
    && \
    rm -rf /var/lib/apt/lists/*

# install Python dependencies
RUN \
    pip3 install --no-cache-dir GitPython  \
    pyserial \
    rich \
    xtea \
    pyocd \
    python-can==3.3.4 \
    cantools==36.4.0 \
    canmatrix[xls]
    
RUN ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb


# Source file mora biti tamo gdje i Dockerfile (unutar .devcontainers) da bi se mogla dodati datoteka !
ADD datoteke_za_u_image /root/home/datoteke_za_u_image
