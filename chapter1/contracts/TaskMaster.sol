pragma solidity ^0.4.17;

contract TaskMaster {
    mapping(address => uint) public balances; // balances of everyone

    function TaskMaster() public {
        balances[msg.sender] = 10000;
    }
}
