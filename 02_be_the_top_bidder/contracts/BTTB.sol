pragma solidity ^0.4.18;

import "./Pausable.sol";
import "./Addresses.sol";

contract BTTB is Pausable {
    using Addresses for address;

    struct gameRecord {
        mapping (address => uint256) bidders;

        uint256 reward;
        uint256 lastBid;
        address lastBidder;
        uint256 lastBlock;
    }
    mapping (uint256 => gameRecord) public records_;
    uint256 public round_;

    event NewGame(uint256 indexed round, address previousWinner, uint256 newReward);

    modifier noContract() {
        require(msg.sender.isContract() == false);
        _;
    }

    function BTTB() public {
        round_ = 0;
        startNewGame(0);
    }

    function () public payable {
        revert();
    }

    function bid() public payable noContract whenNotPaused {
        require(msg.value > (records_[round_].lastBid * 110) / 100);

        owner.transfer(msg.value / 100);
        records_[round_].lastBidder.transfer((records_[round_].lastBid * 98) / 100);

        records_[round_].lastBidder = msg.sender;
        records_[round_].lastBid = msg.value;
        records_[round_].lastBlock = block.number;
    }

    function finishGame() public noContract whenNotPaused {
        require(records_[round_].lastBlock != 0);
        require(block.number > records_[round_].lastBlock + 30);
        require(msg.sender == records_[round_].lastBidder);

        msg.sender.transfer(records_[round_].reward);

        startNewGame(this.balance);
    }

    function restartGame() public noContract whenNotPaused {
        require(block.number > records_[round_].lastBlock + 100);

        msg.sender.transfer(records_[round_].lastBid / 100);
        records_[round_].lastBidder.transfer((records_[round_].lastBid * 97) / 100);

        uint256 reward = records_[round_].reward;
        round_ = round_ - 1;
        startNewGame(reward);
    }

    function startNewGame(uint256 _reward) internal {
        round_ = round_ + 1;

        records_[round_] = gameRecord({
            reward: _reward,
            lastBid: 0,
            lastBidder: 0x0,
            lastBlock: 0
        });

        NewGame(round_, records_[round_ - 1].lastBidder, _reward);
    }

}
