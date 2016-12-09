function [clubs,diamonds,spades,hearts] = what_is_this(list, nr_in_list)

clubs = 0;
diamonds = 0;
spades = 0;
hearts = 0;

if nr_in_list ~= 0
    thiscard = list(nr_in_list);
    if (thiscard <= 13 && thiscard > 0)
        clubs = 1;
    else if thiscard <= 26
            diamonds = 1;
        else if thiscard <= 39
                spades = 1;
            else
                hearts = 1;
            end
        end
    end
     
end

end