// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Test {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        // _; tells solidity where to put / run the rest of the code
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
