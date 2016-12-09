function [clubs,diamonds,spades,hearts] = update_top_layer(list1,list2,list3,list4,nr_in1,nr_in2,nr_in3,nr_in4)

clubs = 0;
diamonds = 0;
spades = 0;
hearts = 0;

%Finds the top card in pile 1
[tmp1,tmp2,tmp3,tmp4] = what_is_this(list1,nr_in1);
clubs = clubs + tmp1;
diamonds = diamonds + tmp2;
spades = spades + tmp3;
hearts = hearts + tmp4;

%Finds the top card in pile 2
[tmp1,tmp2,tmp3,tmp4] = what_is_this(list2,nr_in2);
clubs = clubs + tmp1;
diamonds = diamonds + tmp2;
spades = spades + tmp3;
hearts = hearts + tmp4;

[tmp1,tmp2,tmp3,tmp4] = what_is_this(list3,nr_in3);
clubs = clubs + tmp1;
diamonds = diamonds + tmp2;
spades = spades + tmp3;
hearts = hearts + tmp4;

[tmp1,tmp2,tmp3,tmp4] = what_is_this(list4,nr_in4);
clubs = clubs + tmp1;
diamonds = diamonds + tmp2;
spades = spades + tmp3;
hearts = hearts + tmp4;


end