FROM ubuntu:16.04

# Jorge III Altamirano Astorga, Ariel Vallarino, Eduardo Martínez Mayorga 

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y gfortran git make \
	&& apt-get install -y python3 python3-setuptools python3-pip cython

RUN cd /tmp \
	&& git clone https://github.com/xianyi/OpenBLAS \
	&& cd OpenBLAS \
	&& make FC=gfortran \
	&& make PREFIX=/usr/local install

#compilar numpy
RUN cd /tmp \
	&& git clone https://github.com/numpy/numpy \
	&& cd numpy \
	&& python3 setup.py config \
	&& pip3 install .

#install benchmark
RUN cd /tmp \
	&& wget -O /tmp/bench.py '' \
	&& python3 bench.py

