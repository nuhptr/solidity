// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint256 result = 0;

    //* Function add
    function add(uint256 newNumber) public {
        result += newNumber;
    }

    //* Function subtract
    function subtract(uint256 newNumber) public {
        result -= newNumber;
    }

    //* Function multiply
    function multiply(uint256 newNumber) public {
        result *= newNumber;
    }

    //* Function divide
    function divide(uint256 newNumber) public {
        result /= newNumber;
    }

    //* Function getResult
    function getResult() public view returns (uint256) {
        return result;
    }
}
