obj <- -sin(2)
H <- 10^seq(-1,-16,-1)

aprox <- function(h) 
    { (cos(2+h) - cos(2-h))/ (2*h)}

aprox_h <- aprox(H)

ErrA = abs(obj - aprox_h)
ErrR = ErrA / abs(obj)

log_H <- log(H)
log_ErrR <- log(ErrR)


library(ggplot2)
xy <- data.frame(log_H,log_ErrR)
ggplot(xy) + geom_line(aes(x=xy$log_H,y=xy$log_ErrR))
