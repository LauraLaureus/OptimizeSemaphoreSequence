function Main(tam_pop, p_seleccion,numIteraciones)
[max,mean] = genetic_algoritm(tam_pop,p_seleccion,numIteraciones);

figure
x_axis = 1:numIteraciones;

plot(x_axis,max,'r');
hold on
plot(x_axis,mean,'b');
axis([1 numIteraciones 0 1]);
legend('max/generacion','media/generacion');







