function [list1,list2,list3,list4,last_card_in_deck,nr_in1,nr_in2,nr_in3,nr_in4] = place_4_cards(list1,list2,list3,list4,last_card_in_deck,deck,nr_in1,nr_in2,nr_in3,nr_in4)


list1(nr_in1 + 1) = deck(last_card_in_deck);
list2(nr_in2 + 1) = deck(last_card_in_deck - 1);
list3(nr_in3 + 1) = deck(last_card_in_deck - 2);
list4(nr_in4 + 1) = deck(last_card_in_deck - 3);

nr_in1 = nr_in1 + 1;
nr_in2 = nr_in2 + 1;
nr_in3 = nr_in3 + 1;
nr_in4 = nr_in4 + 1;

last_card_in_deck = last_card_in_deck - 4; 

end
