# Equipo 1

x<-5/7
y<-1/3
u<-0.714251
v<-98765.9
w<-0.111111e-4


# Números menores a 1
trunc_fun_10<-function(x,k){
    trunc(x*10^k)/10^k
}

# Pregunta 1
x+y # Res: 

trunc_fun_10(trunc_fun_10(x,5)+trunc_fun_10(y,5),5)
x+y-1.0476
(x+y-1.0476)/(x+y)



# Pregunta 3
x*y
trunc_fun_10(trunc_fun_10(x,5)*trunc_fun_10(y,5),5)
x*y-0.23809
(x*y-0.23809)/(x*y)

# Pregunta 5
x-u
trunc_fun_10(x,5)-trunc_fun_10(u,5)
x-u-3e-5
(x-u-3e-5)/(x-u)

# Pregunta 7
(x-u)*v
(trunc_fun_10(x,5)-trunc_fun_10(u,5))*floor(v)
(x-u)*v-2.9629
((x-u)*v-2.9629)/((x-u)*v)
