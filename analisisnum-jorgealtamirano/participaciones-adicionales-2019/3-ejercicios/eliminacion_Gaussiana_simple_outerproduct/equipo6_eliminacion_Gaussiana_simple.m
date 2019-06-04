A = pascal(n);
n = 3;
b = [3;1;4];

% triangularizacion de la matriz A
for k = 1:n - 1
  for i = k + 1:n
    m = A(i,k) / A(k,k);
    for j = k + 1:n
      A(i,j) = A(i,j) - m * A(k,j);
    end
    b(i) = b(i) - m * b(k);
  end
end
X(n) = b(n) / A(n,n);
for k = n - 1:-1:1
  s = 0;
  for i = k + 1:n
    s = s + A(k,i) * X(i);
  end
  X(k) = (b(k) - s) / A(k,k)
end