// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    function getPrice() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        //eth in terms of usd
        //3000.00000000
        return uint256(price * 1e10); // 1**10 == 100000000000
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        uint ethPrice = getPrice();
        uint ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}

// 0xd0ff1ba3f84fa4fc54fe60ac76ee330aabc99a53