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
}
