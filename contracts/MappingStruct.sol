pragma solidity ^0.5.13;

contract MappingStruct {
  struct Payment {
    uint amount;
    uint timestamps;
  }

  struct Balance {
    uint totalBalance;
    uint numPayments;
    mapping(uint => Payment) payments;
  }

  mapping(address => Balance) public balanceReceived;
  
  function getBalance() public view returns(uint) {
    return address(this).balance;
  }
  function sendMoney() public payable {
    balanceReceived[msg.sender].totalBalance += msg.value;
    Payment memory payment = Payment(msg.value, now);

    balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
    balanceReceived[msg.sender].numPayments++;
  }
  function withdrawAllMoney(address payable _to) public {
    uint balanceToSend = balanceReceived[msg.sender].totalBalance;
    balanceReceived[msg.sender].totalBalance = 0;
    _to.transfer(balanceToSend);
  }

  function withdrawMoney(address payable _to, uint _amount) public {
    require(_amount <= balanceReceived[msg.sender].totalBalance);
    balanceReceived[msg.sender].totalBalance -= _amount;
    _to.transfer(_amount);
  }
}