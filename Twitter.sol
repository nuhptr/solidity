// SPDX-License-Identifier: MIT

// import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

interface IProfileTwitter {
    struct UserProfile {
        string displayName;
        string bio;
    }

    //* code here
    function getProfile(
        address _user
    ) external view returns (UserProfile memory);
}

contract Twitter {
    //* add event logging
    event TweetCreated(
        uint256 id,
        address author,
        string content,
        uint256 timestamp
    );
    event TweetLiked(
        address liker,
        address tweetAuthor,
        uint256 tweetId,
        uint256 newLike
    );
    event TweetUnliked(
        address unliker,
        address tweetAuthor,
        uint256 tweetId,
        uint256 newLike
    );

    //* adding structs
    struct Tweet {
        //* add id
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint16 MAX_TWEETS_LENGTH = 140;
    IProfileTwitter public profileContract;

    //* adding mapping
    mapping(address => Tweet[]) public tweets;
    address public owner;

    constructor(address _profileContract) {
        profileContract = IProfileTwitter(_profileContract);
        owner = msg.sender;
    }

    // ---------Modifiers---------
    modifier onlyRegistered() {
        IProfileTwitter.UserProfile memory profile = profileContract.getProfile(
            msg.sender
        );
        require(
            bytes(profile.displayName).length > 0,
            "User must be registered"
        );
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEETS_LENGTH = newTweetLength;
    }

    //* adding function getTotalLikes
    function sumAllLikes(address _author) external view returns (uint256) {
        uint256 totalLikes = 0;

        for (uint256 i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }
        return totalLikes;
    }

    //* adding function to create tweets
    function createTweets(string memory _tweet) public onlyRegistered {
        //* conditional => if tweet length is less than 140 characters are good, otherwise throw an error
        require(
            bytes(_tweet).length <= MAX_TWEETS_LENGTH,
            "Tweet must be less than 140 characters"
        );

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 1
        });

        tweets[msg.sender].push(newTweet);

        emit TweetCreated(
            newTweet.id,
            newTweet.author,
            newTweet.content,
            newTweet.timestamp
        );
    }

    //* adding function to like tweets for universal user
    function likeTweet(address author, uint256 _id) external onlyRegistered {
        require(tweets[author][_id].id == _id, "Tweet does not exist");

        tweets[author][_id].likes++;

        emit TweetLiked(msg.sender, author, _id, tweets[author][_id].likes);
    }

    //* adding function to unlike tweets for universal user
    function unlikeTweet(address author, uint256 _id) external onlyRegistered {
        require(tweets[author][_id].id == _id, "Tweet does not exist");
        require(tweets[author][_id].likes > 0, "Tweet has no likes");

        tweets[author][_id].likes--;

        emit TweetUnliked(msg.sender, author, _id, tweets[author][_id].likes);
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
