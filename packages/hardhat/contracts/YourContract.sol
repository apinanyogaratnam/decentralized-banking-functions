pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  //event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps!!!";
  address public admin;
  mapping(address => uint256) public balances;

  constructor() {
    // what should we do on deploy?
    admin = msg.sender;
  }

  modifier onlyAdmin() {
    require(msg.sender == admin, "Only admin can call this function");
    _;
  }

  function transfer(address _to, uint256 _value) onlyAdmin public {
    require(_to != address(0), "Invalid address");
    require(_value > 0, "Invalid value");
    require(balances[msg.sender] >= _value, "Not enough balance");
    balances[msg.sender] -= _value;
    balances[_to] += _value;
  }

  function depositFunds(address _to, uint256 _amount) external {
    require(_to != address(0), "Invalid address");
    require(_amount > 0, "Invalid amount");
    balances[_to] += _amount;
  }

  function withdrawFunds(address _from, uint256 _amount) external {
    require(_from != address(0), "Invalid address");
    require(_amount > 0, "Invalid amount");
    require(balances[_from] >= _amount, "Not enough balance");
    balances[_from] -= _amount;
  }

  function borrowFunds(){}

  function setPurpose(string memory newPurpose) public {
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }
}
