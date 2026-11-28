# Unrestricted degree-five scalar caps through amplitude 0.4173

For the Gaussian game with multiplier \(P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}\), let \(V\) be the real scalar payoff of two unimodular functions, \(t\) the norm of the linear projection of their midpoint, and \(\chi\) the normalized fourth excess of the cubic projection of their half-difference when this projection is nonzero. In every positive finite dimension, with all six cubic sectors and all shared remote coordinates allowed, \(V<1/K-10^{-5}\) on the following closed intervals. The zero cubic is included by the small-energy estimate.

| Target \(K\) | Previous endpoint | New endpoint | Closed cells in the extension |
|---:|---:|---:|---:|
| 1.4023 | .40869 | .4173 | 224, 153, 130, 41, 123 and 129 |
| 1.4025 | .40825 | .4166 | 209 to .4155, then 254 |
| 1.403 | .40705 | .4154 | 154 to .414, then 296 |

The earlier estimates cover zero through each previous endpoint. The [predecessor](../quintic-sector-moments-codex-a7c4/SPIKED.md) describes the six sector energies, the fourth-excess interval \([0,42]\), and the payoff comparison used to exclude a violating physical pair.

The extension uses the same two support directions. Four rational Stein potentials cover \(\chi\in[4.2,5.4],[5.4,6.6],[6.6,8.1],[12,18]\). The new tail interval contains the former failure. The [angular fourth-moment estimate](PRODUCT.md) groups the products of visible derivative terms by frequency. The [seven radial profiles](RADIAL_CHARGE.md) charge the same physical sector energies in the payoff. The piece from .416 to .4165 uses the [symmetric quartic estimate](SYMMETRIC.md) at the same support rows and prices. A fifth potential covering \(\chi\in[5.05,5.75]\) overlaps both sides of the old boundary at 5.4. This gives the pieces ending at .417, .4171 and .4172. A sixth, wider potential on \(\chi\in[4.8,6.2]\) covers the old upper edge at 5.75 and extends the strip through .4173.

The verifier checks each new potential by the source Sturm and endpoint tests, encloses the radial integrals and Schur prices, and reuses the predecessor's subdivision of the full amplitude and shape rectangle. Each underlying comparison fixes one admissible mass witness over its energy interval. Slabs outside a new potential's range retain the predecessor's bounds. The extra contradiction clearances in trillionths exceed 93,490, 6,809,117, 1,953,433, 12,785,514, 667,089 and 521,290 on the six first-target pieces, 148,925 and 596,664 at 1.4025, and 833,075 and 1,116,260 at 1.403. These figures measure the contradiction test after spending the uniform payoff reserve.

## What changed at the boundary

At \(t=.408694,\sqrt\chi=3.464102\), the preceding majorant exceeds its target by more than .000464. The new comparison clears it by more than .00252. At \(t=.4163,\sqrt\chi=2.323791\), fixing all other data and switching to the symmetric product bound changes a failure of more than .00154 into a clearance above .00013. At \(t=.4167\) and the same shape the symmetric comparison still fails by more than .00159. This last control concerns the chosen majorant. The overlapping fifth row clears the old failure at \(t=.417,\sqrt\chi=2.323791\) by more than .0007354. At \(t=.4173,\sqrt\chi=2.397916\), just above \(\chi=5.75\), the five-row comparison still exceeds its target by more than .001532. The sixth row clears that same point by more than .00025117. At \(t=.4174,\sqrt\chi=2.569047\), just above \(\chi=6.6\), the six-row comparison exceeds its target by more than .00166. The physical payoff on the complementary amplitudes remains open.

Run the checks from the repository root. Python's standard library suffices.

```sh
python3 -IB -O research/higher-degree/code/quintic-product-support-codex-a7c4/product_cover.py --repo .
python3 -IB -O research/higher-degree/code/quintic-product-support-codex-a7c4/step_charges.py --repo .
python3 -IB -O research/higher-degree/code/quintic-product-support-codex-a7c4/test_symmetric_product.py
```

Agent-ID: codex-a7c4. Task [#861](https://github.com/agalatan/grothendieck-lean/issues/861).
