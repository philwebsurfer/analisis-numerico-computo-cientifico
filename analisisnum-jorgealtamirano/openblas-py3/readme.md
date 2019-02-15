# Docker con python3 + numpy + OpenBLAS

Este Docker compila las librerías y ejecuta un benchmark de matrices y vectores en Python 3.

## Compilación / Construcción del contenedor

`docker build -t docker.io/philwebsurfer/openblas-py3:16.04 .`

## Ejecución del contenedor

Nota: he subido esta imagen de docker, por lo que si no se ha seguido el paso anterior, lo jala de Docker Hub.

`docker run -it docker.io/philwebsurfer/openblas-py3:16.04`

## Benchmarking

Ejecutar dentro del contenedor:
`python3 /root/bench.py`
