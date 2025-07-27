// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract CounterTest is Test {
    Counter public counter;
    address public owner;
    address public user;
    address public newUser;

    event Incremented(uint256 newNumber);
    event NumberSet(uint256 newNumber);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function setUp() public {
        owner = address(this);
        user = makeAddr("user");
        newUser = makeAddr("newUser");
        counter = new Counter(owner);
    }

    function test_InitialState() public view {
        assertEq(counter.number(), 0, "Initial number should be 0");
        assertEq(counter.owner(), owner, "Initial owner should be the deployer");
    }

    function test_Increment() public {
        vm.expectEmit(true, true, true, true);
        emit Incremented(1);
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_IncrementFromNonOwner() public {
        vm.startPrank(user);
        vm.expectEmit(true, true, true, true);
        emit Incremented(1);
        counter.increment();
        assertEq(counter.number(), 1, "Number should be incremented by non-owner");
        vm.stopPrank();
    }

    function testFuzz_SetNumber(uint256 x) public {
        vm.expectEmit(true, true, true, true);
        emit NumberSet(x);
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testFuzz_RevertWhen_SetNumberFromNonOwner(uint256 x) public {
        vm.startPrank(user);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, user));
        counter.setNumber(x);
        vm.stopPrank();
    }

    function test_TransferOwnership() public {
        vm.expectEmit(true, true, true, true);
        emit OwnershipTransferred(owner, newUser);
        counter.transfer(newUser);
        assertEq(counter.owner(), newUser, "New owner should be newUser");
    }

    function test_RevertWhen_TransferFromNonOwner() public {
        vm.startPrank(user);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, user));
        counter.transfer(newUser);
        vm.stopPrank();
    }
}
