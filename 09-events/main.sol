// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    //* adding event with indexed user and username as logging events
    event NewUserRegistered(address indexed _user, string username);

    struct User {
        uint256 id;
        string username;
        uint256 age;
    }

    mapping(address => User) public users;

    function registerUser(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        //* emit event with msg.sender and username as the inputs
        //* CODE HERE
        emit NewUserRegistered(msg.sender, _username);
    }
}
