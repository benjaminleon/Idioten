function [list,nr_in_list] = remove_top(list,nr_in_list)

if nr_in_list == 0
    disp('Error in remove_top: Trying to remove from empty list')
else
    list(nr_in_list) = 0;
    nr_in_list = nr_in_list - 1;
end


end