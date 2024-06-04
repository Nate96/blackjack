package Deck is
   type Suit_Type is (hearts, diamonds, spades, clubs);
   type Rank_Type is (ACE, TWO, THREE, FOUR, FIVE, SIX, 
      SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, INVALID);
   type Card is record
      Rank : Rank_Type;
      Suit : Suit_Type;
      Card_Value : Integer;
      Picked : Boolean;
   end record;

   type Deck_2_0 is array(1..52) of Card;

   function Create_Deck return Deck_2_0;
end Deck;

