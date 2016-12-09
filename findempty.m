function [emptylist] = findempty(list1,list2,list3,list4)

if any(list1 > 0) == 0
    emptylist = 1;
else if any(list2 > 0) == 0
        emptylist = 2;
    else if any(list3 > 0) == 0
            emptylist = 3;
        else if any(list4 > 0) == 0
                emptylist = 4;
            else
                emptylist = 0;
            end
        end
    end
end
end