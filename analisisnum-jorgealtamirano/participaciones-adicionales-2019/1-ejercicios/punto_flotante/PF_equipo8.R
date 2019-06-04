x <- 5/7
y <- 1/3
u <- .714251
v <- 98765.9
w <- 0.111111*10^-4

k <- 5

trunc_dig <- function( x, digits = 5) trunc(x*10^digits)/10^digits
aritmetica_maquina <- c(trunc_dig(trunc_dig(x)-trunc_dig(y,k),k),
                        trunc_dig(trunc_dig(x)/trunc_dig(y)),
                        trunc_dig(trunc_dig(trunc_dig(x)-trunc_dig(u))/(trunc_dig(w))),
                        trunc_dig(trunc_dig(u,digits=k)+trunc_dig(v,k),k)
                        )

options(digits = 8)
resultado <- data.frame(operacion = c('x-y','x/y','(x-u)/w','u+v'), 
                        valor_a_8 = c(x-y,x/y,(x-u)/w,u+v), 
                        aritmetica_maquina = aritmetica_maquina)
resultado['ErrA'] <- trunc_dig(abs(resultado$valor_a_8 - resultado$aritmetica_maquina),8)
resultado['ErrR'] <- trunc_dig(abs(resultado$valor_a_8 - resultado$aritmetica_maquina)/abs(resultado$aritmetica_maquina),8)
resultado





