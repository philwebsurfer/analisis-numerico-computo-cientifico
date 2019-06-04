%Polinomio orden 3%
y = [1.3;3.5;4.2;5;7;8.8;10.1;12.5;13;15.6];
x = [1:10]';
A = [ones(10,1),x,x.^2,x.^3];
[Q R]=qr(A,0);

b = A\y;
b_normal = y'*A*inv(A'*A);
b_qr = R\Q'*y;

norm(b_qr-b)/norm(b);
norm(b_normal-b)/norm(b);

cond(R);
cond(A);
cond(A'*A);

%Polinomio orden 5%
y = [1.3;3.5;4.2;5;7;8.8;10.1;12.5;13;15.6];
x = [1:10]';
A = [ones(10,1),x,x.^2,x.^3,x.^4,x.^5];
[Q R]=qr(A,0);

b = A\y;
b_normal = y'*A*inv(A'*A);
b_qr = R\Q'*y;

norm(b_qr-b)/norm(b);
norm(b_normal-b)/norm(b);

cond(R);
cond(A);
cond(A'*A);
