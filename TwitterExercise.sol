// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 0. Create a twitter contract
// 1. Create a mapping between user and tweets
// 2. Create a function to add a tweet and save it in the mapping
// 3. Create a function to get the tweets of a user

contract Twitter {
    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id; //? make an unique id for each tweet
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    //? add modifier to change the max tweet length
    function changeTweetLenght(uint16 newTweetLenght) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLenght;
    }

    //? 0. Create a twitter contract
    function createTweet(string memory _tweet) public {
        //? if tweets length <= 280 then we are good, else revert
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet); // msg.sender is the address of the user who calls the function
    }

    //? Like Tweet
    function likeTweet() external {
        //? 1. Get the tweet
        //? 2. Increment the likes
        //? 3. Save the tweet
    }

    //? 1. Create a mapping between user and tweets
    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    //? 2. Get all tweets of a user
    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
