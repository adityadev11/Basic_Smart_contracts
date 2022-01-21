// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract MyContract{
    address payable[] participant_accounts ;
    uint256 participant_count;
    uint256 closing_time= 1642785457;
    address winner_address;

    modifier OnlyWhileOpen(){
        require(block.timestamp<closing_time,"Lottery Closed! Cannot buy ticket");
        _;
    }

    modifier OnlyWhenClosed(){
        require(block.timestamp>=closing_time,"Lottery still Open. Winner can be seen after closing");
        _;
    }

    modifier PaymentisValid(){
    require(msg.value==1 ether,"Lottery Ticket Costs 1 Ether Exactly!");
    _;
}


    function BuyLotteryTicket() public payable PaymentisValid OnlyWhileOpen{         //Buy Lottery Ticket for 1 ether. No more, no less.
        participant_accounts.push(payable(msg.sender));
        participant_count++;
    }

    function NoOfParticipants() public view returns(uint256){
        return (participant_count);
    }

    function random() private view returns(uint){

        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp))) % participant_count;
    }

    function Winner() public payable OnlyWhenClosed {
        uint256 index=random();
        participant_accounts[index].transfer( address(this).balance );
        winner_address=participant_accounts[index];
    }
    function GetWinner() public view returns(address){
        return winner_address;
    }
}