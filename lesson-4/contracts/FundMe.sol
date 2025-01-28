// get fund from users
// withdraw funds
// set a minimum sending value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe {
    function fund() public payable {
        require(msg.value > 1e18, "Please enter a value greater than 1 USD");
    }
    // function withdraw() public {}
}