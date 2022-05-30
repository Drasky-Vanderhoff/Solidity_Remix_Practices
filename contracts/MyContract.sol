pragma solidity ^0.5.13;

contract MyContract {
  // string public myString = "Hello World";

  uint public myUint;

  function setMyUint(uint _myUint) public {
    myUint = _myUint;
  }
}