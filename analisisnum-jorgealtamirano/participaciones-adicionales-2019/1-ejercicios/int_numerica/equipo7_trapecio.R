# Ejercicio regla del trapecio

f <- function(x){
  exp(-1 * x * x)
}

a <- 0
b <- 1

gen_part <- function(a, b, n){
  seq(a, b, length.out = n)
}

calcula_int <- function(f, part){
  bandera <- 0
  anterior <- NULL
  
  sol <- 0
  
  for(i in part){
       if (bandera == 0){
         bandera <- 1
         anterior = i
       }
    else{
     x_i <-  i
     x_i_menos_1 <- anterior
     
     h <- x_i - x_i_menos_1
     
     sol <- sol + ((f(x_i) + f(x_i_menos_1) )/2) * h
     #print(sol)
     anterior <- i
    }
  }
  #print(sol)
  return(sol)
}

c_int <- c()
c_err <- c()
real <- 0.746824132812

for(n in 1:10000){
    part <- gen_part(a, b, n)
    #print(part)
    valor <- calcula_int(f, part)
    c_int <- c(c_int, valor)
    
    c_err <- c(c_err, abs(  (valor - real)/real )  )
    
}

plot(1:100, c_err, type = 'l')

