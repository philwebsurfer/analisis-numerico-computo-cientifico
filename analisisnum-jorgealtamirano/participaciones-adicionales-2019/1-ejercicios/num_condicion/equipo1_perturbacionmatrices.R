# Métodos Numéricos y de Optimización
# Equipo 1

library(Matrix)
library(pracma)

# Definimos matriz A
n<-20
A<-matrix(rep(-1,n*n),ncol=n)
diag(A)<-rep(1,n)
A[lower.tri(A)]<-0

# Imprimimos condición de la matriz euclidiana y su orden
cond(A,2); nchar(trunc(cond(A,2))) # Condición de la matriz es de orden 1e7

# Definimos b
b<-rep(-1,n)
b[n]<-1

# Resolvemos y obtenemos norma de resultado
x1<-solve(A,b)
n1<-norm(x1,"2")
x1;n1


# Perturbamos b
b[n]<-1.0001*b[n]

# Resolvemos y obtenemos norma de resultado
x2<-solve(A,b)
n2<-norm(x2,"2")
x2;n2

# Pasamos de norma en x1 de 1 a norma de x2 de 30.2863

# Calculamos cambio en normas de soluciones 
(n2-n1)/n1 # Aumento de 2928.63%

# Cambio en norma respecto al aumento
(n2-n1)/0.0001 # Error relativo 292863

# El cambio drástico se debe a la elevada condición_2 de la matriz

