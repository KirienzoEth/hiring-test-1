// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Lottery} from "../src/Lottery.sol";
import {Attack} from "../src/Attack.sol";

contract AttackTest is Test {
    Lottery public lottery;
    Attack public attack;

    function setUp() public {
        lottery = new Lottery{value: 0.5 ether}();
        attack = new Attack(lottery);
    }

    function test_drained() public {
        attack.attack{value: 0.5 ether}();

        assertEq(address(lottery).balance, 0);
    }
}
