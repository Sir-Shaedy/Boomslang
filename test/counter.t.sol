// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "src/Interface/ICounter.sol"; 

contract CounterTest is Test {
    ICounter public counter;

    function setUp() public {
        // Deploy the Vyper contract compiled by Foundry
        counter = ICounter(deployCode("Counter.vy"));
    }

    function test_SetNumber() public {
        counter.set_number(20);
        assertEq(counter.number(), 20);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_SetNameAndGetViaGetter() public {
        string memory expected = "VyperWizard";

        counter.set_name(expected);

        // Read via auto-generated getter
        string memory retrieved = counter.name();
        assertEq(retrieved, expected);
    }

    function test_GetNameFunction() public {
        string memory expected = "FoundryMaster";
        counter.set_name(expected);

        // Read via explicit function
        string memory retrieved = counter.get_name();
        assertEq(retrieved, expected);
    }

    function test_DynamicArray_RoundTrip() public {
        uint256[] memory expected = new uint256[](3);
        expected[0] = 7;
        expected[1] = 14;
        expected[2] = 21;

        counter.clear_values();
        counter.push_value(7);
        counter.push_value(14);
        counter.push_value(21);

        uint256[] memory actual = counter.get_values();
        assertEq(actual.length, 3);
        assertEq(actual[0], expected[0]);
        assertEq(actual[1], expected[1]);
        assertEq(actual[2], expected[2]);
    }

}