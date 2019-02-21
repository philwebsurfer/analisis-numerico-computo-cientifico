# Docker con python3 + numpy *Sin* OpenBLAS

Este Docker compila las librerías y ejecuta un benchmark de matrices y vectores en Python 3 numpy utilizando optimizaciones de ATLAS.

## Compilación / Construcción del contenedor

`docker build -t docker.io/philwebsurfer/atlas-py3:16.04 .`

## Ejecución del contenedor

`docker run -it --rm docker.io/philwebsurfer/atlas-py3:16.04`

## Benchmarking

Ejecutar dentro del contenedor:
`python3 /root/bench.py`
