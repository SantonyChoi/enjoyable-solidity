pragma solidity ^0.4.19;

contract PayDay {
    address public CEO_;
    address public CFO_;
    address public COO_;

    mapping (uint => address) private idToAccount_;
    mapping (address => uint) private balances_;

    function PayDay() public {

    }

    function () public payable {
        revert();
    }

    function pay() public {

    }

    function withdraw() public {

    }

    function changeAccount() public {

    }
}
