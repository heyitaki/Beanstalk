# BIP-8: Pod Liquidity Pool

## Proposer:
aki

## Summary:
Make Pods fungible by introducing an ERC-20 token called wPOD. Create BEAN<>wPOD and ETH<>wPOD liquidity pools to create a market offering instant liquidity for buying and selling Pods.

## Problem:
Beanstalk provides an innovative model for an algorithmic stablecoin, whereby new Beans (the stablecoin) enter the supply via a queue of Pods. The success of the protocol depends on Bean holders being willing to “sow” their beans, which means burning them in exchange for new Pods minted at the end of the queue. Currently, the Pod queue exceeds the Bean supply in a ratio of almost 8:1, representing an estimated waiting time of about 9 months between “sowing” and “harvesting.” 

## Proposed Solution:
### Overview
Just as wETH is a wrapper atop ETH to make it ERC-20 compliant, we propose creating a wPOD ERC-20 token which abstracts away the non-fungible nature of Pods when wrapping and unwrapping. As long as we can price Pods properly, each Plot can effectively be represented by some number of fungible tokens that hold the same value.

### Pod pricing function
![P_{wPOD}(n)=\frac{P_{BEAN}}{W^{\frac{S_{wPOD}}{n}}}]()

Read the justification [here](https://accessible-pyjama-948.notion.site/Beanstalk-wPOD-pricing-function-d2cd7944333c44ee8041e68629b2c7f8), since Github markdown does not natively support LaTeX.

### Liquidity pool
With this equivalent ERC-20 representation of Pods, creating wPOD<>ETH and wPOD<>BEAN pools is straightforward. Because we are pricing Pods with respect to Beans, a wPOD<>BEAN pool can help keep 1 wPOD = 1 BEAN.

## Economic Rationale:
Creating a liquid market for Pods is likely to support the health of the protocol by reducing the lock-up costs borne by individual users and making the market dynamics more efficient.

## Effective: 
Immediately upon commitment.

## Award:
X Beans to Beanstalk Farms to cover deployment costs.