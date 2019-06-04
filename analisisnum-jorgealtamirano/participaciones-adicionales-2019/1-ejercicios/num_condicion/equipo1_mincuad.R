# Métodos Numéricos y de Optimización
# Equipo 1

library(Matrix)

# Ajustar por mínimos cuadrados polinomio de grado 3 y de grado 5 por mínimos cuadrados
x<-1:10
y<-c(1.3,3.5,4.2,5,7,8.8,10.1,12.5,13,15.6)

# Usando
# 1) Ecuaciones nmormales:  (t(A)%*%A)%*%beta=t(A)%*%b
# 2) Factorización QR de A: R%*%beta=t(Q)%*%b

# Evaluar condicion de la matriz del sistema a resolver y comparar
# la beta obtenida con las funciones ya programadas para el ajuste.

#### Polinomio grado 3 ####

A<-cbind(rep(1,10),x,x^2,x^3)
colnames(A)<-paste0("x",0:3)

# 1) Ecuaciones normales
H<-t(A)%*%A
y_hat<-t(A)%*%y

# Cholesky
beta_hat<-solve(H,y_hat,system="A")
beta_hat

# Condición de H
cond_hat<-kappa(H,exact=T,norm="2")
cond_hat

# 1) QR
qr_prob<-qr(A)
Q<-qr.Q(qr_prob)
R<-qr.R(qr_prob)

beta_qr<-solve(R,t(Q)%*%y,system="A")
beta_qr

# Condición de R
cond_qr<-kappa(R,exact=T,norm="2")
cond_qr

# Comparamos con lm en R
datos<-as.data.frame(cbind(y,A[,2:4]))
reg<-lm(y~.,datos)$coefficients

error_rel_hat<-norm(beta_hat-as.numeric(reg),type="2")/norm(as.numeric(reg),type="2")
error_rel_hat
error_rel_qr<-norm(beta_qr-as.numeric(reg),type="2")/norm(as.numeric(reg),type="2")
error_rel_qr

#### Polinomio grado 5 ####

A<-cbind(rep(1,10),x,x^2,x^3,x^4,x^5)
colnames(A)<-paste0("x",0:5)

# 1) Ecuaciones normales
H<-t(A)%*%A
y_hat<-t(A)%*%y

# Cholesky
beta_hat<-solve(H,y_hat,system="A")
beta_hat

# Condición de H
cond_hat<-kappa(H,exact=T,norm="2")
cond_hat

# 1) QR
qr_prob<-qr(A)
Q<-qr.Q(qr_prob)
R<-qr.R(qr_prob)

beta_qr<-solve(R,t(Q)%*%y,system="A")
beta_qr

# Condición de R
cond_qr<-kappa(R,exact=T,norm="2")
cond_qr

# Comparamos con lm en R
datos<-as.data.frame(cbind(y,A[,2:6]))
reg<-lm(y~.,datos)$coefficients

error_rel_hat<-norm(beta_hat-as.numeric(reg),type="2")/norm(as.numeric(reg),type="2")
error_rel_hat
error_rel_qr<-norm(beta_qr-as.numeric(reg),type="2")/norm(as.numeric(reg),type="2")
error_rel_qr

