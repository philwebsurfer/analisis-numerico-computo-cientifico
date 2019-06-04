


f <- function(x){
    exp(-x^2)
}

n <- seq(100,10000,100)

trap_comp <- function(n){
    x <- seq(0,1,length.out = n)
    1*(f(x[1])+f(x[n])+2*sum(f(x[2:n-1])))/(2*n)
}

y <- vector("numeric",100)
ErrR <- vector("numeric",100)
for(i in 1:100){
    ErrR[i] <-abs(trap_comp(n[i])-.746824132812)/.746824132812
    y[i] <- trap_comp(n[i])
}

plot(n,ErrR,type='l')
plot(n,y,type='l')
