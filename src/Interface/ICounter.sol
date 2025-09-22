// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICounter {
    function number() external view returns (uint256);
    function name() external view returns (string memory);
    function increment() external;
    function set_number(uint256) external;
    function set_name(string calldata) external;
    function get_name() external view returns (string memory);
    function push_value(uint256) external;
    function clear_values() external;
    function get_values() external view returns (uint256[] memory);
}