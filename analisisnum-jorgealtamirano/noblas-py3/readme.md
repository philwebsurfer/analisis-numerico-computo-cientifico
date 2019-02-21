# Docker con python3 + numpy *Sin* OpenBLAS

Este Docker compila las librerías y ejecuta un benchmark de matrices y vectores en Python 3 *sin utilizar OpenBLAS u optimizaciones máquina*.

## Compilación / Construcción del contenedor

`docker build -t docker.io/philwebsurfer/noblas-py3:16.04 .`

Nota: no es necesario reconstruirlo, pues está disponible en [Docker Hub: ATLAS](https://hub.docker.com/r/philwebsurfer/noblas-py3).

## Ejecución del contenedor

`docker run -it --rm docker.io/philwebsurfer/noblas-py3:16.04`

## Benchmarking

Ejecutar dentro del contenedor:
`python3 /root/bench.py`
