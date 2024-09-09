// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        //before startBroadcast() -> Not a "real" transaction
        HelperConfig helperConfig = new HelperConfig();
        //after startBroadcast() -> Real transaction!!!!
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig(); //activeNetworkConfig is struct but it only have one parameter and it is address. That is why this will work correct.
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
