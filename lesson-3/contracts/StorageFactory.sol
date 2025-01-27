// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";

contract StorageFactory {
  SimpleStorage[] public simpleStorageArr;

  function createSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArr.push(simpleStorage);
  }

  function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    // in short way
    // <-- simpleStorageArr[_simpleStorageIndex].store(_simpleStorageNumber); -->

    SimpleStorage simpleStorage = simpleStorageArr[_simpleStorageIndex];
    simpleStorage.store(_simpleStorageNumber);
  }

  function sfRetrive(uint256 _simpleStorageIndex) public view returns(uint256) {
    SimpleStorage simpleStorage = simpleStorageArr[_simpleStorageIndex];
    return simpleStorage.retrieve();
    // in short way
    // return simpleStorageArr[_simpleStorageIndex].retrieve();
  }


}