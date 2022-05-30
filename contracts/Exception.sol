pragma solidity 0.5.13;
import "./Owned.sol"

contract Exception is Owned {
  mapping (address=>uint64) public balanceReceived;

  function destroySC() public onlyOwner {
    selfdestruct(owner);
  }

  function recievedMoney() public payable {
    assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
    balanceReceived[msg.sender] += uint64(msg.value);
  }

  function withdrawMoney(address payable _to, uint64 _amount) public {
    require(_amount <= balanceReceived[msg.sender], "You don't have enough Ether");
    assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] + _amount);
    balanceReceived[msg.sender] -= _amount;
    _to.transfer(_amount);
  }

  function getOwner() public view returns(address) {
    return owner;
  }

  function convertWeiToEth(uint _wei) public pure returns (uint) {
    return _wei / 1000;
  }

  function () external payable {
    recievedMoney();
  }
}