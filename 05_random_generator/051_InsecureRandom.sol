pragma solidity ^0.4.19;

// Warning! This is insecure. Do not use it in your product.
contract InsecureRandom {
    function getBlockHashRand(uint256 seed) view public returns (uint256) {
        bytes32 previousBlockHash = block.blockhash(block.number - 1);
        return uint256(previousBlockHash) * seed;
    }

    function getTimestampRand(uint256 seed) view public returns (uint256) {
        uint256 currentTimestamp = block.timestamp;
        return currentTimestamp * seed;
    }

    // The two functions below are called in the order.
    uint private betBlockNum_;
    function setFutureRand() public {
        betBlockNum_ = block.number;
    }

    function getFutreRand() public view returns (uint256) {
        return uint256(block.blockhash(betBlockNum_));
    }
}
