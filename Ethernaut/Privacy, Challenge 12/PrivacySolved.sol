// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {

    // Each slot has capcity of 32 bytes, its importatnt to arrange the slots to maximize the use of each slot. 
    // two letters of an output string represents 1 bytes

    // slot 0
    bool public locked = true;
    //slot 1
    uint256 public ID = block.timestamp;
    //slot 2
    uint8 private flattening = 10;
    //slot 2
    uint8 private denomination = 255;
    //slot 2
    uint16 private awkwardness = uint16(block.timestamp);
    //fixed array, each individual data will be 32 bytes. It will occupy 3 slots - 3, 4, 5!!
    bytes32[3] private data;

    //data array is private, however, it could eailt be recovered with teh following:
    //addr = contract.address
    //slot = web3.eth.getStorageAt(addr, 5) - //Slot 5
    // slot.slice(0,34) - to convert 32 bytes into 16 bytes
    //slot 5 data - "0xd9ce68dcb66381a6a6d427afb01d121b"

    constructor(bytes32[3] memory _data) {
        data = _data;
    }
    
    function unlock(bytes16 _key) public {
        require(_key == bytes16(data[2]));
        locked = false;
    }


    //challenge complete
}