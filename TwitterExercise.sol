// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 0. Create a twitter contract
// 1. Create a mapping between user and tweets
// 2. Create a function to add a tweet and save it in the mapping
// 3. Create a function to get the tweets of a user

contract Twitter {
    mapping(address => string[]) public tweets;

    // 0. Create a twitter contract
    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet); // msg.sender is the address of the user who calls the function
    }

    // 1. Create a mapping between user and tweets
    function getTweet(
        address _owner,
        uint _i
    ) public view returns (string memory) {
        return tweets[_owner][_i];
    }

    // 2. Get all tweets of a user
    function getAllTweets(
        address _owner
    ) public view returns (string[] memory) {
        return tweets[_owner];
    }
}
