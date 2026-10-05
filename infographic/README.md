# POOL4 infographic — "pepes armed with AI"

One-page infographic explaining how POOL4 works, using the $FWA / ETH pool
(hook `0x087a47248847DB968b5A1C8eF52140FE429CA840`, Ethereum mainnet) as the example.

## Output

| path | format | dimensions |
|---|---|---|
| `artifacts/image.png` | PNG (image/png), 8-bit RGB | 2400 × 3600 px (1200 × 1800 layout rendered at 2×, 2:3 portrait) |

Rebuild with `infographic/render.sh` (headless Google Chrome screenshot of `pool4.html`).

## Content

1. **You swap**: a normal Uniswap v4 trade with a 1% fee. The hook runs only after the trade settles.
2. **The hook checks the stash**: if FWA in the pool goes over the inventory cap, the extra is pulled out without moving the price.
3. **85% burn / 15% rewards**: the 15% splits by default into stakers 4.5%, bonds 6% and AI nodes 4.5%.
4. **ETH buy wall**: ETH recovered from trims becomes a floor bid under the price.
5. **Stake**: vault shares become worth more tokens as rewards drip in.

The mechanics come from https://pool4.imd.fun/docs. The live numbers were read on-chain from the hook
and token with `cast` on 2026-10-05:

- ethInPool 4.484 ETH
- tokensInPool 844,459 FWA
- inventoryCap / capFloor 985,843 FWA
- capDecayTokensPerDay 197,169 FWA
- lpFee 10000 (1%)
- rewardShareBps 1500
- totalFeeEth 0.341 ETH and totalFeeToken 56,715 FWA
- marketOpen = true and rebalanceEnabled = true
- 0x…dEaD holds 5.27M FWA

The USD price (~$0.0144) uses ETH = $2,720.68 from Coinbase spot.

## Limitations / unmet visual requirements

- **No AI image model was used.** The Replicate image tool returned `402 Insufficient credit` for
  every model, including flux-schnell. All artwork is hand-built SVG (vector cartoon Pepe-style
  frogs with tactical helmets, AI visors and blasters), so it's flatter and simpler than a
  generated "pepes armed with AI" illustration.
- The 4.5 / 6 / 4.5 reward split is the protocol's documented default. This pool's
  `rewardsRecipient` (`0x337d…6F78`) may route rewards differently.
- The numbers are a snapshot and will go stale.
