// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Lottery {
    uint256 private winAmount = 0;
    uint256 private nextPlayingwindow = 0;

    constructor() payable {
        require(msg.value == 0.5 ether, "The contract needs to be funed by 0.5 ether initially");
    }

    function play(uint256 guess) external payable returns (bool) {
        require(msg.value == 0.5 ether, "To participate, you need to pay 0.5 ether");
        require(block.number > nextPlayingwindow);

        // taking as much parameters possible to get a good randomness
        uint256 rand = uint256(
            keccak256(
                abi.encode(
                    block.coinbase,
                    block.difficulty,
                    block.gaslimit,
                    block.number,
                    blockhash(block.number - 1),
                    block.timestamp,
                    tx.gasprice,
                    winAmount,
                    nextPlayingwindow,
                    address(this).balance
                )
            )
        );

        if (rand == guess) {
            (bool success,) = msg.sender.call{value: 0.6 ether}("");
            require(success, "Error while sending reward");

            winAmount++;
            nextPlayingwindow = block.number + 25 ** winAmount;

            return true;
        }

        return false;
    }

    function hackCompleted() external view returns (bool) {
        return address(this).balance < 0.1 ether;
    }
}
