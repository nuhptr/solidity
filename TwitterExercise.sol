// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 0. Create a twitter contract
// 1. Create a mapping between user and tweets
// 2. Create a function to add a tweet and save it in the mapping
// 3. Create a function to get the tweets of a user

contract Twitter {
    uint16 constant MAX_TWEET_LENGTH = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    // 0. Create a twitter contract
    function createTweet(string memory _tweet) public {
        // if tweets length <= 280 then we are good, else revert
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet); // msg.sender is the address of the user who calls the function
    }

    // 1. Create a mapping between user and tweets
    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    // 2. Get all tweets of a user
    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
