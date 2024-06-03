with Deck use Deck;

package Hand is 

   procedure AddToHand();
   function GetTotal() return Natural;
   function HasBusted() return Boolean;
   procedure Deal();
   
   private
   Total: Integer;
   Card: Deck.Card;

end Hand;
