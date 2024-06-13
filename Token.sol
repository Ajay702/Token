// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract NEW_TOKEN {

    // public variables here

    // Token name
    string public tokenName = "MyToken";
    
    // Token abbreviation
    string public tokenAbbrv = "MT";
    
    // Total supply of the token
    uint public totalSupply = 0;
    
    // Mapping to store balances of addresses
    mapping(address => uint) public balances;

    // Function to mint (create) new tokens
    // Address - the address to which tokens will be added
    // Value -  the number of tokens to add
    function mint(address Address, uint Value) public {
        balances[Address] += Value; // Increase the balance of the specified address
        totalSupply += Value;       // Increase the total supply by the minted amount
    }

    // Function to burn (destroy) tokens
    // Address -  the address from which tokens will be deducted
    // Value -  the number of tokens to burn
    function burn(address Address, uint Value) public {
        // Checking if the balance of the specified address has enough tokens to burn
        if (balances[Address] >= Value) {
            totalSupply -= Value;   // Decrease the total supply by amount burned
            balances[Address] -= Value; // Decrease the balance of the specified address
        } else {
            // Revert the transaction with an error message if the balance is insufficient
            // it is somewhat like console.log 
            revert("Insufficient balance");
        }
    }
}
