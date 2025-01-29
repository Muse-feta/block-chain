// get fund from users
// withdraw funds
// set a minimum sending value in usd

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 50 * 1e18;

    function fund() public payable {
        require(getConversionRate(msg.value)  > 1e18, "Please enter a value greater than 1 USD");
    }

    function getPrice() public view returns(uint256){
        // WE want this two things
        //   ABI   --
        //   Adress --  0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
         (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return uint(answer * 1e18);
        }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return  ethAmountInUSD;
    }

    // function getVersion() public view returns(uint256){
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    //     return priceFeed.version();
    // }
    // function withdraw() public {}
}