function [ ] = main( rounds )
%MAIN.m simulates a number of games of the 1-player card game "idioten"
  %   The argument to main determines how many wins the simulation will achieve until it is done.
  %   The exact number of plays is thus indeterministic. 

triesperwin = zeros(1,rounds);
i = 0;
while i < rounds
    i = i + 1;

tries = 0;
gamescore = 0;
% Play until we win
while gamescore == 0
    tries = tries + 1;
    
    % 1-13 is 2-ace in clubs
    % 14-26 is 2-ace in diamonds
    % 27-39 is 2-ace in spades
    % 40-52 is 2-ace in hearts
    
    % Shuffle deck and keep track of how many cards we have
    deck = randperm(52);
    last_card_in_deck = 52;
       
    % The slots in the game field
    list1 = zeros(1,13);
    list2 = zeros(1,13);
    list3 = zeros(1,13);
    list4 = zeros(1,13);
    
    % Amount of cards in each field
    nr_in1 = 0;
    nr_in2 = 0;
    nr_in3 = 0;
    nr_in4 = 0;
    
    % Play until we are out of cards
    while (last_card_in_deck > 0)
        [list1,list2,list3,list4,last_card_in_deck,nr_in1,nr_in2,nr_in3,nr_in4] = place_4_cards(list1,list2,list3,list4,last_card_in_deck,deck,nr_in1,nr_in2,nr_in3,nr_in4);
        
        % Remove and move cards until we cannot do it any more
        while true
            % Find how many clubs, diamonds... on the top of the table
            [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            
            % 1 is clubs, 2 is diamonds, 3 is spades, 4 is hearts, 0 means that
            % no card can be removed
            [suit_to_remove_from] = can_we_remove(clubs, diamonds, spades, hearts);
            
            % If we cannot remove any card
            if (suit_to_remove_from == 0)
                
                % if there is an empty pile
		empty = findempty(list1,list2,list3,list4);
                if empty ~= 0
                    
                    % Check if any pile has more than 1 card, then we can move it
                    if (nr_in1 > 1 || nr_in2 > 1 || nr_in3 > 1 || nr_in4 > 1)
                        % Find out which card is the most beneficial to move
                        [move_from,~] = move_strategically(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
                        
                        % Move the card
                        [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = move_to_empty(move_from,empty,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
                    else
                        % Go back to dealing cards
                        break
                    end
                else
                    % Go back to dealing cards
                    break
                end
                % If we have more than one of the same suit in the top
            else
                [list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4] = remove_smallest(suit_to_remove_from,list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4);
            end
        end
    end
    gamescore = winorlose(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4); 
end

triesperwin(i) = tries;
end

amount_of_games_played = sum(triesperwin);

disp(['Total amount of games played: ' num2str(amount_of_games_played)])
disp(['Average amount of games per win: ' num2str(mean(triesperwin))])
disp(['Win percentage: ' num2str(rounds/amount_of_games_played*100) ' %'])

