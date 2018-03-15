# Ethereum Account Generator
This simple app generates a private key and shows corresponding address with its balance. You might find an account which is owned by some rich guy. Unfortunately, [it is a bit difficult][how-difficult], though.

## Prerequisite
- One of the two followings
  - [Metamask][metamask] (It's easier)
  - Local Ethereum node on port 8545, which is attached to Ehtereum Mainnet
    - [Geth][geth]
    - [Parity][parity]
    - or whatever
- Node.js
  - I used `lite-server` for running it

## How to run
```
$ npm install
$ npm run dev
```

[how-difficult]: https://www.reddit.com/r/Bitcoin/comments/1rurll/on_the_subject_of_listing_all_possible_private/
[metamask]:https://metamask.io/
[geth]:https://github.com/ethereum/go-ethereum
[parity]:https://github.com/paritytech/parity
