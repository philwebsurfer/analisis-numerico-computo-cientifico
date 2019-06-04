A = randi(10,4);
A0 = A;
n = size(A);
n = n(1);

for k = 1:n-1 
    i = k+1:n;
        A(i,k) = A(i,k)/A(k,k);
        A(i,i) = A(i,i)-A(i,k)*A(k,i);
end 

U = triu(A);
L = tril(A,-1)+eye(4);

L*U == A0