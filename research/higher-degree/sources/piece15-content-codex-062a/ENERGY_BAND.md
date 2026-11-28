# First-chaos content between the first two energies of piece 15

**C (codex-062a).** Gemini-c1de [independently checked the affine funding and replayed all 136 rectangles with GCC](https://github.com/agalatan/grothendieck-lean/pull/898#issuecomment-7236517954). Assume the Rice hypothesis (R1) of the [content-cell proof](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md).
Take either Case I profile of piece 15, row 0.855, in any dimension. Write
$u(x)=(1-x)u_0+xu_1$, where the two table energies are exactly
$u_0=0.021691184379463855$ and $u_1=0.02530638177604116$.
For any fourth excess $0<χ≤42$, use the next table endpoint at or above χ and interpolate its two
tabulated JM1 allowances affinely in x, as specified in the [Case I problem](../degree5-attack-2026-11-25/problems/P1-content-law-on-covering-rows.md).
The table below gives the upper bound on the JM1 content ratio for each profile. Each column meets the
funded allowance of every bin it contains.

| Energy parameter x | 0 < χ ≤ 4 | 4 < χ ≤ 10 | 10 < χ ≤ 16 | 16 < χ ≤ 42 |
|---|---:|---:|---:|---:|
| [0, 1/8] | 25/2 | 167/16 | 713/16 | 24 |
| [1/8, 2/8] | 95/8 | 79/8 | 313/8 | 24 |
| [2/8, 3/8] | 179/16 | 149/16 | 539/16 | 24 |
| [3/8, 4/8] | 169/16 | 35/4 | 113/4 | 24 |
| [4/8, 5/8] | 159/16 | 131/16 | 365/16 | 24 |
| [5/8, 6/8] | 37/4 | 61/8 | 139/8 | 24 |
| [6/8, 7/8] | 69/8 | 7 | 191/16 | 24 |
| [7/8, 15/16] | 127/16 | 107/16 | 147/16 | 24 |
| [15/16, 1] | 127/16 | 51/8 | 13/2 | 24 |

The four columns cover respectively four, three, three and five complete fourth-excess bins. On each
energy interval the allowance of any one bin is affine, so its minimum is attained at an endpoint.
The [replay](../../code/piece15-content-codex-062a/energy_band.py) compares its claimed bound with
both endpoints for each bin, using the exact decimal values in the design table. For example, the
allowance on (3, 4] decreases from 13.182814953808755 to 7.99153456408625. The bound on the last
eighth is 127/16 = 7.9375. The five bins above 16 have the default allowance 50 at both endpoints.

The four witness files correspond to [column 1](../../code/piece15-content-codex-062a/energy_band_0_4.json),
[column 2](../../code/piece15-content-codex-062a/energy_band_4_10.json),
[column 3](../../code/piece15-content-codex-062a/energy_band_10_16.json) and
[column 4](../../code/piece15-content-codex-062a/energy_band_16_42.json).
Their 34 pairs of multipliers are evaluated on 136 rectangles. Subdivision tightens the interval
evaluation while retaining the same pair of multipliers. The replay constructs all subdivision
endpoints as exact rationals and rounds them outward for the original C++ verifier. For every rectangle,
it checks the rational multiplier signs and tails, and the C++ verifier bounds both profile residuals
over the entire energy and fourth-excess range. Adjacent energy rectangles share a boundary.

The largest of the 136 certified residual upper bounds was below −1.4566 × 10⁻⁷ for profile A
and below −1.1236 × 10⁻⁷ for profile B. The verifier also enclosed all three low-energy controls.
The SHA-256 of the input stream for this replay is
`eb7fe70ad8b7ebc1b7e5da68993cee5a51441230efc97e3445421725f91a3d7f`.
The [two discrete endpoints](FIRST_ENERGIES.md) and the [third energy](PROOF.md) have separate certificates.

Run the tests and the full replay from the repository root with Python 3 and a C++17 compiler.

```sh
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/test_energy_band.py
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/energy_band.py
```

To regenerate the multipliers, dump row 0.855 as described in the [piece-15 proof](PROOF.md), then run
`python3 energy_band.py --price row.json` in the witness directory with NumPy and SciPy. The search
uses the midpoint of each energy interval except for the last (10, 16] witness, which was fitted at
x = 15/16. The production verifier checks each witness over its full stated interval.
