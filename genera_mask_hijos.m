function [mask,inv] =  genera_mask_hijos()
    mask = randi(3,12,4);
    inv = zeros(12,4);
    
    for i=1:12*4
        inv(i) = mod(mask(i)+1,3)+1;
    end
end