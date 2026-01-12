pragma solidity ^0.8.24;
contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    
    struct Zombie {
        string name;
        uint dna;
    }
    
    Zombie[] public zombies;
    mapping(uint => address) public zombieToOwner;
    mapping(address => uint) ownerZombieCount;
    
    event NewZombie(uint zombieId, string name, uint dna);
    
    function _createZombie(string memory _name, uint _dna) internal {
        uint id = zombies.push(Zombie(_name, _dna));
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }
    
    function _generateRandomDna(string memory _str) private pure returns (uint) {
        return uint(keccak256(abi.encodePacked(_str))) % dnaModulus;
    }
    
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
