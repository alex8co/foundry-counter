// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract DeployCounter is Script {
    function run() public returns (Counter) {
        // It's best practice to load your private key and other secrets
        // from environment variables rather than hardcoding them in the script.
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        // If you want to set a different owner from the deployer, you can use:
        // address owner = vm.envAddress("OWNER_ADDRESS");
        // For this example, the deployer will be the owner.
        address owner = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        Counter counter = new Counter(owner);

        console.log("Counter contract deployed at:", address(counter));
        console.log("Owner (and deployer):", owner);

        vm.stopBroadcast();
        return counter;
    }
}