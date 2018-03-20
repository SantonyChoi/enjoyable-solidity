# Be the Top Bidder
This is a simple Ethereum game that has a couple rules.
1. A game starts every 2 hours.
2. A player who bids the most within a game will be a top bidder until a new player bids more. If the new bidder has a former bid, the player gets the former bid back.
3. At the end of the game, a player who had been a top bidder for the longest minutes will win. The player get the reward. The accumulated bids become the next game's reward.

As a master of the game, The owner of this `Game Contract` will get 1% of every bids as a fee.

## Prerequisite
<!-- - One of the two followings
  - [Metamask][metamask] (It's easier)
  - Local Ethereum node on port 8545, which is attached to Ehtereum Mainnet
    - [Geth][geth]
    - [Parity][parity]
    - or whatever -->
- [Truffle][truffle]
- Node.js
  - I used `lite-server` for running it

## How to run
```
$ npm install
$ npm run dev
```

## Warning
**You should play this game with a regular external account. Contract accounts can cause an unsuspected behaviour**

## Demo
[Github pages][demo-page]

[truffle]:https://github.com/trufflesuite/truffle
[demo-page]:https://santonychoi.github.io/enjoyable-solidity/02_be_the_top_bidder/src/index.html
