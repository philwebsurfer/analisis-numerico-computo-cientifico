% Definimos Nuestras Matrices%
rng(0)
A = randi(10,1000);
A0 = A;
n = size(A);
n = n(1);

B = randi(10,1000);

% Eliminación Gausiana %
tic;
n = size(A);
n = n(1);
x = zeros(size(B));
for k = 1:n-1   
  for i = k+1:n
     xMult = A(i,k) / A(k,k);
     for j=k+1:n
        A(i,j) = A(i,j) - xMult * A(k,j);
     end
     B(i, :) = B(i, :) - xMult * B(k, :);
  end
end
    x(n, :) = B(n, :) / A(n,n);
    for i = n-1:-1:1
        summation = B(i, :);
        for j = i+1:n
            summation = summation - A(i,j) * x(j, :);
        end
        x(i, :) = summation / A(i,i);
    end
toc;

% Definimos Nuestras Matrices%
A = randi(10,1000);
A0 = A;
n = size(A);
n = n(1);

B = randi(10,1000);
%LU Factorizacion)
tic;
for k = 1:n-1 
    i = k+1:n;
        A(i,k) = A(i,k)/A(k,k);
        A(i,i) = A(i,i)-A(i,k)*A(k,i);
end 

U = triu(A);
L = tril(A,-1)+eye(1000);

d = B\L;
x = d\U;
toc;