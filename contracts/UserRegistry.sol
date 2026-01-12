pragma solidity ^0.8.24;
contract UserRegistry {
    struct User {
        string name;
        uint balance;
        bool isActive;
    }
    
    User[] public users;
    mapping(address => uint) public userIdByOwner;
    
    function register(string memory _name) public {
        require(userIdByOwner[msg.sender] == 0, "Already registered");
        uint id = users.push(User(_name, 0, true)) - 1;
        userIdByOwner[msg.sender] = id;
    }
    
    function getUser(uint id) public view returns(User memory) {
        return users[id];
    }
}
