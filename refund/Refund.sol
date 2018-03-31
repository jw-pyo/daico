pragma solidity ^0.4.18;

import "../token/daico_ERC20.sol";
import "../ownership/Ownable.sol";
import "../lib/SafeMath.sol";

contract Refund is DAICO_ERC20, Ownable {
    using SafeMath for uint256;

    DAICO_ERC20 public token;
    struct refundingReceipt {
        uint256 refundedWeiAmount,
        uint256 tokenAmount,
        uint256 rate
        // uint256 rate_entireWei,
        // uint256 rate_entireToken,
    };
    /* EVENTS */
    event Refund(address indexed account, uint256 wei_amount, uint256 token_amount);
    /* VIEW FUNCTION */
    function estimateRefundETH(uint256 token_amount, address account) public view returns(uint256) {
    //
    }


    /* FUNCTION */
    function refund(uint256 token_amount, address account) public returns(refundingReceipt) {
        require(token_amount <= token.getBalanceOf(account));

        refundingReceipt receipt = refundingReceipt();
        uint256 _rate = SafeMath.safeDiv(token_amount,token.getTotalSupply());
        uint256 _refundedWeiAmount = SafeMath.safeMul(_rate, token.getBeneficiaryWeiAmount());
        receipt.refundedWeiAmount = _refundedWeiAmount;
        receipt.tokenAmount = token_amount;
        receipt.rate = _rate;
        //TODO: transfer ether from team wallet to contributor

        
        return receipt;

    
    }
}


    

