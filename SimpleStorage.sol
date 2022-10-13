//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // solidity version

//defining our contract.
contract SimpleStorage {
    // this gets initialized to zero
    uint256 public favoriteNumber;
    // People public person = People({favoriteNumber: 30, name: "David"});

    mapping(string => uint256) public nameToFavouriteNumber;
     
    // uint256[] public favoriteNumber
    People[] public people;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavouriteNumber[_name] = _favoriteNumber;
    }
}

//0xE08BFF3747Ea35F9Df9f5F0B90f3c618Bc418535 contract address
// 0xB34a6d412bD8e71994dfEee92154F0Ca418f3703 wallet address