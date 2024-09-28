// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MemeToken is ERC20, Ownable {
    uint256 public immutable maxSupply;

    constructor() ERC20("MemeToken", "MEME") {
        // Set an initial max supply (e.g., 100 million MEME tokens)
        maxSupply = 100000000 * 10 ** decimals(); // 100 million tokens
        _mint(msg.sender, maxSupply); // Mint all tokens to the contract deployer initially
    }

    // Function to mint new tokens (only the owner can mint)
    function mint(address to, uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= maxSupply, "Exceeds maximum token supply");
        _mint(to, amount);
    }

    // Optional: Function for burning tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
