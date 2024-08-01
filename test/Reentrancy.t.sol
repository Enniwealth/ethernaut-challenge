// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


import  {AttackReentrancy} from "../src/AttackReentrancy.sol";
import  {Reentrance} from "../src/Re-entrancy.sol";

import {Test, console} from "forge-std/Test.sol";

contract ReentrancyTest is Test {

   AttackReentrancy attackReentrancy;
   Reentrance reentrancy;

    address attacker = makeAddr('atttackr');
    function setUp() public {
       reentrancy = new Reentrance();
        attackReentrancy = new AttackReentrancy(payable(address(reentrancy)));
        deal(address(reentrancy), 3 ether);
        deal(address(attackReentrancy), 1 ether);
    }
    function test_attack() public {
        assertEq(address(reentrancy).balance, 3 ether);
        vm.prank(attacker);
        attackReentrancy.attack();
        assertEq(address(reentrancy).balance, 0);
    }
}