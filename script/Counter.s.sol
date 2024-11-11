// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

import {Script} from "forge-std/Script.sol";

import {Attack} from "../src/Attack.sol";
import {Lottery} from "../src/Lottery.sol";

contract AttackScript is Script {
    uint256 constant AMOUNT = 0.5 ether;

    function run() public {
        Lottery lottery = new Lottery{value: AMOUNT}();
        Attack attack = new Attack(lottery);
        attack.attack{value: AMOUNT}();
        require(address(lottery).balance == 0, "attack failed");
        vm.stopBroadcast();
    }
}