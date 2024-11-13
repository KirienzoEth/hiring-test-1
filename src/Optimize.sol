// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

struct FooBar {
    uint128 a;
    uint256 b;
    uint128 c;
    uint256 d;
    uint128 e;
    address f;
}

contract Optimize {
    FooBar private var2;

    uint256 public var1;

    constructor() {
        var1 = 42;
    }

    function try1() external {
        FooBar memory var2Mem = var2;
        var2Mem.a = 1;
        var2 = var2Mem;
    }

    function try2() public {
        var1 = var2.a;
    }
}
