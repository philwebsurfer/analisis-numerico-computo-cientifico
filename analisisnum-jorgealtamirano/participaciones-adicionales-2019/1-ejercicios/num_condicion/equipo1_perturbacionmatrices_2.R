#Grupo_1: Rodrigo Floriano, Carlos Michel, Paulina Gómez Mont
library(pracma)

#Ejemplo 1
#matriz a)
#definimops una matriz A
A=matrix(c(1,2,5,4), nrow=2,ncol=2)
#calculamos su número de condición
cond_A <- cond(A,2)

#resolvemos x para b
b <- c(1,2)
x <- solve(A,b)

#cambiamos un poco A
A_r=matrix(c(2,0,10,1), nrow=2,ncol=2)+A
#calcumaos x estimada
x_r <- solve(A_r,b)
#estimamos el residual
r <- A%*%x_r-b
print("La cota inferior del error relativo es")
(norm(r,"2")/norm(b,"2"))*(1/cond_A)
print("La cota superior del error relativo es")
(norm(r,"2")/norm(b,"2"))*(cond_A)
print("El error relativo es:")
(norm(x-x_r,"2")/norm(x,"2"))

#matriz b)
#definimops una matriz A
A=matrix(c(24,-2,1,0.5), nrow=2,ncol=2)
#calculamos su número de condición
cond_A <- cond(A,2)

#resolvemos x para b
b <- c(1,1)
x <- solve(A,b)

#cambiamos un poco A
A_r=matrix(c(1,0,1,1), nrow=2,ncol=2)+A
#calcumaos x estimada
x_r <- solve(A_r,b)
#estimamos el residual
r <- A%*%x_r-b
print("La cota inferior del error relativo es")
(norm(r,"2")/norm(b,"2"))*(1/cond_A)
print("La cota superior del error relativo es")
(norm(r,"2")/norm(b,"2"))*(cond_A)
print("El error relativo es:")
(norm(x-x_r,"2")/norm(x,"2"))


#matriz c)
#definimops una matriz A
A=matrix(c(104,-2,0.2,0.5), nrow=2,ncol=2)
#calculamos su número de condición
cond_A <- cond(A,2)

#resolvemos x para b
b <- c(1,1)
x <- solve(A,b)

#cambiamos un poco A
A_r=matrix(c(10,1,10,1), nrow=2,ncol=2)+A
#calcumaos x estimada
x_r <- solve(A_r,b)
#estimamos el residual
r <- A%*%x_r-b
print("La cota inferior del error relativo es")
(norm(r,"2")/norm(b,"2"))*(1/cond_A)
print("La cota superior del error relativo es")
(norm(r,"2")/norm(b,"2"))*(cond_A)
print("El error relativo es:")
(norm(x-x_r,"2")/norm(x,"2"))
