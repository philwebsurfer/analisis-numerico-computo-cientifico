%Creamos matriz hilb de 4*4%
A = hilb(4);

%Vector solucion%
b = [1,2,3,4]';

%Encontramos x%
x = A\b;

%Perturbamos A%
A_mod = A;
A_mod(1,2) = .49;
%Buscamos x_hat%
x_hat = A_mod\b;
%Observamos el error y los residuales%
norm(b-A*x_hat)/norm(b)
norm(x-x_hat)/norm(x)

%Perturbamos A%
A_mod(2,1) = .52;
%Buscamos x_hat%
x_hat = A_mod\b;
%Observamos el error y los residuales%
norm(b-A*x_hat)/norm(b)
norm(x-x_hat)/norm(x)

%Perturbamos A%
A_mod(3,1)=.3;
%Buscamos x_hat%
x_hat = A_mod\b;
%Observamos el error y los residuales%
norm(b-A*x_hat)/norm(b)
norm(x-x_hat)/norm(x)

%Perturbamos A%
A_mod(1,3)=.34;
%Buscamos x_hat%
x_hat = A_mod\b;
%Observamos el error y los residuales%
norm(b-A*x_hat)/norm(b)
norm(x-x_hat)/norm(x)

