
// pragma solidity ^0.8.9;

// // Uncomment this line to use console.log
// // import "hardhat/console.sol";

// contract Lock {
//     uint public unlockTime;
//     address payable public owner;

//     event Withdrawal(uint amount, uint when);

//     constructor(uint _unlockTime) payable {
//         require(
//             block.timestamp < _unlockTime,
//             "Unlock time should be in the future"
//         );

//         unlockTime = _unlockTime;
//         owner = payable(msg.sender);
//     }

//     function withdraw() public {
//         // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
//         // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

//         require(block.timestamp >= unlockTime, "You can't withdraw yet");
//         require(msg.sender == owner, "You aren't the owner");

//         emit Withdrawal(address(this).balance, block.timestamp);

//         owner.transfer(address(this).balance);
//     }
// }


// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.17;

contract chai

{
    struct Memo {
        string name;
        string message;
        uint timestamp;
        address from;
    }

    Memo[] memos; //we will save all here
    address payable owner; 

    constructor() {
        owner = payable(msg.sender); //whoever deploy this smart contract will automatically becomee a owner & payable to receive

    }

    function buyChai(string memory name, string memory message) public payable {
        require(msg.value>0, "Please pay value more than 0 ether!");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));

    }

    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }

}