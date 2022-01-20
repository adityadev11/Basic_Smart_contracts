pragma solidity ^0.8.11;

contract MyContract{
    enum State {Voted, Not_Voted}
    State public state;

     constructor() {
        state=State.Not_Voted;
    }
    function vote() public {
        state=State.Voted;
    }

    function hasVoted() public view returns(bool) {
        return state==State.Voted;
    }

   
}