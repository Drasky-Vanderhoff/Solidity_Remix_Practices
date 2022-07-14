// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Ownable {
  address payable public owner;

  constructor () {
    owner = payable(msg.sender);
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "You are not the owner!");
    _;
  }
}