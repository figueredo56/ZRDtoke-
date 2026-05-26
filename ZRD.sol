
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @dev Standard ERC20 contract optimized for Remix and PancakeSwap V2.
  * It implements the essential functions required to interact with DEXs without complex logic
   * that could potentially block transfers or token listing.
    */
    contract ZRDToken {
        string public name = "ZRD";
            string public symbol = "ZRD";
                uint8 public constant decimals = 18;
                    
                        // Exactly 100 tokens (multiplied by 10^18 to handle decimal precision correctly)
                            uint256 public constant totalSupply = 100 * 10**uint256(decimals);

                                mapping(address => uint256) public balanceOf;
                                    mapping(address => mapping(address => uint256)) public allowance;

                                        event Transfer(address indexed from, address indexed to, uint256 value);
                                            event Approval(address indexed owner, address indexed spender, uint256 value);

                                                constructor() {
                                                        // Assigns the entire initial supply to the wallet deploying the contract
                                                                balanceOf[msg.sender] = totalSupply;
                                                                        emit Transfer(address(0), msg.sender, totalSupply);
                                                                            }

                                                                                function transfer(address to, uint256 value) public returns (bool success) {
                                                                                        require(balanceOf[msg.sender] >= value, "Insufficient balance");
                                                                                                balanceOf[msg.sender] -= value;
                                                                                                        balanceOf[to] += value;
                                                                                                                emit Transfer(msg.sender, to, value);
                                                                                                                        return true;
                                                                                                                            }

                                                                                                                                function approve(address spender, uint256 value) public returns (bool success) {
                                                                                                                                        allowance[msg.sender][spender] = value;
                                                                                                                                                emit Approval(msg.sender, spender, value);
                                                                                                                                                        return true;
                                                                                                                                                            }

                                                                                                                                                                function transferFrom(address from, address to, uint256 value) public returns (bool success) {
                                                                                                                                                                        require(balanceOf[from] >= value, "Insufficient balance");
                                                                                                                                                                                require(allowance[from][msg.sender] >= value, "Insufficient allowance");
                                                                                                                                                                                        
                                                                                                                                                                                                balanceOf[from] -= value;
                                                                                                                                                                                                        balanceOf[to] += value;
                                                                                                                                                                                                                allowance[from][msg.sender] -= value;
                                                                                                                                                                                                                        
                                                                                                                                                                                                                                emit Transfer(from, to, value);
                                                                                                                                                                                                                                        return true;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            }
