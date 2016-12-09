function [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = move_to_empty(move_from,empty,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4)
% Moves the top card from the list represented by move_from to the empty
% list represented by empty. If move_from is 3 and empty is 2, this
% function will move the top card from list3 to list2

switch move_from
    case 1
        switch empty
            case 1
                disp('error in move_to_empty: list to move from and to is the same')
            case 2
                list2(1) = list1(nr_in1);
                list1(nr_in1) = 0;
                nr_in1 = nr_in1 - 1;
                nr_in2 = 1;
            case 3
                list3(1) = list1(nr_in1);
                list1(nr_in1) = 0;
                nr_in1 = nr_in1 - 1;
                nr_in3 = 1;
            case 4
                list4(1) = list1(nr_in1);
                list1(nr_in1) = 0;
                nr_in1 = nr_in1 - 1;
                nr_in4 = 1;
            otherwise
                disp('error in move_strategically: no list is empty')
        end
    case 2
        switch empty
            case 1
                list1(1) = list2(nr_in2);
                list2(nr_in2) = 0;
                nr_in2 = nr_in2 - 1;
                nr_in1 = 1;
            case 2
                disp('error in move_to_empty: list to move from and to is the same')
            case 3
                list3(1) = list2(nr_in2);
                list2(nr_in2) = 0;
                nr_in2 = nr_in2 - 1;
                nr_in3 = 1;
            case 4
                list4(1) = list2(nr_in2);
                list2(nr_in2) = 0;
                nr_in2 = nr_in2 - 1;
                nr_in4 = 1;
            otherwise
                disp('error in move_strategically: no list is empty')
        end
    case 3
        switch empty
            case 1
                list1(1) = list3(nr_in3);
                list3(nr_in3) = 0;
                nr_in3 = nr_in3 - 1;
                nr_in1 = 1;
            case 2
                list2(1) = list3(nr_in3);
                list3(nr_in3) = 0;
                nr_in3 = nr_in3 - 1;
                nr_in2 = 1;
            case 3
                disp('error in move_to_empty: list to move from and to is the same')
            case 4
                list4(1) = list3(nr_in3);
                list3(nr_in3) = 0;
                nr_in3 = nr_in3 - 1;
                nr_in4 = 1;
            otherwise
                disp('error in move_strategically: no list is empty')
        end
        
    case 4
        switch empty
            case 1
                list1(1) = list4(nr_in4);
                list4(nr_in4) = 0;
                nr_in4 = nr_in4 - 1;
                nr_in1 = 1;
            case 2
                list2(1) = list4(nr_in4);
                list4(nr_in4) = 0;
                nr_in4 = nr_in4 - 1;
                nr_in2 = 1;
            case 3
                list3(1) = list4(nr_in4);
                list4(nr_in4) = 0;
                nr_in4 = nr_in4 - 1;
                nr_in3 = 1;
            otherwise
                disp('error in move_strategically: no list is empty')
        end
    otherwise
end


end
