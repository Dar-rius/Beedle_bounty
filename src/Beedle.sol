// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Ownable} from "./utils/Ownable.sol";
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract Beedle is Ownable, ERC20, ERC20Permit, ERC20Votes {

    constructor() ERC20("Beedle", "BDL") ERC20Permit("Beedle") Ownable(msg.sender) {
        _mint(msg.sender, 1_000_000_000 * 1e18);
    }

    /*
       Probleme: la fonction _afterTokenTransfer ne se retrouve pas dans les contrats (ERC20, ERC20Votes)
       Consequence: la fonctione ne fonctionnera pas
    */
    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    /*
        Probleme: le contrat ERC20Votes ne dispose pas de sous fonction _mint
    */
    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    /*
        Probleme: le contrat ERC20Votes ne dispose pas de sous fonction _burn
    */
    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
    
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

}
