
#en la t2.micro:

aws s3 cp mi_notebook.ipynb s3://mi-bucket-<user>/

#hacemos instalación de paqueterías en el contenedor

#commit:

sudo docker commit $nombre_contenedor $nombre_imagen


# crear user en dockerhub

# taggear imagen como: <user>/jupyterlab:latest

sudo docker tag $nombre_imagen <user>/jupyterlab:latest

# docker login:

sudo docker login

# push

sudo docker push <user>/jupyterlab:latest

#para descargar:


1)docker instalado
2)ejecutar:

sudo docker pull <user>/jupyterlab:latest








