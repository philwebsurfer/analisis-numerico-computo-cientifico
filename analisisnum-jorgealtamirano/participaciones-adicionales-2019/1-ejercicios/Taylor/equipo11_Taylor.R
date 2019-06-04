library(ggplot2)
eq_0 = function(x){0.16+(x-x)} #para poder hacerla funcion.
eq = function(x){1/x^2}
eq_1 = function(x){1/x^2+((-2/x^3)*(x+2.5))}
eq_2 = function(x){1/x^2+((-2/x^3)*(x+2.5))+((6/x^4)*(x+2.5)^2)/2}
eq_3 = function(x){1/x^2+((-2/x^3)*(x+2.5))+((6/x^4)*(x+2.5)^2)/2+((-24/x^5)*(x+2.5)^3)/6}
eq_4 = function(x,xo){1/x^2+((-2/x^3)*(x+2.5))+((6/x^4)*(x+2.5)^2)/2+((-24/x^5)*(x+2.5)^3)/6+((120/x^6)*(x+2.5)^4)/24}

ggplot(data.frame(x = c(-3, -2)), aes(x)) +
  stat_function(fun = eq_0, geom = "line", col=2)+
  stat_function(fun = eq, geom = "line", col=1)+
  stat_function(fun = eq_1, geom = "line", col=3)+
  stat_function(fun = eq_2, geom = "line", col=4)+
  stat_function(fun = eq_3, geom = "line", col=5)+
  stat_function(fun = eq_4, geom = "line", col=6)