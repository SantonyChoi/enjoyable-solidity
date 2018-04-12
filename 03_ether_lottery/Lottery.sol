pragma solidity ^0.4.19;

contract Lotto {

    uint256 public round_;
    uint256 public ticketSold_;

    mapping (uint256 => mapping (address => uint256)) public participants_;

    function Lotto() public {
        currentRound_ = 1;
    }

    function () payable public {
        revert();
    }

    function buy_tickets(uint256 _amount) payable public {
        // A participant can only buy less than 10 tickets in a round
        require(participants_[round_][msg.sender] + _amount <= 10);

        participants_[round_][msg.sender] += _amount;
    }
}
