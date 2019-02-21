FROM ubuntu:16.04

# Jorge III Altamirano Astorga, Ariel Vallarino, Eduardo Martínez Mayorga 

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y gfortran git make \
	&& apt-get install -y python3 python3-setuptools python3-pip cython curl libatlas-base-dev

#RUN cd /tmp \
#	&& curl https://iweb.dl.sourceforge.net/project/math-atlas/Stable/3.10.3/atlas3.10.3.tar.bz2 | tar xfj - \
#	&& curl -o lapack-3.8.0.tar.gz http://www.netlib.org/lapack/lapack-3.8.0.tar.gz \
#	&& mkdir ATLAS/build && cd ATLAS/build \
#	&& ../configure -b 64 --shared --with-netlib-lapack-tarfile=../../lapack-3.8.0.tar.gz \
#	&& make \
#	&& make install

#compilar numpy
RUN cd /tmp \
	&& git clone https://github.com/numpy/numpy \
	&& cd numpy \
	&& python3 setup.py build -j 12 install \
	&& pip3 install pandas

#install benchmark
COPY bench.py /root
COPY comp.py /root
RUN cd /root \
	&& ldconfig \
	&& python3 comp.py \
	&& cat compare.*.csv \
	&& echo ========================================================================== \
	&& echo ========================================================================== \
	&& python3 bench.py

