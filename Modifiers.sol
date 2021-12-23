pragma solidity >= 0.4.24;

contract Modifiers {
    uint public minimumBidAmount;

    constructor(uint _minimumBidAmount) public {
        minimumBidAmount = _minimumBidAmount;
    }

    modifier isAValidBid {
        if(msg.value >= minimumBidAmount) {
            _;
        } else {
            revert();
        }
    }

    function bid() public payable isAValidBid {
        minimumBidAmount = msg.value;
    }
}