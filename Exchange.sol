// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IStabrl.sol";


contract Exchange {

    address private immutable owner;
    IStabrl private immutable stableCoin;
   constructor(address _stableCoin){
    stableCoin = IStabrl(_stableCoin);
    owner = msg.sender;
   }

   function deposit(address customer, uint amount) external onlyOwner {
    stableCoin.mint(customer, amount);
   }

   function withdraw(address customer, uint amount) external onlyOwner{
    stableCoin.burn(customer, amount);
   }

   modifier onlyOwner(){
    require(msg.sender == owner, "You dont have authorization.");
    _;
   }

}