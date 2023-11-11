// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ArrayExample {
    // This is a dynamic array, it can be resized
    uint[] public dynamicArray;

    // This is a fixed-size array, it cannot be resized
    uint[5] public fixedArray = [1, 2, 3, 4, 5];

    function addToDynamicArray(uint _value) public {
        // add new element to the end of array
        dynamicArray.push(_value);
    }

    function getDynamicArrayLength() public view returns (uint) {
        // get length of array
        return dynamicArray.length;
    }
}
