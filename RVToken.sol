//SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

// Import implementation of the ERC20 interface 
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract RVToken is ERC20 {
    address public admin;
    
    // Naming and symbol
    constructor() ERC20('RV Token','RVT'){
        _mint(msg.sender, 10000 * 10 ** 18);  // 10,000 RVT 
        admin = msg.sender;                   // Assigning admin as contract creator
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'Only admins can mint');
        _mint(to, amount);
    }

    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
}
