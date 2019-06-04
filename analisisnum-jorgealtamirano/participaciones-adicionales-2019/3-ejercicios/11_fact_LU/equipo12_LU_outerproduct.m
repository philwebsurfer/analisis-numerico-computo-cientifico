

%Se define una matriz A
A=[1,2,1;2,2,3;-1,-3,0]
A0=A
n=size(A,1)

%Se genera el algoritmo que sobreescribe la matriz A
for k=1:n-1
    i=(k+1):n;
    A(i,k)=A(i,k)/A(k,k);
    A(i,i)=A(i,i)-A(i,k)*A(k,i);
end
disp(A)

%Se obtienen las matrices L y U
U=triu(A)
L=tril(A)
L=L-diag(diag(L)-1)

%Se comprueba que la multiplicacion L*U resulta en la matriz original A0
L*U-A0