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

    function pay(uint id, uint amount) public payable {
        balances_[to] += amount;
    }

    function withdraw(uint id, uint amount) public {
        require(msg.sender == idToAccount_[id]);
        require(amount <= balances_[id]);
        msg.sender.transfer(amount);
    }

    // It would be good to add grant and receive logic here
    function changeAccount(uint id, uint newAddress) public {
        require(msg.sender == idToAccount_[id]);
        require(balances_[id] == 0);
        idToAccount_[id] = newAddress;
    }
}
