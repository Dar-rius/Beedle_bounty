pragma solidity ^0.8.19;

import {Lender} from "../../src/Lender.sol";
import "forge-std/Test.sol";
import {console} from "forge-std/console";

contract OwnableAttacker is Test{
    Lender lender;

    function setUp() public {
    // Une instance du contrat Ownable
      lender = new Lender() ; 
    }

    /// @notice change la valeur de la variable owner
    function testchangeOwnerAddress() public {
        address cible = address(lender);
        //modify variable owner
        (bool success) =  cible.delegatecall(
           abi.encodeWithSignature("transferOwnerShip(address)", address(2))
        );
        console.log(success);
       // cible.owner = address(2);
        //connect to address 2 
        //vm.startPrank(address(2));
        // transferOwnerShip
        //lender.transferOwnership(address(3));
    }

    /// @notice remplacer le modifier pour changer la valeur
    
}
