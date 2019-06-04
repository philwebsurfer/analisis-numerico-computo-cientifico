trunc.dig <- function(x, digits) trunc(x*10^digits)/10^digits
x = round(5/7,8)
y = round(1/3,8)


## Ej2 x_trunc - y_trunc
x_trunc = trunc.dig(5/7,5)
y_trunc = trunc.dig(1/3,5)
x_y = x_trunc - y_trunc

x_y_rea = round(8/21,8)

err_a = round(abs(x_y_rea - x_y),8)
err_r = round(err_a / x_y_rea,8)

## Ej4 x_trunc / y_trunc

xy_rea = round(x/y,8)
xy_art = trunc.dig(x_trunc / y_trunc,5)

err_a_2 = round(abs(xy_rea - xy_art),8)
err_r_2 = round(err_a_2 / xy_rea,8)

## Ej6 (x_trunc_)
u= 0.714251
w = 0.0000111111
u_trunc = trunc.dig(u,5)
w_trunc = trunc.dig(w,5)

x_uw_rea = round((x-u)/x,8)
x_uw_art = trunc.dig((x_trunc - u_trunc)/w_trunc,5)

err_a_3 = round(abs(x_uw_rea - x_uw_art),8)
err_r_3 = round(err_a_3 / x_uw_rea)

