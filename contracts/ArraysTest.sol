pragma solidity ^0.8.24;
contract ArraysTest {
    uint[] public nums;
    mapping(uint => bool) public numberExists;
    
    function addNumber(uint num) public {
        nums.push(num);
        numberExists[num] = true;
    }
}
