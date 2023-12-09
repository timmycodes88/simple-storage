// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 storedData;

    mapping(address => string) public users;

    address[] public userAddresses;

    function isUser() internal view returns (bool) {
        bool isUserBool = false;
        for (uint256 i = 0; i < userAddresses.length; i++) {
            if (userAddresses[i] == msg.sender) {
                isUserBool = true;
            }
        }
        return isUserBool;
    }

    function store(uint256 x) public {
        if (!isUser()) {
            revert();
        }
        storedData = x;
    }

    function createUser(string memory _name) public {
        if (isUser()) {
            revert();
        }
        address _address = msg.sender;
        users[_address] = _name;
        userAddresses.push(_address);
    }

    function retrieve() public view returns (uint256) {
        return storedData;
    }
}
