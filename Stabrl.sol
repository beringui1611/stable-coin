// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "contracts/IStabrl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Stabrl is ERC20{

    address private immutable owner;
    address public  exchange;

    constructor() ERC20("Stabrl", "SRBL"){
        owner = msg.sender;
    }

    function setExchange(address _exchange) external {
        require(owner == msg.sender, "Only the owner can make this call ");
        exchange = _exchange;
    }

    function mint(address customer, uint amount) external onlyExchange {
        _mint(customer, amount);
    }

    function burn(address customer, uint amount) external onlyExchange {
        _burn(customer, amount);
    }

    modifier onlyExchange(){
        require(msg.sender == exchange, "Only the exchnage this call ");
        _;
    }
}