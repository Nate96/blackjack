pragma Extensions_Allowed(All);

with Ada.Text_IO; use Ada.Text_IO;
With Deck; use Deck;


procedure Blackjack is
    type Hand is array(1..11) of Deck.Card;

    command  : String(1..7);
    last     : Natural;

    play        : Boolean := True;
    newGame     : Boolean := True;
    Player_Turn : Boolean := True;
    Dealer_Turn : Boolean := True;
    Run_Game    : Boolean := True;

    gameDeck    : Deck.Deck_2_0 := Deck.Create_Deck;
    MAX_VAVLUE  : constant Integer := 21;

    -- Junk card to fill the Hand_Array
    default_card : constant Deck.Card := (Rank => Deck.INVALID, 
                                      Suit => Deck.hearts,
                                      Card_Value => 0,
                                      Picked => True);

    Player_Hand : Hand := (others => default_card);
    Player_Hand_Count : Integer := 0;

    Dealer_Hand : Hand := (others => default_card);
    Dealer_Hand_Count : Integer := 0;

    function Get_Hand_Score(h: Hand) return Integer is
    begin
        total : Integer := 0;
        for I in 1 .. 11 loop
            total := total + h(I).Card_Value;
        end loop;

        return total;
    end Get_Hand_Score;

    function Draw return Deck.Card is
    begin
        return default_card;
    end Draw;

    function Has_Busted(h : Hand) return Boolean is 
    begin 
        Hand_Score : Integer := Get_Hand_Score (h);
        return Hand_Score > MAX_VAVLUE;
    end Has_Busted;

    procedure Print_Hand(h : Hand) is
    begin
        Put_Line("printing hand");
    end Print_Hand;

begin 
    while play loop
        if newGame then
            Player_Hand_Count := Player_Hand_Count + 1;
            Player_Hand(Player_Hand_Count) := Draw;

            Player_Hand_Count := Player_Hand_Count + 1;
            Player_Hand(Player_Hand_Count) := Draw;

            Dealer_Hand_Count := Dealer_Hand_Count + 1;
            Dealer_Hand(Dealer_Hand_Count) := Draw;

            Dealer_Hand_Count := Dealer_Hand_Count + 1;
            Dealer_Hand(Dealer_Hand_Count) := Draw;

            newGame := false;
        end if;

        Put_Line("Dealer Hand: List cards: Total Score:");
        Put_Line("Total Score: " & Integer'Image(Get_Hand_Score(Dealer_Hand)));

        Put_Line("");
        
        Put_Line("Player Hand: List cards: Total Score");
        Put_Line("Total Score: " & Integer'Image(Get_Hand_Score(Player_Hand)));

        Put_Line("");

        if Player_Turn then 
            Put_Line("Hit or stay?");
            Get_Line(command, last);

            if command(1..last) = "hit" then
                Put_Line("in hit");
                Dealer_Hand_Count := Dealer_Hand_Count + 1;
                Dealer_Hand(Dealer_Hand_Count) := Draw;
            elsif command(1..last) = "stay" then 
                Put_Line("in stay");
                Player_Turn := false;
            elsif command(1..last) = "split" then 
                Put_Line("Going to be Implemented in 2.0");
            else 
                Put_Line("Invalid input try again");
            end if;
        else
            Dealer_Score : Integer := Get_Hand_Score(Dealer_Hand);

            if Dealer_Score <= 17 then 
                Dealer_Hand_Count := Dealer_Hand_Count + 1;
                Dealer_Hand(Dealer_Hand_Count) := Draw;
            elsif 10 > Get_Hand_Score(Player_Hand) then
                Put_Line ("dealer stays");
                Dealer_Turn := false;
            end if;
        end if;

        if not Player_Turn and not Dealer_Turn then 
            Put_Line("Dealer Hand: List cards: Total Score");
            Put_Line("Player Hand: List cards: Total Score");

            Put_Line ("Wanna Play Again?");
            Get_Line(command, last);

            if command(1..last) = "yes" then
                Put_Line ("reset data for new game");
            elsif command(1..last) = "no" then 
                play := false;
            end if;
        end if;
    end loop;

end Blackjack;
