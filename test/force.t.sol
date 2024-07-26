// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Force} from "../src/force.sol";
import {AttackTx} from "../src/Attackx.sol";

contract DelegateTest is Test {
    Force public force;
    AttackTx public attackTx;
    address NewOwner = makeAddr('NewOwner');
    address Owner = makeAddr('Owner');
    
    function setUp() public {
        force = new Force();
        attackTx = new AttackTx(payable(address(force)));
        vm.deal(address(attackTx), 1 ether);
    }

    function testCallAttack () public {
        assertEq(address(force).balance, 0);

        attackTx.attack();

        assertGe(address(force).balance, 1 ether );
    }
}