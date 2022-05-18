
// This script can be used to deploy the "Storage" contract using Web3 library.
// Please make sure to compile "./contracts/1_Storage.sol" file before running this script.
// And use Right click -> "Run" from context menu of the file to run the script. Shortcut: Ctrl+Shift+S

import { retrieving } from './web3.ts';

retrieving('Storage', '0xD27E1BdF4A704E62C1C6d8b75133c99b244dECCf').then(contract =>{

    contract.methods.store(500).call((err, result) => {
        console.log(result)
    })
    contract.methods.retrieve().call((err, result) => {
        console.log(result)
    })
})