pragma solidity ^0.6.0;

contract SimpleMapping {
  // Any basic value.
  mapping(uint => bool) public myMapping;
  mapping (address=>bool) public myAddressMapping;
  function setValue(uint _index, bool _value) public {
    myMapping[_index] = _value;
  }

  function setMyAddressToTrue() public {
    myAddressMapping[msg.sender] = true;
  }
}