# Portfolio Rebalancer #

The portfolio rebalancer makes rebalancing your portfolio easy and fun.

## Config File ##

In the config file, enter the target allocation of your portfolio, and a
minimum trade amount.

    target_allocation =
    {
        { 'Money market', 0/10 },
        { 'Canadian equity', 3/10 },
        { 'U.S. equity', 3/10 },
        { 'International equity', 3/10 },
        { 'Canadian bond', 1/10 },
    }
    min_trade = 100

The default config file contains sample allocations for the [MoneySense Couch
Potato portfolios][1], or you can make your own.

[1]: http://www.moneysense.ca/2006/04/05/couch-potato-portfolio-how-to-set-it-up/

## Rebalancing ##

Run the program.

    $ lua rebalancer.lua 
    Portfolio Rebalancer

It will ask you for the current balances of the funds in your portfolio.

    CURRENT BALANCE
              Money market: 1000
           Canadian equity: 11000
               U.S. equity: 9000
      International equity: 10500
             Canadian bond: 0

Then the program will show you the target balances, and the difference from
current to target balance, for each fund.

    TARGET BALANCE
              Money market:       0   -1000
           Canadian equity:    9450   -1550
               U.S. equity:    9450    +450
      International equity:    9450   -1050
             Canadian bond:    3150   +3150

Finally, the program will show you a series of trades to make to achieve your
target allocation.

    TRADES
              Money market  -->  U.S. equity           450
              Money market  -->  Canadian bond         550
           Canadian equity  -->  Canadian bond         1550
      International equity  -->  Canadian bond         1050

The search is very simple (not exhaustive). The program will complain if it
cannot find a series of trades to satisfy inputs. In that case, simply use the
differences above to find a series of trades that satisfy you.
