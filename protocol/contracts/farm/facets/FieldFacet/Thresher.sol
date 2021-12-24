/**
 * SPDX-License-Identifier: MIT
**/

pragma solidity ^0.7.6;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "../../../interfaces/IBean.sol";
import "../../../interfaces/IHusk.sol";
import "../../../libraries/LibAppStorage.sol";
import "../../../libraries/UniswapV2OracleLibrary.sol";
import "./PodTransfer.sol";

/**
 * @author aki
 * @title Thresher
**/
contract Thresher is PodTransfer {

    using SafeMath for uint256;

    function getPlotPrice(uint256 id, uint256 start, uint256 end) public view returns(uint256) {
        uint256 base = 1 / (uint256(s.w.yield) / 100 + 1) ** (1 / (s.f.pods - s.f.harvestable));
        uint256 amount = 0;
        for (uint256 i = id + start; i < id + end; i++) {
            amount += base ** i;
        }

        return amount;
    }

    function getPodPrice(uint256 index) public view returns(uint256) {
        return 1 / ((uint256(s.w.yield) / 100 + 1) ** ((index - s.f.harvestable) / (s.f.pods - s.f.harvestable)));
    }

    function husk() internal view returns (IHusk) {
        return IHusk(s.c.husk);
    } 
}
