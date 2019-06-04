# EJERCICIO DE SPFN

## Declaración de variables
x = 5/7
y = 1/3
u = 0.714251
v = 98765.9
w = 0.111111E-4

## función para reducir a k=5
fl <- function(x) {
    x = formatC(x, format='e', digits=4, width = 0)
    as.numeric(x)
}

## función para rendondear a 8
r <- function(x) round(x,8)


## ejercicio 2,  (x - y)

# numero maquina
nm2 <- fl(fl(x) - fl(y))
# 0.38096

# valor redondeado a 8
v2 <- r(r(x)-r(y))
# 0.3809524

# error absoluto
abs(v2-nm2)
# 7.62e-06

# error relativo 
abs(v2-nm2)/abs(v2)
# 2.00025e-05




## Ejercicio 4, (x/y)

# número máquina
nm4 <- fl(fl(x)/fl(y))
# 2.1429, es decir
# 0.21429 x 10^1

# valor redondeado a 8
v4 <- r(r(x)/r(y))
# 2.142857

#error absoluto
abs(v4-nm4)
# 4.285e-05

# error relativo
abs(v4-nm4)/abs(v4)
# 1.999667e-05



## Ejercicio 6, (x -u) /w

# numero maquina
nm6 <- fl(fl(fl(x) - fl(u)) /fl(w))
# 3.6
# 0.36000 x 10^1

# valor redondeado a 8
v6 <- r( r(r(x)-r(u)) / r(w))
# 3.124212

# error absoluto
abs(v6-nm6)
# 0.4757876

# error relativo
abs(v6-nm6)/abs(v6)
# 0.1522904



## ejercicio 8, (u + v)

#numero maquina
nm8 <- fl(fl(u) + fl(v))
# 98767
# 0.9867 x 10^5

# valor redondeado a 8
v8 <- r(r(u)+r(v))
# 98766.61

# error absoluto
abs(v8-nm8)
# 0.385749

# error relativo
abs(v8-nm8)/abs(v8)
# 3.905662e-06
