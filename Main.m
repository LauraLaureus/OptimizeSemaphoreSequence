function Main(tam_pop, p_seleccion,numIteraciones)
[max,mean] = genetic_algoritm(tam_pop,p_seleccion,numIteraciones);

figure
x_axis = linspace(1,numIteraciones,numIteraciones);
plot(x_axis,max,'r');
plot(x_axis,mean,'b');

%TODO poner etiquetas and so beider





