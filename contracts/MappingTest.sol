pragma solidity ^0.8.24;
contract MappingTest {
    mapping(address => string) public names;
    
    function setName(string memory _name) public {
        names[msg.sender] = _name;
    }
}
