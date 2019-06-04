n <- 4
aux = 0

# Inicializamos los arreglos de la sustitución hacia atras.
A_atras <- rbind(c(4,-1,2,3),c(0,-2,7,-4),c(0,0,6,5),c(0,0,0,3));
B_atras <- c(20,-7,4,6);

# Creamos la matriz solución y la inicializamos con ceros.
x <- matrix(data = 0, nrow = n, ncol = 1)
# Calculamos el último valor.
x[n] = B_atras[n]/A_atras[n,n]
# Calculamos los valores restantes (de abajo hacia arriba).
for(i in (n-1):1) {
  x[i] <- (B_atras[i] - A_atras[i,(i+1):n]%*%x[(i+1):n]) / A_atras[i,i]
};
x_atras <- x

# Inicializamos los arreglos de la sustitución hacia adelante.
A_adelante <- rbind(c(3,0,0,0),c(-1,1,0,0),c(3,-2,-1,0),c(1,-2,6,2));
B_adelante <- c(5,6,4,2);

# Creamos la matriz solución y la inicializamos con ceros.
x <- matrix(data = 0, nrow = n, ncol = 1)
# Calculamos el primer valor.
x[1] = B_adelante[1]/A_adelante[1,1]
# Calculamos los valores restantes (de arriba hacia abajo).
for(i in 2:n) {
  x[i] <- (B_adelante[i] - A_adelante[i,1:(i-1)]%*%x[1:(i-1)]) / A_adelante[i,i]
};
x_adelante <- x


# Solución eliminación Gaussiana
# Sustitución hacia atrás:
x_atras
# Sustitución hacia adelante:
x_adelante

