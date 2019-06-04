
h <- 10^seq(-1,-16,-1)
logh <- log(h)

x_0 <- c(1,3,-2)
f_estrella <- c(9,1,-12)

f <- function(x1,x2,x3){
    x1*x2*exp(x1^2+x3^2-5)
}

grad <- matrix(,3,length(h))

 
grad[1,] <- (f(x_0[1]+h,x_0[2],x_0[3])-f(x_0[1],x_0[2],x_0[3]))/h
grad[2,] <- (f(x_0[1],x_0[2]+h,x_0[3])-f(x_0[1],x_0[2],x_0[3]))/h
grad[3,] <- (f(x_0[1],x_0[2],x_0[3]+h)-f(x_0[1],x_0[2],x_0[3]))/h


logErrR <- vector("numeric",16)
for( i in 1:16){
logErrR[i] <- log(norm(f_estrella-grad[,i],"2")/norm(f_estrella,"2"))
}

plot(logh,logErrR,type='l')
