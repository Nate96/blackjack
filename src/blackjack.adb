with Ada.Text_IO; use Ada.Text_IO;
with Player;


procedure Blackjack is
   type Card is record
      suite: String(1..7);
      value: Natural;
   end record;

  command : String(1..7);
  last    : Natural;
  play    : Boolean := True;
  newGame : Boolean := True;
  My_Float : Float := 3.14;

begin 

  while play loop
     Put(My_Float.Image);
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
