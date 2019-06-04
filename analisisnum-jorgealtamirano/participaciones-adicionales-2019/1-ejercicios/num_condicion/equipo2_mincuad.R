#vectores y matrices definicion

x<-1:10
y<-c(1.3,3.5,4.2,5,7,8.8,10.1,12.5,13,15.6)
A<-cbind(rep(1,10),x,x^2,x^3)

# Ecuaciones Normales
A_prima <-  t(A)%*%A
b_prima <-  t(A)%*%y

kappa(A_prima,exact = T)

b_norm <-  solve(A_prima,b_prima)

# Condición problema
cond_aprim <- kappa(A_prima,exact=T,norm="2")

# QR
qr_prob<-qr(A)
Q <- qr.Q(qr_prob)
R <- qr.R(qr_prob)

b_qr <- solve(R,t(Q)%*%y,system="A")

#LM

b_lm <- lm.fit(x = A, y=y)$coefficients

