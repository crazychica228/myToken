pragma solidity ^0.8.0;

contract Token {
    // total supply of tokens
    uint256 public totalSupply;

    // mapping from address to balance of tokens
    mapping(address => uint256) public balanceOf;

    // event for token transfer
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 initialSupply) public {
        totalSupply = initialSupply;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public {
        require(balanceOf[msg.sender] >= value && value > 0);
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
    }
}
