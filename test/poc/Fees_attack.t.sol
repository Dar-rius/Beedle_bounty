pragma solidity ^0.8.19;

import {Fees} from "../../src/Fees.sol";
import "forge-std/Test.sol";

contract FeesAttack is Test{
    Fees fees;
    address attacker = address(1);

    function setup() public {
    // Une instance du contrat Beedle
    //  fees = new Fees() ; 
    // Transfert 10^18 a l'adresse attacker
    //  beedle.transfer(attacker, 10**18);
    }
}
