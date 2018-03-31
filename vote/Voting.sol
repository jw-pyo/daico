pragma solidity ^0.4.18;

import "../ownership/Ownable.sol";
import "../token/DAICO_ERC20.sol";
import "../token/Fund.sol";
import "../lib/SafeMath.sol";

contract Voting is Ownable, DAICO_ERC20 {
    using SafeMath for uint256;

    string votingName;
    bool public isInitialized = false;
    bool public isFinalized = false;
    uint256 public startTime;
    uint256 public endTime;

    function Voting(string _votingName) {
        votingName = _votingName;
    }
    /*VIEW FUNCTION*/
    function isActivated() public view returns(bool) {
        return (isInitialized && !isFinalized);
    }
    function getInfo() public view returns(struct);

    /*FUNCTION*/
    function initiative() public returns(bool);
    function vote() public returns(bool agree); //can vote only once
    function revoke() public returns(bool); // It should be penaltied
    function finalize() public returns(bool);
    function _clearVariables() public returns(bool); // clean vars after finalizing prev voting.
}

contract TapVoting is Voting {
//
}

contract BufferVoting is Voting {
//
}



