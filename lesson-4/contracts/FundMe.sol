// get fund from users
// withdraw funds
// set a minimum sending value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUSD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public adressToFundedAmount;

    function fund() public payable {
        require((msg.value.getConversionRate())  > 1e18, "Please enter a value greater than 1 USD");
        funders.push(msg.sender);
        adressToFundedAmount[msg.sender] = msg.value;
    }


}