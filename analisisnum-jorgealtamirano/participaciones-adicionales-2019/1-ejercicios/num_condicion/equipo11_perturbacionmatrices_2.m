%Ejercicio 2%

%Creamos una matriz con -1 en la traingular superior, 1 en la diagonaonal%
%principal y 0' en la triangular inferior%
A = ones(20);
B = -triu(A,1);
v = ones(1,20);
n = size(B,1);
B(1:(n+1):end) = v;

%Creamos nuestro vector solución%
b =-ones(1,20)';
b(20) = 1;

%Encotramos nuestra solución%
x = B\b;

%Perturbamos b%
b_mod = b;
b_mod(20) = 1.00001;

x_mod = B\b_mod;

table(x, x_mod)
norm(x-x_mod)/norm(x)