// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract PausableToken {
    address public owner;
    bool public paused;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    modifier onlyOwner() {
        // implement the modifier only allow the owner to call the function
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    modifier notPaused() {
        // implement the modifier only allow the function to be called when the contract is not paused
        require(paused == false, "Contract is paused");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    function transfer(address _to, uint _amount) public notPaused {
        // implement transfer function
        require(
            balances[msg.sender] >= _amount,
            "You don't have enough tokens"
        );

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}
