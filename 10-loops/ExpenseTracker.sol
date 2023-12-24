// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense {
        address user;
        string description;
        uint256 amount;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, "Coffee", 5));
        expenses.push(Expense(msg.sender, "Donut", 2));
        expenses.push(Expense(msg.sender, "New SSD drive", 200));
    }

    modifier onlyOwner() {
        require(msg.sender == expenses[0].user, "Only owner can add expenses");
        _;
    }

    function addExpense(
        string memory _description,
        uint256 amount
    ) public onlyOwner {
        expenses.push(Expense(msg.sender, _description, amount));
    }

    function getTotalExpenses(address _user) public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < expenses.length; i++) {
            if (expenses[i].user == _user) {
                total += expenses[i].amount;
            }
        }
        return total;
    }
}
