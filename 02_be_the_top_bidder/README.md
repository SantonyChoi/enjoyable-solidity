# Be the Top Bidder
This is a simple Ethereum game that has a couple rules.
1. A player who bids the most within a game will be a top bidder until a new player bids more. If the new bidder has a former bid, the player gets 99% of the former bid back.
2. The top bidder can finish the game and get the reward 30 blocks after bidding transaction, by paying winning fee. The last bid by the top bidder will be a reward for the next game.
3. If the top bidder doesn't finish the game within 100 blocks, anyone can stop and restart the game with the same reward.

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
***You should play this game with a regular external account. Contract accounts can cause an unsuspected behaviour***

## Demo
[Github pages][demo-page]

[truffle]:https://github.com/trufflesuite/truffle
[demo-page]:https://santonychoi.github.io/enjoyable-solidity/02_be_the_top_bidder/src/index.html
