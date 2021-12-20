/**
 * SPDX-License-Identifier: MIT
**/

pragma solidity ^0.7.6;
pragma experimental ABIEncoderV2;

import "../../../interfaces/IHusk.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "../../../libraries/LibAppStorage.sol";

/**
 * @author aki
 * @title Thresher
**/
contract Thresher {

    using SafeMath for uint256;
    using SafeMath for uint32;

    AppStorage internal s;
    uint32 private constant MAX_UINT32 = 2**32-1;

    event WrapPod(address indexed account);
    event UnwrapPod(address indexed account);

    function husk() internal view returns (IHusk) {
        return IHusk(s.c.husk);
    }
}
