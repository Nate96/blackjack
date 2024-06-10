pragma Extensions_Allowed(All);

with Ada.Text_IO; use Ada.Text_IO;
With Deck; use Deck;
with Ada.Numerics.Discrete_Random; 

procedure Blackjack is
    -- TODO:
   -- 4. Fix Random Generator 
   --  draw card

    -- Junk card to fill the Hand_Array
    DEFAULT_CARD : constant Deck.Card := (Rank => Deck.INVALID, 
                                      Suit => Deck.hearts,
                                      Value => 0,
                                      Picked => True);
    MAX_HAND_COUNT     : constant Integer := 11;
    MAX_COMMAND_LENGTH : constant Integer :=  7;
    BLACK_JACK         : constant Integer := 21;
    
    type Hand is array(1..MAX_HAND_COUNT) of Deck.Card;

    command  : String(1..MAX_COMMAND_LENGTH);
    last     : Natural;

    play        : Boolean := True;
    New_Game    : Boolean := True;
    Player_Turn : Boolean := True;
    Dealer_Turn : Boolean := True;
    Run_Game    : Boolean := True;

    Game_Deck   : Deck.Deck_2_0 := Deck.Create_Deck;

    Player_Hand : Hand := (others => default_card);
    Player_Hand_Count : Integer := 0;

    Dealer_Hand : Hand := (others => default_card);
    Dealer_Hand_Count : Integer := 0;

    function Get_Hand_Score(h: in Hand) return Integer is
       high_score : Integer := 0;
       low_score  : Integer := 0;
    begin
        for card in 1 .. MAX_HAND_COUNT loop
           if h(card).Value = 1 then
              high_score := high_score + 10;
              low_score := low_score + 1;
           else
              high_score := high_score + h(card).Value;
              low_score := low_score + h(card).Value;
           end if;
        end loop;
         
        -- (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        -- (1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0)  > 8, 18 > 18 
        -- (1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0) > 11, 21 > 21 
        --
        --
        -- (3, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0) > 8, 19 > 19
        -- (3, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0) > 10, 21 > 21
        --
        -- (10, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0) > 14, 24 > 24
        -- (10, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0) > 15, (>22) > 15
        -- (10, 3, 1, 1, 5, 0, 0, 0, 0, 0, 0) > 20, (>22) > 20
        if high_score <= BLACK_JACK and low_score <= BLACK_JACK then
           return high_score;
        elsif low_score > BLACK_JACK then
           return BLACK_JACK + 1;
        else
           return low_score;
        end if;
    end Get_Hand_Score;

    function Draw return Deck.Card is
    begin
        Card       : Deck.Card;
        Card_Index : Integer := 0;

--        loop
--            -- Card_Index := Random_Generator.Random(Gen);
--            Card := Game_Deck(Card_Index);
--            exit when not Card.Picked;
--        end loop;
--
--        Card.Picked := True;
--        return Card;

        return default_card;
    end Draw;

    procedure Print_Hand(h : Hand) is
    begin
       Put_Line("printing hand");
       for I in 1 .. MAX_HAND_COUNT loop
          suite_char : Character := Get_Suit_Char(h(i).Suit);
          card_value : Integer := h(i).Value;
          
          if card_value = 1 then 
             Put("A," & Integer'Image(card_value) & "; ");
          elsif card_value > 0 then
             Put(suite_char & "," & Integer'Image(card_value) & "; ");
          end if;
       end loop;
          Put_Line("");
    end Print_Hand;

begin 
    -- Random_Generator.Reset(Gen);

    while play loop
        if New_Game then
            Player_Hand_Count := Player_Hand_Count + 1;
            Player_Hand(Player_Hand_Count) := Draw;

            Player_Hand_Count := Player_Hand_Count + 1;
            Player_Hand(Player_Hand_Count) := Draw;

            Dealer_Hand_Count := Dealer_Hand_Count + 1;
            Dealer_Hand(Dealer_Hand_Count) := Draw;

            Dealer_Hand_Count := Dealer_Hand_Count + 1;
            Dealer_Hand(Dealer_Hand_Count) := Draw;

            New_Game := false;
        end if;

        -- Print Details
        Put("Dealer Hand: ");
        Print_Hand(Dealer_Hand);
        score : Integer := Get_Hand_Score(Dealer_Hand);

        if score > BLACK_JACK then 
           Put_Line ("Bust");
        else
           Put_Line("Total Score: " & Integer'Image(score));
        end if;

        Put_Line("");
        
        Put("Player Hand: ");
        Print_Hand(Dealer_Hand);
        score := Get_Hand_Score(Dealer_Hand);

        if (score > BLACK_JACK) then 
           Put_Line ("Bust");
        else
           Put_Line("Total Score: " & Integer'Image(score));
        end if;

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
            elsif command(1..last) = "quit" then 
               play := false;
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
