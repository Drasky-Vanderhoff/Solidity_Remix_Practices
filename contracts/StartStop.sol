pragma solidity ^0.5.13;
import "./Owned.sol";

contract StartStop is Owned {

  bool paused;

  function setPaused(bool _paused) public onlyOwner {
    paused = _paused;
  }

  function sendMoney() public payable {
  }

  function withdrawAllMoney (address payable _to) public onlyOwner {
    require(!paused, "Contract is Paused!");
    _to.transfer(address(this).balance);
  }

  function destroySmartContract(address payable _to) public onlyOwner {
    selfdestruct(_to);
  }
}