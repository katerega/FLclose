1. multiswap https://docs.uniswap.org/contracts/v3/guides/swaps/multihop-swaps


run monitor script ie check transactions hisotry, balance to cashout, time to cashout, warnings and errors , balance to refill contract, specific contract attack happening

run these two commands before running monitor script
//npm init -y
//npm install ethers node-cron winston axios

node monitor.js

https://hardhat.org/hardhat-runner/docs/guides/compile-contracts

PS C:\Base> cd contract
PS C:\Base\contract> ls

PS C:\Base\contract> npm install

PS C:\Base\contract> npm init

PS C:\Base\contract>  npm add --save-dev hardhat


PS C:\Base\contract> npx hardhat init  

PS C:\Base\contract> npm cache clean --force

PS C:\Base\contract> npm rebuild

PS C:\Base\contract> npm instal

PS C:\Base\contract>  npm add --save-dev hardhat

PS C:\Base\contract> npx hardhat init

PS C:\Base\contract> hardhat
 
PS C:\Base\contract> npm install --save-dev hardhat

PS C:\Base\contract> npx hardhat init

PS C:\Base\contract> npx hardhat compile // comple smart contract

PS C:\Base\contract> npm add @uniswap/v3-periphery @uniswap/v3-core // add dependancies of uniswap note all targeted xchanges are uniswap forks

PS C:\Base\contract> npx hardhat test --network localhost //fork mainnet to localnode

test contract before deploy
npx hardhat run test --network foundryForkedmainnet

deploy
npx hardhat run scripts/deploy.js --network foundryForkedmainnet

run execution function
npx hardhat run scripts/executionFunc.js --network foundryForkedmainnet


//first install GIT BASH for WINDOWS and run bash
//foundary before forking a block of mainnet into local net
foundryup

LENOVO@DESKTOP-3C79BU1 MINGW64 ~
$ curl -L https://foundry.paradigm.xyz | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   167  100   167    0     0    117      0  0:00:01  0:00:01 --:--:--   117
100  2189  100  2189    0     0    894      0  0:00:02  0:00:02 --:--:--  5352
Installing foundryup...

Detected your preferred shell is bash and added foundryup to PATH.
Run 'source /c/Users/LENOVO/.bashrc' or start a new terminal session to use foundryup.
Then, simply run 'foundryup' to install Foundry.

LENOVO@DESKTOP-3C79BU1 MINGW64 ~
$ source /c/Users/LENOVO/.bashrc  // this changes acording to the name of the machine being used

$ anvil --fork-url https://mainnet.chainnodes.org/8abd853b-e5f4-4f8a-ad84-f4c7f68ab08c --fork-block-number 19973327 --fork-chain-id 1 --chain-id 1


https://mainnet.chainnodes.org/8abd853b-e5f4-4f8a-ad84-f4c7f68ab08c


 0.2.0 (ea2eff9 2024-05-29T00:19:30.263918000Z)
    https://github.com/foundry-rs/foundry

Available Accounts
==================

(0) 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000.000000000000000000 ETH)
(1) 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 (10000.000000000000000000 ETH)
(2) 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC (10000.000000000000000000 ETH)
(3) 0x90F79bf6EB2c4f870365E785982E1f101E93b906 (10000.000000000000000000 ETH)
(4) 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65 (10000.000000000000000000 ETH)
(5) 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc (10000.000000000000000000 ETH)
(6) 0x976EA74026E726554dB657fA54763abd0C3a0aa9 (10000.000000000000000000 ETH)
(7) 0x14dC79964da2C08b23698B3D3cc7Ca32193d9955 (10000.000000000000000000 ETH)
(8) 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f (10000.000000000000000000 ETH)
(9) 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720 (10000.000000000000000000 ETH)

Private Keys
==================

(0) 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
(1) 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
(2) 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a
(3) 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
(4) 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a
(5) 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
(6) 0x92db14e403b83dfe3df233f83dfa3a0d7096f21ca9b0d6d6b8d88b2b4ec1564e
(7) 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356
(8) 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97
(9) 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6

Wallet
==================
Mnemonic:          test test test test test test test test test test test junk
Derivation path:   m/44'/60'/0'/0/


Fork
==================
Endpoint:       https://mainnet.chainnodes.org/8abd853b-e5f4-4f8a-ad84-f4c7f68ab08c
Block number:   19973327
Block hash:     0x5a5fa71c43229b58c268d291af341b1af3a4a99c9385b4e9866c047897572f9c
Chain ID:       1

Base Fee
==================

9413139742

Gas Limit
==================

30000000

Genesis Timestamp
==================

1716977236

Listening on 127.0.0.1:8545




// go back to https://docs.uniswap.org/sdk/v3/guides/local-development

IswapRouter v3 0xE592427A0AEce92De3Edee1F18E0157C05861564

https://docs.uniswap.org/contracts/v3/reference/periphery/interfaces/ISwapRouter
