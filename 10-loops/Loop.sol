// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Looping {
    function countUp(uint256 limit) public pure returns (uint256) {
        uint sum = 0;

        for (uint i = 0; i < limit; i++) {
            sum += i;
        }
        return sum; // 0 + 1 + 2 + ... + limit - 1
    }
}
