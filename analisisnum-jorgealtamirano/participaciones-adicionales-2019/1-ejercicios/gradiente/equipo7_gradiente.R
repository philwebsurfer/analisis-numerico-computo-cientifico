# Aproximar Nabla f(x) en diferencias hacia adelante y h en {10e-1, ..., 10e-16}
#


# En el punto x_0 = (1, 3, -2)
# realizar gráfica de log(ErrR) vs log(H)

# con errR  =|| p - p* || / || p* ||

# P* =  NABLA f(x_0)

f <- function(x){
  x[1] * x[2] * exp(x[1]^2 +  x[3]^2 - 5)
}

x_0 = c(1, 3, -2)

aprox <- function(f, x_0, h){
  f_aprox = c()
  for(e in c( c(1, 0, 0), c(0, 1, 0), c(0, 0, 1))){
    f_aprox <- c(f_aprox, (f(x_0 + h * e) - f(x_0))/h)
  }
  f_aprox
}

h0s <- seq(-16, -1)
hs <- 10 ^h0s

c_errs <- c()

for(h in hs){
  p_aster <- f(x_0)
  p <- aprox(f, x_0, h)
  
  diff <- p - p_aster
  errR <- sqrt(sum(diff * diff)) / sqrt(sum(p_aster * p_aster))
  c_errs <- c(c_errs, errR)
  cat(h, errR, '\n')
}

plot(log10(hs), log10(c_errs), type = 'l')
