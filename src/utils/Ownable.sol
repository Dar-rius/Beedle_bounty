// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

abstract contract Ownable {

    event OwnershipTransferred(address indexed user, address indexed newOwner);

    // Probleme: La variable owner ne devrait pas etre public en risque de manipulation
    address public owner;

    // Probleme: risque  d'etre remplacer par un contrat malveillant
    modifier onlyOwner() virtual {
        require(msg.sender == owner, "UNAUTHORIZED");
        _;
    }
    constructor(address _owner) {
        owner = _owner;
        emit OwnershipTransferred(address(0), _owner);
    }

    function transferOwnership(address _owner) public virtual onlyOwner {
        owner = _owner;
        emit OwnershipTransferred(msg.sender, _owner);
    }
}
