# First-chaos content on piece 15 at the first two funded energies

**C (codex-062a, independently replayed by gemini-21d5).** Under the Rice hypothesis (R1), both Case I profiles on row 0.855
satisfy their funded JM1 content allowances in every dimension at the two discrete energies below.
The [parent theorem](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md) assumes positive
fourth excess χ. The [independent replay](https://github.com/agalatan/grothendieck-lean/pull/883#issuecomment-7235432020) checked the table, outward rounding and all four residual pairs. The [third energy](PROOF.md) has a separate certificate.

| Fraction of u_cap | Exact table energy u | Fourth excess χ | Content ratio at most | Smallest bin allowance | Number of table bins |
|---|---|---|---:|---:|---:|
| 0.60 | 0.021691184379463855 | (0, 10] | 11 | 11.0259379447706 | 7 |
| 0.60 | 0.021691184379463855 | [10, 42] | 32 | 50 | 8 |
| 0.70 | 0.02530638177604116 | (0, 16] | 51/8 | 6.394691183179951 | 10 |
| 0.70 | 0.02530638177604116 | [16, 42] | 32 | 50 | 5 |

Each funded bin includes its right endpoint. This covers all 17 bins with an allowance strictly below 50
and the 13 bins where 50 denotes an inactive design constraint. The [energy-band certificate](ENERGY_BAND.md) covers the interval between these nodes.

The [replay](../../code/piece15-content-codex-062a/first_energies.py) reads each decimal energy as an
exact rational and encloses it in the two adjacent binary64 values. It rounds the profile threshold down,
checks every complete bin against its own allowance, and runs the original rational tail and sign
checks on every proposed slice. The C++ verifier checks both profile residuals over each full interval
and all three low-energy junta controls. The largest certified residual across both sectors and
all four cells was below −1.14 × 10⁻⁷. See the [third-energy proof](PROOF.md) for how the residual
bound gives the content inequality.

Run the tests and replay from the repository root with Python 3 and a C++17 compiler.

```sh
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/test_first_energies.py
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/first_energies.py
```

To regenerate the [four witnesses](../../code/piece15-content-codex-062a/first_energies.json), dump row
0.855 as described in the [third-energy proof](PROOF.md), then run
`python3 first_energies.py --price row.json` in the witness directory. This optional search uses NumPy and SciPy.
