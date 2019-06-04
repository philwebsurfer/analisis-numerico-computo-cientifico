#Equipo 1
library(tidyverse)
x <-c(1:9) %>% as.matrix()
y <- c(1.3,3.5,4.2,5,7,8.8,10.1,12.5,13)
A <- matrix(c(rep(1,9),1:9),ncol=2)
#Aplicamos QR a los primeros datos
q <- qr(A)
Q <- qr.Q(q)
R <- qr.R(q)


R
Q_b <- t(Q) %*% y
Q_b
#nueva información
x_nuevo <- 10
y_nuevo <- 15.6

A_nueva <- matrix(c(R[,1],1,R[,2],x_nuevo,Q_b,y_nuevo), ncol=3)
A_nueva
#tenemos q multiplicar por una matriz de rotacion para q (3,1) se vuelva cero, y despues (3,2) sea cero
c <- A_nueva[1,1]/norm(c(A_nueva[1,1],A_nueva[3,1]),"2")
s <- A_nueva[3,1]/norm(c(A_nueva[1,1],A_nueva[3,1]),"2")
Rot_1 <-matrix(c(c,0,-s,0,1,0,s,0,c),ncol=3)
A_nueva2 <- Rot_1 %*% A_nueva

c <- A_nueva2[2,2]/norm(c(A_nueva2[2,2],A_nueva2[3,2]),"2")
s <- A_nueva2[3,2]/norm(c(A_nueva2[2,2],A_nueva2[3,2]),"2")
Rot_2 <-matrix(c(1,0,0,0,c,-s,0,s,c),ncol=3)
A_nueva3 <- Rot_2 %*% A_nueva2
#Por lo tanto beta_1 es
beta_1 <- A_nueva3[2,3]/A_nueva3[2,2]
beta_1
#y beta_0 es 
beta_0 <- (A_nueva3[1,3]-A_nueva3[1,2]*beta_1)/A_nueva3[1,1]
beta_0

#comprobacion
A2 <- matrix(c(A[,1],1,A[,2],x_nuevo),ncol=2)
y2 <- c(y,y_nuevo)
q2 <- qr(A2)
qr.coef(q2,y2)
#podemos observar que las betas nos dan igual 