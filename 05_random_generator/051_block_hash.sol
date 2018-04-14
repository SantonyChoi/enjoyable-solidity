pragma solidity ^0.4.19;

// Warning! This is insecure. Do not use it in your product.
contract BlockHashRandom {
    function getRandom() view public returns (uint256) {
        bytes32 previousBlockHash = block.blockhash(block.number - 1);
        return uint256(previousBlockHash) * block.timestamp;
    }
}
