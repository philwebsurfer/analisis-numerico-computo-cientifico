# Docker con python3 + numpy + OpenBLAS

Este Docker compila las librerías y ejecuta un benchmark de matrices y vectores en Python 3.

## Compilación / Construcción del contenedor

`docker build -t docker.io/philwebsurfer/openblas-py3:16.04 .`

Nota: no es necesario reconstruirlo, pues está disponible en [Docker Hub: ATLAS](https://hub.docker.com/r/philwebsurfer/openblas-py3).

## Ejecución del contenedor

`docker run -it docker.io/philwebsurfer/openblas-py3:16.04`

## Benchmarking

Ejecutar dentro del contenedor:
`python3 /root/bench.py`
