pragma solidity ^0.4.17 <0.7.0;

contract TaskMaster {
    // balances of everyone
    mapping(address => uint) public balances;

    // owner of the contract
    address public owner;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = 10000;
    }

    function reward(
        address doer,
        uint rewardAmount
    ) public returns (bool sufficientFunds) {
        balances[msg.sender] -= rewardAmount;
        balances[doer] += rewardAmount;
        return sufficientFunds;
    }

    function getBalance(address addr) public view returns (uint) {
        return balances[addr];
    }

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier hasSufficientFunds(uint rewardAmount) {
        require(balances[msg.sender] >= rewardAmount);
        _;
    }
}
