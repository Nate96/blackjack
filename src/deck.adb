package body Deck is
    function Create_Deck return Deck_2_0 is
        Full_Deck : Deck_2_0;
        Value : Integer;
    begin
        for I in ACE..KING loop
            --  Set card value starting at 1 (lowest card value ace)
            Value := Rank_Type'Pos(I) + 1;
            for J in hearts .. clubs loop
                Full_Deck((Rank_Type'Pos(I)) * 4 + J'Enum_Rep + 1) := (Rank => I, Suit => J,
                -- Cap the most value to 10 (ace is special case)
                Card_Value => (if Value > 10 then 10 else Value),
                Picked => False);
            end loop;
        end loop;
        return Full_Deck;
    end Create_Deck;
end Deck;

