pragma solidity ^0.4.18;

// TODO: `stoppable` option to prevent possible bug from taking this game away.
// TODO: `resetable` option to prevent possible bug from taking this game away.
contract BTTB is ownable {
    struct gameRecord_ {
        mapping (address => uint256) public bidders_;

        uint256 public reward_;
        uint256 public lastBid_;
        address public lastBidder_;
        uint256 public lastBlock_;
    }
    mapping (uint256 => gameRecord_) public records_;
    uint256 public round_;

    event NewGame(uint256 indexed round, address previousWinner, uint256 newReward);

    function BTTB() public {
        round_ = 0;
        startNewGame(0);
    }

    function bid() public payable {
        require(msg.value > (currentBid_ * 110) / 100);

        owner.transfer(msg.value / 100);
        records_[round_].lastBidder_.transfer(records_[round_].lastBid_);
        records_[round_].lastBidder_ = msg.sender;
        records_[round_].lastBid_ = msg.value;
        records_[round_].lastBlock_ = msg.value;

    }

    function finishGame() public payable {
        require(records_[round_].lastBlock_ != 0)


    }

    function startNewGame(uint256 _reward) public {
        round_ = round_ + 1;

        gameRecord_ memory entity = gameRecord_({
            reward_ = _reward,
            currentBid_ = 0,
            currentBidder_ = 0x0,
            lastBlock_ = 0
        });

        records_[round_] = entity;
        NewGame(round_, records_[round_ - 1].lastBidder, _reward);
    }

}
