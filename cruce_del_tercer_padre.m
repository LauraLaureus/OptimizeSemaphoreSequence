function [Pop] = cruce_del_tercer_padre(seleccion,tabla_de_emparejamientos_simple,vector_tercer_padre)

Pop = zeros( size(seleccion,1),size(seleccion,2),size(seleccion,3));
indexPop = 1;
%para todas las parejas
for i = 1:size(tabla_de_emparejamientos_simple,1)
    padre = seleccion(:,:,tabla_de_emparejamientos_simple(i,1));
    madre = seleccion(:,:,tabla_de_emparejamientos_simple(i,2));
    padre2 = seleccion(:,:,vector_tercer_padre(i));
    
    %genera la m�scara de los dos hijos
    [mask,inv1] = genera_mask_hijos();
    
    hijo1 = aplica_mask(mask,padre,madre,padre2);
    hijo2 = aplica_mask(inv1,padre,madre,padre2);
    
    
    Pop(:,:,indexPop) = hijo1;
    indexPop = indexPop+1;
    Pop(:,:,indexPop) = hijo2;
    indexPop = indexPop+1;
end

end