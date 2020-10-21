FROM ubuntu:18.04

# Use Jonathonf PPA for Python 3.6
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    #add-apt-repository ppa:jonathonf/python-3.6 && \
    apt-get update -y

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get install -y build-essential && \
    apt-get install -y \
        python3.6 \
        python3.6-dev \
        python3.6-venv \
        curl \
        unzip \
        libopenmpi-dev \
        git \
        libopenblas-base  \
        xorg-dev \
        xvfb \
        x11vnc \
        libosmesa6-dev \
        freeglut3-dev \
        patchelf \
        libglfw3-dev

# Manually install PIP so we don't get Python 3.5 deps
RUN apt-get install -y python3-distutils
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN ln -s /usr/bin/python3.6 /usr/bin/python
RUN pip install --upgrade pip

RUN mkdir ~/.vnc
#RUN git clone https://github.com/cjenssen0/spinningup.git
#RUN git clone https://github.com/jonasnm/spinningup.git
RUN git clone https://github.com/jonasnm/spinningup.git
RUN git clone https://github.com/cjenssen0/soc-exp-pybullet.git

# Install dependencies
RUN pip install \
    numpy \
    cffi \
    Cython \
    jupyter \
    pybullet \
    lockfile

# MuJoCo & MuJoCo-py
WORKDIR /root
#RUN mkdir /root/.mujoco && \
    #cd /root/.mujoco/ && \
    #curl -O https://www.roboti.us/download/mjpro150_linux.zip && \
    #unzip mjpro150_linux.zip
    
#ADD mjkey.txt /root/.mujoco/mjkey.txt

#RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.mujoco/mjpro150/bin && \
    #pip install mujoco-py

# Install Spinning Up
WORKDIR /spinningup
RUN pip install -e .
RUN git checkout soc-pybullet

