pragma solidity ^0.5.13;

contract SendMoneyExample {

  uint public balanceReceived;
  function recieveMoney() public payable {
    balanceReceived+= msg.value;
  }

  function getBalance() public view returns(uint) {
    return address(this).balance;
  }

  function withdrawBalance() public {
    address payable to = msg.sender;
    to.transfer(this.getBalance());
  }

  function withdrawMoneyTo(address payable _to) public  {
    _to.transfer(this.getBalance());
  }
}