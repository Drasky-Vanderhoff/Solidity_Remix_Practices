// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Payable {
  uint price;
  address payable recipient;
  event Recieved(address, uint);

  recieve() external payable {
    emit Recieved(msg.sender, msg.value);
  } 
  
}