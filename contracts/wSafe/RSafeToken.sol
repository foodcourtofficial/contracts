// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IFoodcourtRewardToken.sol";

// EOBToken with Governance.
// TOEDIT: Name and Symbol
contract RSafeToken is ERC20('wSafeMoon Reward Token', 'rSAFEMOON'), Ownable, IFoodcourtRewardToken {
    function isFoodcourtRewardToken() override external pure returns(bool) {
        return true;
    }

    function getRealTotalSupply() external view returns (uint256) {
        return totalSupply() - balanceOf(0x000000000000000000000000000000000000dEaD);
    }
    
    /// @notice Creates `_amount` token to `_to`. Must only be called by the app that is allowed minting Ex: MasterChef.
    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    // TOEDIT: Set decimal place here
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }
}
