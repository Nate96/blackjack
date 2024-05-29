# Set up
1. Download [Alire](https://ada-lang.io/)
2. Install GCC
- Windows: choco install mingw
-- Install [Chocolatey](https://docs.chocolatey.org/en-us/choco/setup)
- Mac:     brew install gcc
- Ubuntu:  sudo apt install build-essential

 Blackjack
A Basic Blackjack played on the command line written in ADA

# Flow
1. Place Bet
2. Deal 3 cards > 2 to player facing up, and 2 to the dealer one facing up and 
   one facing down
3. Hit or Stay
    Hit    > player draws one more card
    status > dealer draws cards

# End Condition
1. User wins if total is less than 21 and more than total of the dealer
2. Dealer wins if total is less than 21 and more than the total of the user
3. User looses when total is over 21
4. Dealer looses when total is over 21

# Special Cases
1. Splitting
    when the user's first two card are the same number 
    new hands and play in dependently
    hands get another card right after split
    when firsthand stay or bust play second hand
2. Dealer stays when score is >= 17.
3. When someone hits 21 print "BLACK JACK" big
4. Ace can be either 11 or 1 based on the current hand's values

# How To Use
hit   -> draws another card
stay  -> does not draw and keeps score
split -> splits the hand and users plays to hands
quit  -> quits the session
