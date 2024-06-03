package Dealer is
   --   private
   --   hands: array(1..3) of Integer;
   --   hand: array(1..3) of Deck.Card;
   --
   --   function draw() return Deck.Card;

   function deal(newGame : in Boolean) return Integer;
end Dealer;
