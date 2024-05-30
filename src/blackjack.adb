with Ada.Text_IO;

procedure Blackjack is
  command : String(1..7);
  last    : Natural;
  play    : Boolean := True;

begin

  Ada.Text_IO.Put_Line("Play: " & Boolean'Image(play));

  while play loop
    Ada.Text_IO.Put_Line("Hit, Stay, or Split");
    Ada.Text_IO.Get_Line(command, last);

    if command(1..last) = "hit" then
        Ada.Text_IO.Put_Line("in hit");
    elsif command(1..last) = "stay" then 
        Ada.Text_IO.Put_Line("in stay");
    elsif command(1..last) = "split" then 
        Ada.Text_IO.Put_Line("in split");
    elsif command(1..last) = "quit" then 
        Ada.Text_IO.Put_Line("in quit");
        play := False;
    else 
        Ada.Text_IO.Put_Line("Invalid input try again");
    end if;
  end loop;

end Blackjack;
