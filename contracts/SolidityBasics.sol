//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
contract SolidityBasics{

    // ---VARIABLES---

    // If public then variable acts as getter function and we can get value inside variable outside of the blockchain
    // This do not cost any gas as we are just reading variable and not changing any thing
    // Default visibility is internal
    uint256 public favNum; // Counted as view getter function

    // ---FUNCTIONS---

    // It will cost gas as we are changing state of blockchain (YELLOW COLOR)
    function store (uint256 _favNum) external {
        favNum = _favNum;
    }

    // Types of gasless functions
    // Calling this functions is free unless we call it inside functions that will cause gas

    // 1] view: Allows to only read and no change of blockchain state (BLUE COLOR)
    function retrieve() public view returns(uint256){
        return favNum;
    }

    // 2] pure: Do not allows reading as well as modification of blockchain (BLUE COLOR)
    // Its is usually used when we have to just perfom intermediate calculations and save gas
    function add() public pure returns(uint256){
        return(1+1);
    }

    // ---STRUCTS---
    // Abstract datatype
    struct People{
        uint256 favNumber;
        string name;
    }
    
    People public person = People({favNumber:2, name:"raj"});

    // creating array of structs
    People[] public people;

    function addPerson(string memory _name, uint256 _favoriteNum) public {
        People memory newPerson = People(_favoriteNum,_name);
        people.push(newPerson);
    }

    // ---STORING VARIABLES---

    // memory: storing variable temporary for a transaction and can be modified (No gas required)
    // calldata: storing variable temporary for a transaction and cannot be modified (No gas required)
    // storage: storing variable permanently on blockchain and can be modified (Gas required)
    
}