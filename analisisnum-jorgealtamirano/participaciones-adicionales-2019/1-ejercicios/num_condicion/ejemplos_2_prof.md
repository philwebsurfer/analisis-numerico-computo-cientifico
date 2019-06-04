#Ejemplos de problemas mal condicionados:

#Resolver sistemas de ecuaciones lineales:

#1) 
#Matriz de Hilbert:
n=20;
A=hilb(n);
b=A*(1:n)';
x=A\b
cond(A)


#2)
n=20;
A=eye(n);
for i=1:n, for j=i+1:n, A(i,j) = -1;, end, end
b=-ones(n,1);
b(n,1)=1;
x=A\b

#ahora se perturba un poco la última entrada de b:
b(n,1)=1.00001

x_gorro=A\b
cond(A)


#Encontrar raíces de polinomios de grado alto (>5). 

p(x) = x^8 - 36x^7 + 546x^6 - 4536x^5 + 22449x^4 - 67284x^3 + 118124x^2 - 109584x + 40320 = 0


p1=[1 -36 546 -4536 22449 -67284 118124 -109584 40320]

roots(p1)

#roots son: 8,7,...1

p2=[1 -36.001 546 -4536 22449 -67284 118124 -109584 40320]

roots(p2)

#plot of p1:

n=100

p = @(x) x.^8 - 36*x.^7 + 546*x.^6 - 4536*x.^5 + 22449*x.^4 - 67284*x.^3 + 118124*x.^2 - 109584*x + 40320

puntos=linspace(1,8,n);


plot(puntos, p(puntos))

p2 = @(x) x.^8 - 36.001*x.^7 + 546*x.^6 - 4536*x.^5 + 22449*x.^4 - 67284*x.^3 + 118124*x.^2 - 109584*x + 40320

plot(puntos,p2(puntos))



