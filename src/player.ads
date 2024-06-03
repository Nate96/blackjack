package Player is
   type Player is abstract tagged record
      isDealer: Boolean;
   end record;

   function Hello(P: Player) return Float;

end Player;

