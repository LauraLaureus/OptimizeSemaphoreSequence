function [max_fitnesses,mean_fitnesses] = genetic_algoritm(tam,p_seleccion,numIteraciones)
%%Devuelve como max, un array con los valores m�ximos de bondad de cada
%%generacion, y como mean, un array con los valores medios de bondad.
%%Recibe como primer par�metro el tama�o de la poblaci�n, la probabilidad
%%para el m�todo de selecci�n (m�todo de selecci�n por torneo
%%probabilistico) y el n�mero de iteraciones.

max_fitnesses = [];
mean_fitnesses =[];

if(mod(tam,3) ~= 0)
    tam = tam + (3- mod(tam,3));
end

Pop = round(rand(12,4,tam));

for i=1:numIteraciones

    fitnesses = calculaFitness(Pop)
    seleccion = seleccion_por_torneo_probabilistico(fitnesses,Pop,p_seleccion/i);
    Pop = three_parent_crossover(seleccion);
    Pop = mutacion(1/i,Pop);
    
    max_fitnesses=[ max_fitnesses max(fitnesses)];
    mean_fitnesses = [mean_fitnesses mean(fitnesses)];
end;


end