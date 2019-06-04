valor_cambiar = 10.^(-1:-1:-16); 
objetivo = -sin(2); 
(cos(2+valor_cambiar)-cos(2-valor_cambiar))./(2*valor_cambiar);
aprox = (cos(2+valor_cambiar)-cos(2-valor_cambiar))./(2*valor_cambiar); 
aprox

objetivo = -sin(2); 
aprox=(cos(2+valor_cambiar)-cos(2-valor_cambiar))./(2*valor_cambiar); 
e_abs = abs(objetivo-aprox);
e_rel = e_abs/abs(objetivo);
plot(log(valor_cambiar),log(e_rel))

e_rel'