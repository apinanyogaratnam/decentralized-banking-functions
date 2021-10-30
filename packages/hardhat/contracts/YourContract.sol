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

  function publicFunction() external {

  }

  function privateFunction1() external onlyAdmin() {

  }

  function privateFunction2() external onlyAdmin() {

  }

  modifier onlyAdmin() {
    require(msg.sender == admin, "Only admin can call this function");
    _;
  }

  function accountExists(address _to) internal view returns (bool) {
    return balances[_to] > 0;
  }
  
  function createAccount(address _to, uint256 _amount) external {
    if (accountExists(_to)) return;
    balances[_to] = _amount;
  }

  function setPurpose(string memory newPurpose) public {
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }
}
