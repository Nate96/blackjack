with Ada.Text_IO; use Ada.Text_IO;
With Deck; use Deck;


procedure Blackjack is
    type Hand is array(1..10) of Deck.Card;
    type Hands is array(1..3) of Hand;

    command  : String(1..7);
    last     : Natural;

    play     : Boolean := True;
    newGame  : Boolean := True;
    gameDeck : Deck.Deck_2_0 := Deck.Create_Deck;

begin 

    while play loop
        Put_Line("Hit, Stay, or Split");
        Get_Line(command, last);

        if command(1..last) = "hit" then
            Put_Line("in hit");
        elsif command(1..last) = "stay" then 
            Put_Line("in stay");
        elsif command(1..last) = "split" then 
            Put_Line("in split");
        elsif command(1..last) = "quit" then 
            Put_Line("in quit");
            play := False;
        else 
            Put_Line("Invalid input try again");
        end if;
    end loop;

end Blackjack;
