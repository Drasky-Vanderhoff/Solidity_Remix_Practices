pragma solidity ^0.5.13;

contract Variables {
  uint256 public myUINT;

  function setMyUint(uint _myUint) public {
    myUINT = _myUint;
  }

  bool public myBool;

  function setMybool(bool _myBool) public {
    myBool = _myBool;
  }

  uint8 public myUint8;

  function incrementUint8() public {
    myUint8++;
  }

  function decrementUint8() public {
    myUint8--;
  }

  address public myAddress;

  function setAddress(address _address) public {
    myAddress = _address;
  }

  function getBalanceOfAddress() public view returns (uint) {
    return myAddress.balance;
  }

  string public myString;

  function setMyString(string memory _myString) public {
    myString = _myString;
  }
}