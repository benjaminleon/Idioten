function [move_from,points] = move_strategically(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4)

%If only one pile can be moved, simply move it
if( sum([nr_in1 nr_in2 nr_in3 nr_in4] > 1) == 1)
    if nr_in1 > 1
        move_from = 1;
    else if nr_in2 > 1
            move_from = 2;
        else if nr_in3 > 1
                move_from = 3;
            else if nr_in4 > 1
                    move_from = 4;
                else
                    disp('Error in move_strategic: cannot move')
                    move_from = 0;
                end
            end
        end
    end
    
    points = 1;
    
    %If we have a choice, examine the benefit from playing each choice
else
    point1 = 0;
    point2 = 0;
    point3 = 0;
    point4 = 0;
    
    %Backup the piles
    list1bak = list1;
    list2bak = list2;
    list3bak = list3;
    list4bak = list4;
    nr1bak = nr_in1;
    nr2bak = nr_in2;
    nr3bak = nr_in3;
    nr4bak = nr_in4;
    
    if nr_in1 > 1
        point1 = point1 + 1;
        
        [empty] = findempty(list1,list2,list3,list4);
        
        %Move from a pile with more than 1 cards to an empty pile
        [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = move_to_empty(1,empty,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
       
        
        [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
        [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
        %While we can remove, loop over removing and getting points
        while suit_to_remove_from ~= 0
            %If we can remove
            [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = remove_smallest(suit_to_remove_from,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            point1 = point1 + 1;
            
            [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
            
        end
        %If we cannot remove any card
        %if any pile is empty
        if (any( [any(list1 > 0) any(list2 > 0) any(list3 > 0) any(list4 > 0)] == 0))
            %Check if any pile has more than 1 card, then we can move it
            if (nr_in1 > 1 || nr_in2 > 1 || nr_in3 > 1 || nr_in4 > 1)
                [~,tmppoints] = move_strategically(list1,list2,list3,list4,nr_in1, nr_in2, nr_in3, nr_in4);
                point1 = point1 + tmppoints;
            end
        end
    end
    if nr_in2 > 1
        list1 = list1bak;
        list2 = list2bak;
        list3 = list3bak;
        list4 = list4bak;
        nr_in1 = nr1bak;
        nr_in2 = nr2bak;
        nr_in3 = nr3bak;
        nr_in4 = nr4bak;
        
        point2 = point2 + 1;
        
        [empty] = findempty(list1,list2,list3,list4);
        
        %Move from a pile with more than 1 cards to an empty pile
        [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = move_to_empty(2,empty,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
       
        %Can we remove cards?
        [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
        [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
        
        %While we can remove, loop over removing and getting points
        while suit_to_remove_from ~= 0
            %If we can remove
            [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = remove_smallest(suit_to_remove_from,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            point2 = point2 + 1;
            
            [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
        end
        
        
        %If we cannot remove any card
        %if any pile is empty
        if (any( [any(list1 > 0) any(list2 > 0) any(list3 > 0) any(list4 > 0)] == 0))
            %Check if any pile has more than 1 card, then we can move it
            if (nr_in1 > 1 || nr_in2 > 1 || nr_in3 > 1 || nr_in4 > 1)
                [~,tmppoints] = move_strategically(list1,list2,list3,list4,nr_in1, nr_in2,nr_in3,nr_in4);
                point2 = point2 + tmppoints;
            end
        end
    end
    if nr_in3 > 1
        list1 = list1bak;
        list2 = list2bak;
        list3 = list3bak;
        list4 = list4bak;
        nr_in1 = nr1bak;
        nr_in2 = nr2bak;
        nr_in3 = nr3bak;
        nr_in4 = nr4bak;
        point3 = point3 + 1;
        
        %Find the empty pile
        [empty] = findempty(list1,list2,list3,list4);
        
        %Move from a pile with more than 1 cards to an empty pile
        [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = move_to_empty(3,empty,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
     
        
        [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
        [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
        %While we can remove, loop over removing and getting points
        while suit_to_remove_from ~= 0
            %If we can remove
            [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = remove_smallest(suit_to_remove_from,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            point3 = point3 + 1;
            
            [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
            
        end
        %If we cannot remove any card
        %if any pile is empty
        if (any( [any(list1 > 0) any(list2 > 0) any(list3 > 0) any(list4 > 0)] == 0))
            %Check if any pile has more than 1 card, then we can move it
            if (nr_in1 > 1 || nr_in2 > 1 || nr_in3 > 1 || nr_in4 > 1)
                [~,tmppoints] = move_strategically(list1,list2,list3,list4,nr_in1, nr_in2, nr_in3, nr_in4);
                point3 = point3 + tmppoints;
            end
        end
    end
    
    if nr_in4 > 1
        list1 = list1bak;
        list2 = list2bak;
        list3 = list3bak;
        list4 = list4bak;
        nr_in1 = nr1bak;
        nr_in2 = nr2bak;
        nr_in3 = nr3bak;
        nr_in4 = nr4bak;
        point4 = point4 + 1;
        
        
        %Find the empty pile
        [empty] = findempty(list1,list2,list3,list4);
        
        %Move from a pile with more than 1 cards to an empty pile
        [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = move_to_empty(4,empty,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
        
        
        [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
        [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
        %While we can remove, loop over removing and getting points
        while suit_to_remove_from ~= 0
            %If we can remove
            [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = remove_smallest(suit_to_remove_from,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            point4 = point4 + 1;
            
            [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
            
        end
        %If we cannot remove any card
        %if any pile is empty
        if (any( [any(list1 > 0) any(list2 > 0) any(list3 > 0) any(list4 > 0)] == 0))
            %Check if any pile has more than 1 card, then we can move it
            if (nr_in1 > 1 || nr_in2 > 1 || nr_in3 > 1 || nr_in4 > 1)
                [~,tmppoints] = move_strategically(list1,list2,list3,list4,nr_in1, nr_in2, nr_in3, nr_in4);
                point4 = point4 + tmppoints;
            end
        end
    end

    [points,move_from] = max([point1 point2 point3 point4]);
    if points == 0
        move_from = 0;
    end
end


end
