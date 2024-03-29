// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract CollateralBackedToken is ERC20{

    IERC20 public collateral;

constructor(address _collateral) ERC20("Collateral", "CTL"){
    collateral = IERC20(_collateral);
}


function deposit(uint amount) external {
    collateral.transferFrom(msg.sender, address(this),amount);
    _mint(msg.sender, amount);
}

function withDraw(uint amount) external {
    require(balanceOf(msg.sender) >= amount, "Insufficient Balance.");
    _burn(msg.sender, amount);
    collateral.transfer(msg.sender,amount);
}
}