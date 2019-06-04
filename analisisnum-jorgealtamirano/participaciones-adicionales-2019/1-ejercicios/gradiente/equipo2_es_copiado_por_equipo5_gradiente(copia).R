#Valores y variables iniciales
h = 10^(-seq(1:16))
x_0 <- c(1,3,-2)
f_e <- c(9,1,-12)
gradiente <- matrix(,3,16)



f <- function(x1,x2,x3){
  x1*x2*exp(x1^2+x3^2-5)
}

gradiente[1,] <- (f(x_0[1]+h,x_0[2],x_0[3])-f(x_0[1],x_0[2],x_0[3]))/h
gradiente[2,] <- (f(x_0[1],x_0[2]+h,x_0[3])-f(x_0[1],x_0[2],x_0[3]))/h
gradiente[3,] <- (f(x_0[1],x_0[2],x_0[3]+h)-f(x_0[1],x_0[2],x_0[3]))/h


