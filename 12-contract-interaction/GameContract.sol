// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUser {
    function createUser(address userAddress, string memory username) external;
}

contract Game {
    uint public gameCount;
    IUser public userContract;

    constructor(address _userContractAddress) {
        // Code Here
        userContract = IUser(_userContractAddress);
    }

    function startGame(string memory username) external {
        // Create a user in the User Contract
        gameCount++;

        // Code Here
        userContract.createUser(msg.sender, username);
    }
}
