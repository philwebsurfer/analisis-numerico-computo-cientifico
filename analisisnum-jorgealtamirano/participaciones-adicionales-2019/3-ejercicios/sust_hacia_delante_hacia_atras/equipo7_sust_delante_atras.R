# Ejercicio sustitución hacia atrás y hacia adelante

# Método de sustitución hacia atrás
# A = matriz triangular superior

n = 4


A = matrix(c(4, -1, 2, 3,
            0, -2, 7, 4,
            0, 0, 6, 5 , 
             0, 0, 0, 3), nrow = 4, byrow = TRUE)

b = c(20, -7, 4, 6)

x = rep(0, n)

x[n] = b[n] / A[n, n]

for(i in (n-1):1){
  x[i] = b[i] - (A[i, (i+1):n] %*% x[(i + 1):n])
  x[i] = x[i] / A[i, i]
} 

# Solución: 5  4 -1  2

# Método de sustitución hacia adelante
# A = matriz triangular inferior
n = 4

A = matrix(c(3, 0, 0, 0,
             -1, 1, 0, 0,
             3, -2, -1, 0, 
             1, -2, 6, 2), nrow = 4, byrow = TRUE)

b = c(5, 6, 4, 2)

x = rep(0, n)

x[1] = b[1] / A[1, 1]

for(i in 2:n){
  x[i] = b[i] - (A[i, 1:(i-1)] %*% x[1:(i-1)])
  x[i] = x[i] / A[i, i]
}

# solución: 1.666667   7.666667 -14.333333  50.833333

