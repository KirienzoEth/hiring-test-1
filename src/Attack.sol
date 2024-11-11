// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

import {Lottery} from "./Lottery.sol";

contract Attack {
    Lottery immutable LOTTERY;

    constructor(Lottery lottery) {
        LOTTERY = lottery;
    }

    function attack() payable external {
        // TODO edit this function to drain the lottery contract
    }
}
