// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//* Multiplayer Game Contract
contract MultiplayerGame {
    mapping(address => bool) public players;

    function joinGame() public virtual {
        players[msg.sender] = true;
    }
}

//* Game Contract
contract Game is MultiplayerGame {
    string public gameName;
    uint256 public playerCount;

    constructor(string memory _gameName) {
        gameName = _gameName;
        playerCount = 0;
    }

    function startGame() public {
        //* perform game-specific logic
    }

    function joinGame() public override {
        super.joinGame(); //* function from parent contract
        //* add your own logic
        playerCount++;
    }
}
