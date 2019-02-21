FROM ubuntu:16.04

# Jorge III Altamirano Astorga, Ariel Vallarino, Eduardo Martínez Mayorga 

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y python3 python3-pip curl


#instalar dependencias python3
RUN pip3 install pandas numpy

#install benchmark
COPY bench.py /root
COPY comp.py /root
RUN cd /root \
	&& python3 comp.py \
	&& cat compare.*.csv \
	&& echo ========================================================================== \
	&& echo ========================================================================== \
	&& python3 bench.py

