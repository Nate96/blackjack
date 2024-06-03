# Blackjack
A Basic Blackjack played on the command line written in ADA

# Set up
1. Download [Alire](https://ada-lang.io/)
2. Install GCC
- Windows: choco install mingw
-- Install [Chocolatey](https://docs.chocolatey.org/en-us/choco/setup)
- Mac:     brew install gcc
- Ubuntu:  sudo apt install build-essential

# Flow
1. Place Bet
2. Deal 2 cards 
- 2 to player facing up, and 2 to the dealer one facing up and one facing down
3. hit, stay, or split
    Hit    > player draws one more card
    stay   > dealer draws cards
    split  > when user draws two of the same card split and play two hands 

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

# Design 
main
    play = true
    get(command)

    dealer.dealIn();

    while(play):
        string command = ""
        switch command
            case hit:
                dealer.drawCard();
                presenter.UpdateScree();
                break;
            case split:
                dealer.Split()
                dealer.drawCard();
                presenter.UpdateScree();
                break;
            case stay:
                dealer.play();
                presenter.UpdateScree();
                break;
            case quit:
                play = false;
                break;
            case default:
                "invalid input try again"
                break;

Dealer:
    hand Card[];
    hands hand[];
    
    public void AddToHand(int index);
    public int GetHandTotal(int index);
    public bool HasBusted(int index);
    public draw():

Deck:
    deck card[]


    public Deck()
    public card DrawCard()

Presenter:
    present():

```mermaide

```
