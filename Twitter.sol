// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    //* adding structs
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint16 constant MAX_TWEETS_LENGTH = 140;
    //* adding mapping
    mapping(address => Tweet[]) public tweets;

    //* adding function to create tweets
    function createTweets(string memory _tweet) public {
        //* conditional => if tweet length is less than 140 characters are good, otherwise throw an error
        require(
            bytes(_tweet).length <= MAX_TWEETS_LENGTH,
            "Tweet must be less than 140 characters"
        );

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 1
        });

        tweets[msg.sender].push(newTweet);
    }

    //* adding function to get tweet
    function getTweet(uint index) public view returns (Tweet memory) {
        return tweets[msg.sender][index];
    }

    //* adding function to get all tweets
    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
