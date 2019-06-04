#ajuste por mínimos cuadrados:

y=[1.3;3.5;4.2;5;7;8.8;10.1;12.5;13;15.6];

A=[ones(length(y),1) (1:10)' ((1:10).^2)' ((1:10).^3)']; 

[Q,R]=qr(A,0);
beta = R\(Q'*y);

beta_matlab=A\y;

norm(beta_1-beta_matlab)/norm(beta_matlab)

norm(beta_2-beta_matlab)/norm(beta_matlab)


#ajuste por mínimos cuadrados en dos etapas:

y1=[1.3;3.5;4.2;5;7;8.8;10.1;12.5;13];

A1=[ones(length(y1),1) (1:9)' ((1:9).^2)' ((1:9).^3)'];

[Q1,R1]=qr(A1,0);
b1=Q1'*y1;
beta1 = R1\b1;

nuevo_renglon = [1 10 10^2 10^3];
nuevo_b1 = 15.6
[m,n] = size(R1);



#primera rotación
norma = sqrt(R1(1,1)^2 + nuevo_renglon(1)^2);
cos_teta = R1(1,1)/norma
sen_teta = nuevo_renglon(1) / norma
rot = [cos_teta sen_teta;-sen_teta cos_teta]

R1_aux = [R1(1,:) b1(1);nuevo_renglon nuevo_b1]

R1_aux = rot*R1_aux

R1_aux(2,1) = 0

R1(1,:) = R1_aux(1,1:end-1)
b1(1) = R1_aux(1,end)
nuevo_renglon = R1_aux(2,1:end-1)
nuevo_b1 = R1_aux(2,end)

#segunda rotación
norma = sqrt(R1(2,2)^2 + nuevo_renglon(2)^2);
cos_teta = R1(2,2)/norma
sen_teta = nuevo_renglon(2) / norma
rot = [cos_teta sen_teta;-sen_teta cos_teta]
R1_aux = [R1(2,2:end) b1(2);nuevo_renglon(2:end) nuevo_b1]
R1_aux = rot*R1_aux

R1_aux(2,1) = 0

R1(2,2:end) = R1_aux(1,1:end-1)
b1(2) = R1_aux(1,end)
nuevo_renglon(2:end) = R1_aux(2,1:end-1)
nuevo_b1 = R1_aux(2,end)


#tercera rotación
norma = sqrt(R1(3,3)^2 + nuevo_renglon(3)^2);
cos_teta = R1(3,3)/norma
sen_teta = nuevo_renglon(3) / norma
rot = [cos_teta sen_teta;-sen_teta cos_teta ]
R1_aux = [R1(3,3:end) b1(3);nuevo_renglon(3:end) nuevo_b1]

R1_aux = rot*R1_aux

R1_aux(2,1) = 0

R1(3,3:end) = R1_aux(1,1:end-1)
b1(3) = R1_aux(1,end)
nuevo_renglon(3:end) = R1_aux(2,1:end-1)
nuevo_b1 = R1_aux(2,end)



#cuarta rotación
norma = sqrt(R1(4,4)^2 + nuevo_renglon(4)^2);
cos_teta = R1(4,4)/norma
sen_teta = nuevo_renglon(4)/norma
rot = [cos_teta sen_teta;-sen_teta cos_teta]
R1_aux = [R1(4,4:end) b1(4);nuevo_renglon(4:end) nuevo_b1]

R1_aux = rot*R1_aux

R1_aux(2,1) = 0

R1(4,4:end) = R1_aux(1,1:end-1)
b1(4) = R1_aux(1,end)
nuevo_renglon(4:end) = R1_aux(2,1:end-1)
nuevo_b1 = R1_aux(2,end)


beta_actualizada = R1\b1






