function [Pop] = three_parent_crossover(Selection)

Pop = zeros(size(Selection,1),size(Selection,2),round(3*size(Selection,3)/2));

availables = 1:size(Selection,3);

for i=1:size(Selection,3)/3
    parents = sort(randperm(size(availables,2),3));
    %remove parents from availables.
    availables(parents(1)) = [];
    availables(parents(2)) = [];
    availables(parents(3)) = [];
    
end
end