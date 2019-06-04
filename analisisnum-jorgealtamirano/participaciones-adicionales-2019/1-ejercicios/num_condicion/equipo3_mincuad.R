#Tarea equipo 3
library(Matrix)
#Ejercicio: Ajustar curva (polinomio de grado 3) por minimos cuadrados a los datos:
#x=(1:10)   y=(1.3,3.5,4.2,5,7,8.8,10.1,12.5,13,15.6)
#p(x)=B0+B1X+B2x+B3X
#1.-Usando ecuaciones normales At*Beta=Atb
#2.- Factorización QR de A: R*Beta=Qt*b
#3.-Evaluar condición de la matriz 
uno<-rep(1,10)
x1<-c(1,2,3,4,5,6,7,8,9,10)
x2<-x1^2
x3<-x1^3
y<-c(1.3,3.5,4.2,5,7,8.8,10.1,12.5,13,15.6)

A<-as.matrix(cbind(uno,x1,x2,x3));A
 
AtA<-t(A)%*%A;AtA
ben<-t(A)%*%y;b_en
#numero de condición
kappa(AtA,exact = T)
#betas ecuaciones normales
beta_en<-solve(AtA,ben);beta_en

#2. Factorización QR
#betas usando QR
qa<-qr(A)
Q<-qr.Q(qa)
R<-qr.R(qa)
bqr<-t(Q)%*%y
beta_qr<-solve(R,bqr);beta_qr
#numero de condición
R<-qr.R(qr(A))
kappa(R,exact=A)
  
#Función ya programada en R (lm)
datos<-data.frame(x1,x2,x3,y)
beta_lm<-lm(y ~ x1+x2+x3,data=datos)$coefficients;beta_lm

#comparación con lm
err_rel_en<- norm(beta_en-beta_lm,type = "2")/norm(beta_lm,type="2")
err_rel_en

err_rel_qr<- norm(beta_qr-beta_lm,type = "2")/norm(beta_lm,type="2")
err_rel_qr

