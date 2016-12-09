function [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = remove_smallest(suit,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4)

minval = 0;
maxval = 0;

switch (suit)
    %Clubs
    case 1
        minval = 1;
        maxval = 13;
    case 2
        minval = 14;
        maxval = 26;
    case 3
        minval = 27;
        maxval = 39;
    case 4
        minval = 40;
        maxval = 52;
    otherwise
        disp('Error in remove_smallest: Trying to remove suit 0')
end

%No candidates found yet
to_be_removed = 0;
pile_to_remove_from = 0;

%Does the suit match in the first pile?
if nr_in1 ~= 0
    thiscard = list1(nr_in1);
    if (thiscard >= minval && thiscard <= maxval)
        %Canditate found
        to_be_removed = thiscard;
        pile_to_remove_from = 1;
    end
end

%Does the suit match in the second pile?
if nr_in2 ~= 0
    thiscard = list2(nr_in2);
    if (thiscard >= minval && thiscard <= maxval)
        
        %If we don't have another in the same suit yet, pick this one
        if (pile_to_remove_from == 0 || (to_be_removed > thiscard))
            pile_to_remove_from = 2;
            to_be_removed = thiscard;
        end
    end
end

%Does the suit match in the third pile?
if nr_in3 ~= 0
    thiscard = list3(nr_in3);
    if (thiscard >= minval && thiscard <= maxval)
        %If we don't have another in the same suit yet, pick this one. or
        %if we have a candidate which is larger?
        if (pile_to_remove_from == 0 || (to_be_removed > thiscard))
            pile_to_remove_from = 3;
            to_be_removed = thiscard;
        end
    end
end

%Does the suit match in the fourth pile?
if nr_in4 ~= 0
    thiscard = list4(nr_in4);
    if (thiscard >= minval && thiscard <= maxval)
        
        %If we don't have another in the same suit yet, pick this one
        if (pile_to_remove_from == 0 || (to_be_removed > thiscard))
            pile_to_remove_from = 4;
        end
    end
end



switch pile_to_remove_from
    case 1
        [list1,nr_in1] = remove_top(list1,nr_in1);
    case 2
        [list2,nr_in2] = remove_top(list2,nr_in2);
    case 3
        [list3,nr_in3] = remove_top(list3,nr_in3);
    case 4
        [list4,nr_in4] = remove_top(list4,nr_in4);
    otherwise
        disp('Error in remove_smallest: wants to remove from pile not between 1 to 4');
end



end