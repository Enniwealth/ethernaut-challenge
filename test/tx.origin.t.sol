// 1. Set the msg.msg.sender
// 2. call the function


// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Telephone} from "../src/tx.origin.sol";

contract CounterTest is Test {
   Telephone public telephone;
    address NewOwner = makeAddr('NewOwner');
    address Owner = makeAddr('Owner');

    function setUp() public {
        vm.prank(Owner);
        telephone = new Telephone();
    }
    function test_getOwnershi() public {
        assertEq(Owner,telephone.owner());

        vm.prank(NewOwner);

        telephone.changeOwner(NewOwner);
        assertEq(NewOwner, telephone.owner());
    }
}
    