
h <- 10^seq(-1,-16,-1)
logh <- log(h)

p_estrella <- -sin(2)

p <- (cos(2+h)-cos(2-h))/(2*h)

logErrR <- log(abs(p_estrella-p)/abs(p_estrella))

plot(logh,logErrR,type='l')
