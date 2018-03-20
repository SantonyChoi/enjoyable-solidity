pragma solidity ^0.4.18;

contract BTTB {

    event NewGame(uint256 indexed round, address previousWinner, uint256 amount)

    mapping (uint256 => address) public winners_;
    mapping (uint256 => address) public bids_;

    uint256 public round_;
    uint256 public currentBid_;
    address public currentBidder_;

    function BTTB() public {
        round_ = 1;
        NewGame(1, 0x0, 0);
    }

    function bid(uint256 _amount) public payable {
        require(_amount > currentBid_ * 0.99);

    }

    function finishGame() {

    }

    function startNewGame() {
        
    }

}
