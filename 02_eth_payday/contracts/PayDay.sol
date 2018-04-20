pragma solidity ^0.4.19;

contract PayDay {
    address public CEO_;
    address public CFO_;
    address public COO_;

    // id => account address
    mapping (uint => address) private idToAccount_;
    // id => remaining pay balance
    mapping (uint => uint) private balances_;

    function PayDay() public {

    }

    function () public payable {
        revert();
    }

    function pay() public {

    }

    function withdraw(uint id, uint amount) public {
        require(msg.sender == idToAccount_[id]);
        require(amount <= balances_[id]);
        msg.sender.transfer(amount);
    }

    function changeAccount() public {

    }
}
