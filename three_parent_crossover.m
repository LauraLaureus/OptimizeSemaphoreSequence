function [Pop] = three_parent_crossover(Selection)
% generar la permutacion de los padres
perm = randperm(size(Selection,3));
% si el num de padres no es multiplo de 2 añadir el número que sea
% necesario
if mod(size(Selection,3),2)~=0
   perm = [perm perm(1)];
end


%gen tWO parent table
two_parent_table = vec2mat(perm,2);
third_parent_vector = encuentra_al_tercer_padre(two_parent_table);


Pop = zeros(size(Selection,1),size(Selection,2),round(3*size(Selection,3)/2));

for i=1:size(two_parent_table,1)
    [mask1,mask2,mask3]=genera_mask_hijos();
    Pop(:,:,3*(i-1)+1) = aplica_mask(mask1,Selection(:,:,two_parent_table(i,1)),Selection(:,:,two_parent_table(i,2)),Selection(:,:,third_parent_vector(i)));
    Pop(:,:,3*(i-1)+2) = aplica_mask(mask2,Selection(:,:,two_parent_table(i,1)),Selection(:,:,two_parent_table(i,2)),Selection(:,:,third_parent_vector(i)));
    Pop(:,:,3*(i-1)+3) = aplica_mask(mask3,Selection(:,:,two_parent_table(i,1)),Selection(:,:,two_parent_table(i,2)),Selection(:,:,third_parent_vector(i)));
end
end