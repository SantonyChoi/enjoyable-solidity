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

    modifier onlyCEO() {
        require(msg.sender == CEO_);
        _;
    }

    modifier onlyCFO() {
        require(msg.sender == CFO_);
        _;
    }

    modifier onlyCOO() {
        require(msg.sender == COO_);
        _;
    }

    function setCEO(address newCEO) onlyCEO public {
        CEO_ = newCEO;
    }

    function setCOO(address newCOO) onlyCEO public {
        COO_ = newCOO;
    }

    function setCFO(address newCFO) onlyCEO public {
        CFO_ = newCFO;
    }

    function () public payable {
        revert();
    }

    function pay(uint id, uint amount) public payable {
        balances_[id] += amount;
    }

    function withdraw(uint id, uint amount) public {
        require(msg.sender == idToAccount_[id]);
        require(amount <= balances_[id]);
        msg.sender.transfer(amount);
    }

    // It would be good to add grant and receive logic here
    function changeAccount(uint id, address newAddress) public {
        require(msg.sender == idToAccount_[id]);
        require(balances_[id] == 0);
        idToAccount_[id] = newAddress;
    }
}
