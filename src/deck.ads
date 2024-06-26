package Deck is
   type Suit_Type is (HEARTS, DIAMONDS, SPADES, CLUBS);
   type Rank_Type is (ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, INVALID);

   type Card is record
      Rank   : Rank_Type;
      Suit   : Suit_Type;
      Value  : Integer;
      Picked : Boolean;
   end record;

   type Deck_2_0 is array(1..52) of Card;

   function Create_Deck return Deck_2_0;
   function Get_Suit_Char(suit : in Suit_Type) return Character;
end Deck;
