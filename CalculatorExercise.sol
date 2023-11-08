// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 0. Create a contract called Calculator
// 1. Create a state variable called result
// 2. Create a function called add that add, substract, multiply and divide a number to the result
// 3. Create function to get the result

contract Calculator {
    uint256 result = 0;

    function add(uint256 number1, uint256 number2) public {
        result = number1 + number2;
    }

    function substract(uint256 number1, uint256 number2) public {
        result = number1 - number2;
    }
}

contract AdvancedCalculator is Calculator {
    function multiply(uint256 number1, uint256 number2) internal {
        result = number1 * number2;
    }

    function divide(uint256 number1, uint256 number2) internal {
        result = number1 / number2;
    }

    function performOperation(
        uint256 number1,
        uint256 number2,
        uint8 operation
    ) internal {
        if (operation == 0) add(number1, number2);
        else if (operation == 1) substract(number1, number2);
        else if (operation == 2) multiply(number1, number2);
        else if (operation == 3) divide(number1, number2);
        else revert("Invalid operation");
    }
}
