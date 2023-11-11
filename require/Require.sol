// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleToken {
    uint256 public maxPerMin = 3;

    function mint(uint256 amount) public view {
        require(
            amount <= maxPerMin,
            "You can't mint more than 3 tokens per minute"
        );

        // ....
        // _mint(amount)
    }
}
