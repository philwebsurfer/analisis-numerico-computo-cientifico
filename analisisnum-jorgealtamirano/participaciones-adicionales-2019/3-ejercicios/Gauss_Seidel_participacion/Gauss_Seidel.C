/*

  Programa para resolver un sistema de ecuaciones lineales
  por los métodos de Jacobi y Gauss-Seidel

  Descripci¢n de variables :

  a    : Matriz de coeficientes del sistema.
  b    : Vector de términos independientes.
  x    : Vector soluci¢n del sistema.
  x0   : Vector de valores iniciales.
  n    : Número de ecuaciones.
  Eps  : Criterio de convergencia aplicado componente a
         componente de dos vectores consecutivos.
  iter : N£mero máximo de iteraciones.
  m    : 0 para Jacobi;  1 para Gauss-Seidel.

				    */

  #include <stdio.h>
  #include <curses.h>
  #include <stdlib.h> 
  #include <math.h>

  #define TRUE 1
  #define FALSE 0
  #define ITER 20

  double   x[10],x0[10],b[10];
  int      m,n,i,j,k,converge,respuesta;
  double   a[10][11],s,eps;

double main()
  {

     /* Lectura de n, a, b y x0. */

   system("cls");
   eps=1e-2;
   printf("Escriba criterio de convergencia (ej 1e-2) :\n");
   scanf("%lf",&eps);
   printf("Desea correr el programa con :\n");
   printf("1.- Datos del ejemplo 3\n");
   printf("2.- Otros datos\n");
   printf("Escriba 1 ó 2: ");
   scanf("%d",&respuesta);
   switch (respuesta)
   {
   case 2 :


     printf("   Número de ecuaciones ");  scanf("%d",&n);
     for(i=1; i<=n; i++)
        {
           printf(   "Fila %d\n",i);
           for(j=1; j<=n; j++)
              {
	     printf("A(%d,%d) = ",i,j);  scanf("%lf",&a[i][j]);
              }
           printf("b(%d) = ",i);  scanf("%lf",&b[i]);
        }
     for(i=1; i<=n; i++)
        {
           printf("x0(%d) = ",i);   scanf("%lf",&x0[i]);
        }
	printf("Valor de M (0 para Jacobi; 1 para Gauss-Seidel): ");
	scanf("%d",&m);
     break;

     /* Las siguientes instrucciones asignan los datos del ejercicio  */

     case 1:

     n=5;         m=1;          eps=1e-5;
     a[1][1]=98;  a[1][2]=9;    a[1][3]=2;  a[1][4]=1;   a[1][5]=0.5;
     a[2][1]=11;  a[2][2]=118;  a[2][3]=9;  a[2][4]=4;   a[2][5]=0.88;
     a[3][1]=27;  a[3][2]=27;   a[3][3]=85; a[3][4]=8;   a[3][5]=2;
     a[4][1]=1;   a[4][2]=3;    a[4][3]=17; a[4][4]=142; a[4][5]=25;
     a[5][1]=2;   a[5][2]=4;    a[5][3]=7;  a[5][4]=17;  a[5][5]=118;
     b[1]=0.11;   b[2]=0.2235;  b[3]=0.28;  b[4]=0.3;    b[5]=0.14;
     x0[1]=0;     x0[2]=0;      x0[3]=0;    x0[4]=0;     x0[5]=0;
     }

     /* Inicio del proceso iterativo */

     converge=FALSE;
     k=0;
     while(!converge &&  (k<ITER) )
        {
          if (m != 0)
	 for (i=1; i<=n; i++)
	    x[i]=x0[i];
           for(i=1; i<=n; i++)
               {
	      s=0;
	      for(j=1; j<=n; j++)
	         if((i-j)!=0) s=s+a[i][j]*x0[j];
	      if (m == 0)
	         x[i]=(b[i]-s)/a[i][i];
	      else
	         x0[i]=(b[i]-s)/a[i][i];
               }
	   k++;
        /* Aplicación del criterio de convergencia */

        for(i=1; i<=n; i++)
            {
	   if(fabs(x0[i]-x[i]) > eps) converge=FALSE;
	   else converge=TRUE;
	   if (m == 0)
	      x0[i]=x[i];

            }
        }
     if(converge)
        {
           printf("   DESPUES DE %d ITERACIONES, ",k);
           printf("   LA SOLUCION DEL SISTEMA ES : \n");   printf("\n");
           for(i=1; i<=n; i++)
	  if (m == 0)
	     printf("     x(%d) = %12.6f\n",i,x[i]);
	  else
	     printf("     x(%d) = %12.6f\n",i,x0[i]);
        }
        else

        {
           printf("   DESPUES DE %d ITERACIONES NO CONVERGE\n",k);
           printf("   ULTIMOS VALORES OBTENIDOS\n");   printf("\n");
           for(i=1; i<=n; i++)
	  printf("      x(%d) = %12.6f\n",i,x[i]);
        }
   getchar();
   }

