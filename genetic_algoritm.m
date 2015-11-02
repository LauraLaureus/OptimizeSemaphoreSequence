function [max_fitnesses,mean_fitnesses] = genetic_algoritm(tam,p_seleccion,numIteraciones)
%%Devuelve como max, un array con los valores m�ximos de bondad de cada
%%generacion, y como mean, un array con los valores medios de bondad.
%%Recibe como primer par�metro el tama�o de la poblaci�n, la probabilidad
%%para el m�todo de selecci�n (m�todo de selecci�n por torneo
%%probabilistico) y el n�mero de iteraciones.

max_fitnesses = [];
mean_fitnesses =[];
Pop = round(rand(12,4,tam))

for i=1:numIteraciones

    fitnesses = calculaFitness(Pop);
    %seleccion = seleccion_por_torneo_probabilistico(fitnesses,Pop,p_seleccion);
    %tabla_de_emparejamientos_simple = emparejar(seleccion);
    %vector_tercer_padre = encuentra_al_tercer_padre(tabla_de_emparejamientos_simple);
    %Pop = cruce_del_tercer_padre(seleccion,tabla_de_emparejamientos_simple,vector_tercer_padre);
    %Pop = mutacion(1/numIteraciones,Pop);
    
    %max_fitnesses=[ max_fitnesses max(fitnesses)];
    %mean_fitnesses = [mean_fitnesses mean(fitnesses)];
end;


end