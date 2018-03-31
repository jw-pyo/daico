/*
 * VotingFactory.sol is used for creating new voting instance.
 */

pragma solidity ^0.4.18;

import "./Voting.sol";

contract VotingFactory {

    function VotingFactory(){}
    function newVoting(string _votingName) public returns(address) {
        Voting v = (new Voting(_votingName));
        return address(v);
    }
}
