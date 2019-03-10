# Docker con python3 + numpy + ATLAS

Este Docker compila las librerías y ejecuta un benchmark de matrices y vectores en Python 3 numpy utilizando optimizaciones de ATLAS.

## Compilación / Construcción del contenedor

`docker build -t docker.io/philwebsurfer/atlas-py3:16.04 .`

Nota: no es necesario reconstruirlo, pues está disponible en [Docker Hub: ATLAS](https://hub.docker.com/r/philwebsurfer/atlas-py3).

## Ejecución del contenedor

`docker run -it --rm docker.io/philwebsurfer/atlas-py3:16.04`

## Benchmarking

Ejecutar dentro del contenedor:
`python3 /root/bench.py`
