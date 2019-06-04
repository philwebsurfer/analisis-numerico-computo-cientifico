#example checking relative residual and relative error:

#cond order of 10^0
#matrices which are linear isometries (rotations, reflections...) have cond number equal to 1
1)
b=[-2;3.4];
A=[cos(pi/3) sin(pi/3);-sin(pi/3) cos(pi/3)];
Amod=[.6 sin(pi/3);-sin(pi/3) .4];
x_hat=Amod\b;
x=A\b;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)

2)
b=[5.5;9.7];
A=[3.9 1/5;1/8 4];
Amod=[3.9 .3;1/8 3];
x_hat=Amod\b;
x=A\b;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)

#perturbing b
2*)
b=[5.5;9.7];
A=[3.9 1/5;1/8 4];
x=A\b;
bmod=[6;10];
x_hat=A\bmod;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)




#cond order of 10^1

3)
b=[-1;1];
A=[3.9 1.6;6.8 1.9];
Amod=[3.85 1.6;6.8 1.9];
x=A\b;
x_hat=Amod\b;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)

4)
A=[3.9 1.6;6.8 4];
b=[7;3.1];
x=A\b;
Amod=[3.85 1.6;6.8 4.05];
x_hat=Amod\b;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)

#cond order of 10^2
5)
A=[3 1;6.2 2];
b=[-2;5];
x=A\b;
Amod=[3.05 1;6.2 2.05];
x_hat=Amod\b;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)


#cond order of 10^3
6)
A=[1 1;10.05 10];
b=[2;21];
x=A\b;
Amod=[1 1;10.10 10];
x_hat=Amod\b;
cond(A)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-A*x_hat)/norm(b)

#cond order big:
7)
n=10;
H=hilb(n);
b=(1:n)';
x=H\b;
bmod=b+1e-5;
x_hat=H\bmod;
cond(H)
err_rel=norm(x-x_hat)/norm(x)
res_rel=norm(b-H*x_hat)/norm(b)


#example fitting model via least squares

y=[1.3;3.5;4.2;5;7;8.8;10.1;12.5;13;15.6];

A=[ones(length(y),1) (1:10)' ((1:10).^2)' ((1:10).^3)']; 

beta_1 = A'*A\(A'*y);
[Q,R]=qr(A,0);
beta_2 = R\(Q'*y);

beta_matlab=A\y;

norm(beta_1-beta_matlab)/norm(beta_matlab)

norm(beta_2-beta_matlab)/norm(beta_matlab)

A=[ones(length(y),1) (1:10)' ((1:10).^2)' ((1:10).^3)' ((1:10).^4)' ((1:10).^5)'];
beta_1 = A'*A\(A'*y);
[Q,R]=qr(A,0);
beta_2 = R\(Q'*y);

beta_matlab=A\y;

norm(beta_1-beta_matlab)/norm(beta_matlab)

norm(beta_2-beta_matlab)/norm(beta_matlab)






