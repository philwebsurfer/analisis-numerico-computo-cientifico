h <- 10. ^ (-1:-1:-16); h
obj <- -sen(2)
aprox <- (cos(2+h)-cos(2-h))/(2*h)
errabs <- abs(obj-aprox); errabs
errrel <- errabs/abs(obj)
plot(log(h), log(errrel))
