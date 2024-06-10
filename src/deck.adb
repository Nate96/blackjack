package body Deck is
    function Create_Deck return Deck_2_0 is
        Full_Deck : Deck_2_0;
        Value : Integer;
    begin
        for rank in ACE..KING loop
            --  Set card value starting at 1 (lowest card value ace)
            Value := Rank_Type'Pos(rank) + 1;

            for suit in hearts .. clubs loop
                Full_Deck((Rank_Type'Pos(rank)) * 4 + suit'Enum_Rep + 1) := (Rank => rank, Suit => suit,
                -- Cap the most value to 10 (ace is special case)
                Value => (if Value > 10 then 10 else Value),
                Picked => False);
            end loop;
        end loop;
        return Full_Deck;
    end Create_Deck;

    function Get_Suit_Char(suit : in Suit_Type) return Character is
    begin
       case suit is 
          when HEARTS =>
             return 'H';
          when DIAMONDS =>
             return 'D';
          when SPADES =>
             return 'S';
          when CLUBS =>
             return 'C';
          when others =>
             return 'I';
       end case;
    end Get_Suit_Char;
end Deck;

