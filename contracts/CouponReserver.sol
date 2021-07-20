// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CouponReserver is Ownable {
  IERC20 public coupon;
  
  constructor(IERC20 _coupon) {
    coupon = _coupon;
  }

  function transfer(address to, uint256 amount) external onlyOwner returns(bool) {
    return coupon.transfer(to, amount);
  }
}