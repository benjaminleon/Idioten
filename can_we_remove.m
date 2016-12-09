function [number] = can_we_remove(clubs,diamonds,spades,hearts)

if clubs > 1
    number = 1;
else
    if diamonds > 1
        number = 2;
    else
        if spades > 1
            number = 3;
        else
            if hearts > 1
                number = 4;
            else
                number = 0;
            end
        end
    end
    
end



end