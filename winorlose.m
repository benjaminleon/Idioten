function [win] = winorlose(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4)

win = 0;
% If any pile contains anything else than 1 card, we lost
if any([nr_in1 nr_in2 nr_in3 nr_in4] ~= 1)
% Should be sufficient condition, no?
    
    % Check for aces (Don't need this, right?)
else if (list1(1) == 13 || list1(1) == 26 || list1(1) == 39 || list1(1) == 52)
        if (list2(1) == 13 || list2(1) == 26 || list2(1) == 39 || list2(1) == 52)
            if (list3(1) == 13 || list3(1) == 26 || list3(1) == 39 || list3(1) == 52)
                if (list4(1) == 13 || list4(1) == 26 || list4(1) == 39 || list4(1) == 52)
                    win = 1;
                end
            end
        end
    end
end
    
    
