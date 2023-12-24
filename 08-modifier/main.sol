// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableToken {
    address public owner;
    bool public paused;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        //* _; is a special character that tells Solidity to execute the rest of the code
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        //* _; is a special character that tells Solidity to execute the rest of the code
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    function transfer(address to, uint256 amount) public whenNotPaused {
        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
