pragma solidity ^0.8.11;

contract MyContract{
    mapping (address=>uint256) public balances;
    address payable wallet;

    constructor(address payable _wallet) public {
        wallet=_wallet;
    }

    function BuyToken() public payable{
        require(msg.value==1000000000000000000 wei);
        balances[msg.sender]++;
        wallet.transfer(msg.value);
    }


}