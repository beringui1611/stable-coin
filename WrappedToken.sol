// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract WrappedEther is ERC20 {
    constructor() ERC20("Wrapped Ether", "WETH"){

       
    }

     function deposit() external payable {
            _mint(msg.sender, msg.value);
            
        }

    
    function withDraw(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Balance");
        _burn(msg.sender,amount);
        payable(msg.sender).transfer(amount);
    }
}



//WRAPPED TOKEN FOR ETH TOKENS.