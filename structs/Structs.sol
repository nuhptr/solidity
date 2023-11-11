// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TeslaRegistry {
    struct Tesla {
        string model;
        uint256 year;
        uint price;
        string color;
        uint256 mileage;
        string vin;
    }

    Tesla[] public teslas;

    function createTesla(
        string memory _model,
        uint256 _year,
        uint _price,
        string memory _color,
        uint256 _mileage,
        string memory _vin
    ) public {
        Tesla memory newTesla = Tesla({
            model: _model,
            year: _year,
            price: _price,
            color: _color,
            mileage: _mileage,
            vin: _vin
        });

        teslas.push(newTesla);
    }
}
