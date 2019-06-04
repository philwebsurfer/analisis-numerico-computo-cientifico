library(tidyverse)

# Ajustar polinomio de grado 3 y 5 por mínimos cuadrados a los datos x, y:

x <- 1:10

y <- c(1.3, 3.5, 4.2, 5, 7, 8.8 ,10.1, 12.5, 13, 15.6)

px <- function(x, grado = 3) {
  if(grado == 3) 
    beta_0 * beta_1*x + beta_2*x^2 + beta_3*x^3
  else
    beta_0 * beta_1*x + beta_2*x^2 + beta_3*x^3 + beta_4*x^4 + beta_5*x^5
}

# Usando;
# 1) Ecuaciones normales (A^T*A*beta = A^T*b)
# 2) Factorización QR de A: R*beta = Q^T*b
# 
# Evaluar cond de la matriz del sistema a resolver y comparar la beta obtenida
# con las funciones ya programadas en el lenguaje para realizar el ajuste
# de los datos

data.frame(x = x, y = y) %>% 
  ggplot(aes(x, y)) +
  geom_point(size = 3, color = 'royal blue') +
  theme_minimal()

A <- matrix(rep(1, 40), ncol = 4)

for(i in 2:4) {
  A[,i] <- x^(i - 1)
}

# ecuaciones normales

solve(t(A) %*% A) %*% t(A) %*% y
  

# QR

Q <- qr.Q(qr(A))
R <- qr.R(qr(A))

solve(R) %*% t(Q) %*% y


