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

    address public owner;

    constructor () {
       owner = msg.sender;
    }

    function fund() public payable {
        require((msg.value.getConversionRate())  > 1e18, "Please enter a value greater than 1 USD");
        funders.push(msg.sender);
        adressToFundedAmount[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            adressToFundedAmount[funder] = 0;
        }

        // reset the array!!
        funders = new address[](0);

        // we have three ways to send ether in solidty
        // // 1. transfer()
        // payable (msg.sender).transfer(address(this).balance);
        // // 2. send()
        // bool sendSucess = payable (msg.sender).send(address(this).balance) ;
        // require(sendSucess, "Transfer failed");
        // 3. call()
        (bool callSuccess,) =  payable (msg.sender).call{value: address(this).balance}("") ;
        require(callSuccess, "call failed");
        
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can withdraw funds");_;
    }


}