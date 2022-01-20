pragma solidity ^0.8.11;

contract MyContract{
    address entered_wallet;
    address owner_wallet=msg.sender;

    constructor (address _wallet)  {
        entered_wallet=_wallet;
    }
    function Owner_Balance(
    ) public view returns(uint256){
        return owner_wallet.balance;
    }
    function Entered_Balance(    
    ) public view returns(uint256){
        return entered_wallet.balance;
    }
}