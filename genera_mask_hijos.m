function [mask,inv] =  genera_mask_hijos()
    mask = randi(3,12,4);
    inv = [];
    
    for i=1:12*4
        inv(i) = mod(inv(i)+1,3);
    end
end