# run  local
```
export PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"
export Contract_Address="0xC2FE2F49B3a1384aEdFAae127F054FAf216eF684"
cast balance 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --ether --rpc-url http://127.0.0.1:8545
```

# deploy
```
  You need to provide your Sepolia RPC URL and a private key to Foundry. The best way is to use a .env file.

   1. Create a `.env` file in your project root:
   1     touch .env
   2. Add your secrets to the .env file. It should look like this:

   1     SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/YOUR_INFURA_API_KEY
   2     PRIVATE_KEY=0xYOUR_PRIVATE_KEY
   3     ETHERSCAN_API_KEY=YOUR_ETHERSCAN_API_KEY

       * `SEPOLIA_RPC_URL`: Get this from a node provider like Infura (https://infura.io) or Alchemy (https://alchemy.com).
       * `PRIVATE_KEY`: This is the private key of the account you want to deploy from. Be very careful with your private key. Do
         not commit it to Git.
       * `ETHERSCAN_API_KEY`: Get this from Etherscan (https://etherscan.io/myapikey) to enable contract verification.

```

## deploy to sepolia
```
source .env && forge script script/Counter.s.sol:DeployCounter --rpc-url sepolia --broadcast --verify
```

```
✦ Deployment successful!

  Your Counter contract is now live on the Sepolia testnet.

  Here is the key information from the output:

   * Contract Address: 0xF11509141756d994E14Df4c8030dDD203C80a4a7
   * Owner's Address: 0x7d0E2B1aB91D709743AF39990534C6d4fD8E1618

  You can view your verified contract on Etherscan here:
  https://sepolia.etherscan.io/address/0xf11509141756d994e14df4c8030ddd203c80a4a7 
  (https://sepolia.etherscan.io/address/0xf11509141756d994e14df4c8030ddd203c80a4a7)

  The deployment and verification process completed successfully. You can now interact with your contract on the Sepolia
  network.

```

```
   * Contract Name: Counter
   * Network: Sepolia Testnet
   * Contract Address: 0xF11509141756d994E14Df4c8030dDD203C80a4a7
   * Etherscan Link: https://sepolia.etherscan.io/address/0xF11509141756d994E14Df4c8030dDD203C80a4a7
   * ABI (Application Binary Interface): For developers who want to interact with your contract from a script or a web
     application, they will need the ABI. You can get this from the Etherscan page (at the bottom of the Contract tab) or from
     your local project files in out/Counter.sol/Counter.json.

```


```
export PRIVATE_KEY="0x_replace_your_private_key"
export Contract_Address="0xF11509141756d994E14Df4c8030dDD203C80a4a7"

cast call $Contract_Address "number()" --rpc-url sepolia  
cast send $Contract_Address "increment()" --private-key $PRIVATE_KEY   --rpc-url sepolia
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
