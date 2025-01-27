// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // when we want overide the function we use 2 key words
    // 1.  Overide  ----- it use for on the overide function
    // 2.  Vertual  ------ it use for on the overidden function
      function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}