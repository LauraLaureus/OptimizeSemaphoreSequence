function Main(tam_pop, p_seleccion,numIteraciones)
[max,mean] = genetic_algoritm(tam_pop,p_seleccion,numIteraciones);

figure
x_axis = 1:numIteraciones;

plot(x_axis,max,'r');
hold on
plot(x_axis,mean,'b');

%TODO poner etiquetas and so beider





