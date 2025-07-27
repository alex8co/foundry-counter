// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Counter is Ownable {
    uint256 public number;

    event Incremented(uint256 newNumber);
    event NumberSet(uint256 newNumber);

    constructor(address initialOwner) Ownable(initialOwner) {}

    function setNumber(uint256 newNumber) public onlyOwner {
        number = newNumber;
        emit NumberSet(newNumber);
    }

    function increment() public {
        number++;
        emit Incremented(number);
    }

    function transfer(address newOwner) public onlyOwner {
        transferOwnership(newOwner);
    }
}
