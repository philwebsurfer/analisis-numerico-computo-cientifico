# definiciones
h = 10^(-seq(1:16))
x_0 <- c(1,3,-2)
f_estrella <- c(9,1,-12)
gradiente <- matrix(,3,length(h))

#funciones

f <- function(x1,x2,x3){
  x1*x2*exp(x1^2+x3^2-5)
}

gradiente[1,] <- (f(x_0[1]+h,x_0[2],x_0[3])-f(x_0[1],x_0[2],x_0[3]))/h
gradiente[2,] <- (f(x_0[1],x_0[2]+h,x_0[3])-f(x_0[1],x_0[2],x_0[3]))/h
gradiente[3,] <- (f(x_0[1],x_0[2],x_0[3]+h)-f(x_0[1],x_0[2],x_0[3]))/h

ErrR <- vector("numeric",16)
for( i in 1:16){
  ErrR[i] <- norm(f_estrella-gradiente[,i],"2")/norm(f_estrella,"2")
}


#grafica
plot(log(h),log(ErrR),type='l')


