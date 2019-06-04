"""
    EJERCICIO CLASE 
    
    Revisar estabilidad numérica de la regla del Trapecio compuesta para aproximar
    integral de e**-x**2
    Realizando una gráfica 
    
"""   
def func(x):
   return(math.exp(-x**2))

def tc(n):
    n=n
    suma=[]
    for i in range(n):
        xi=a+(i*(b-a)/n)
        xi=func(xi)
        suma.append(xi)
       
    return((h/(2*n))*(func(x0)+func(b)+2*sum(suma)))
    
a=0
b=1
x0= a
n=3
real=0.7

tc_resultado= tc(8000)

intentos=10000
inicial = 1000


h=b-a
tries=[]
erro=[]
for i in range(inicial,intentos):
    i=i+1
    tcr=tc(i)
    tries.append(tcr)
    err=abs(tcr-real)
    erro.append(err)

d={"n": range(inicial,intentos), "error": erro, "valor":tries}
df_des_tc= pd.DataFrame(data=d)

sns.relplot(x="n", y="error",
            kind="line", data=df_des_tc)
   


"""
EQUIPO 10
Francisco Alvarez
Francisco Acosta 
Francisco Paz

"""
