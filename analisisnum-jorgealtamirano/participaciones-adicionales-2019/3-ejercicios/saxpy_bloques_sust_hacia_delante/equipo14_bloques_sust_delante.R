#Ejercicio Sustitucion hacia adelante en bloques
### Clase 6 (06/03/2019) 


L2 <-matrix(c(3,0,0,0,
              2,1,0,0,
              1,5,1,0,
              7,9,8,4),nrow = 4, ncol = 4, byrow = TRUE)
Y <- matrix(c(-9,12,
              6,-1,
              2,0,
              5,1), nrow = 4, ncol = 2, byrow = TRUE)

x <- matrix(0, nrow=nrow(Y), ncol=ncol(Y))
N = nrow(Y)
for (i in 1:N){
  x[i,] <- Y[i,] / L2[i,i]
  for (j in i : N){
    Y[j,] = Y[j,] - L2[j,i]*x[i,]
  }
}
