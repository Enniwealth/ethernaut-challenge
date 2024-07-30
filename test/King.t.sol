// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AttackKing} from "../src/AttackKing.sol";
import {King} from "../src/king.sol";


contract CounterTest is Test {
    AttackKing public attackKing;
    King public king;
    address NewOwner = makeAddr('NewOwner');
    address Owner = makeAddr('Owner');
    address Naruto = makeAddr('Naruto');



    function setUp() public {
        deal(Owner, 1 ether);

        vm.prank(Owner);
        king = new King{value: 0.5 ether}();

        attackKing = new AttackKing(payable(address(king)));

        

        deal(NewOwner, 1 ether);

        deal(address(attackKing), 1 ether);
        


    }

    function test_attackKing() public {

        assertEq(king.owner(), Owner);
        
        attackKing.attack{value: 1 ether}();

        vm.prank(NewOwner);
        attackKing.attack{value: 1 ether}();
        // assertEq(king.owner(), address(this));
        assertEq(1 ether, address(attackKing).balance );
        // assertGe(address(attackKing).balance, 1.5 ether);

        

    }

        
        
}