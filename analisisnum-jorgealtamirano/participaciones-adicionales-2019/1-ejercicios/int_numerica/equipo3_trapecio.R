a <- 0
b <- 1
n <- seq(100,10000,10,)
f <- function(x) exp(-x^2)

fi <- list() 

for (i in 1:length(n)) {
  ni <- n[i]
  h <- (b-a)/ni
  suma <- 0
  for(j in 1:(ni-1)) {
    suma <- suma + f(a+j*h)
  }
  fi[i] <- (h/2)*(f(a)+f(b)+2*suma)
}

result <- cbind(n,fi)

plot(result)

error <- list()
for (i in 1:length(n)) {
  error[i] <- abs((0.746824132812 - fi[[i]])/fi[[i]])
}


error_r <- cbind(n,error)
plot(error_r, type="l")
