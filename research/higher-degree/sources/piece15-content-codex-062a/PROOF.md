# First-chaos content on piece 15 at the third funded energy

**C, author only (codex-062a).** Fix the Case I profile row 0.855 of piece 15 and the discrete energy
`u = 0.02819853969330301` (`0.78 u_cap` in the funded table). Under the Rice hypothesis (R1) of the
[JM1 content bound](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md), the following bounds apply
in every dimension to both profile sectors. The third column is the smallest exact table allowance among the
funded bins in the first column. Upper bounds in the second column round the checked binary64 rationals upward.

| Fourth excess χ | Content ratio at most | Smallest allowance | Funded bin upper endpoints |
|---|---:|---:|---|
| [1, 2] | 8.375 | 8.386495963199698 | 2 |
| [2, 3] | 6.72 | 6.730009865768297 | 3 |
| [16, 20] | 6.545 | 6.545210245012058 | 20 |
| [20, 42] | 12 | 50 | 24, 30, 36, 42 |

A funded bin has an open left endpoint and a closed right endpoint. The older certificate for this energy covered
χ from 0 through 1 and separately evaluated χ = 20. These four closed intervals cover seven additional whole
bins. The seven intervening bins in (3, 16] remain open at this energy.

## Certificate

For [16, 20], use the two lists of slice multipliers from the published χ = 20 certificate and set the ratio
bound to the binary64 encoding of 6.545. For the other three intervals, keep the existing row profiles and global
Rice tangents. Re-optimize the dual multipliers against each full interval, starting from the original χ ≤ 1
slices for the first two intervals and the χ = 20 slices for the last. The numerical optimization proposes the
three [witnesses](../../code/piece15-content-codex-062a/cells.json).

The [replay](../../code/piece15-content-codex-062a/replay.py) reads the exact funded energy, bin endpoints and
allowances, and checks the rational tail inequalities and multiplier signs for every slice. For each interval,
the original C++ certifier encloses both Gaussian profiles, checks the slices cover the full range of the
mean parameter, bounds the dual residual by directed rounding over the compact part of the radial variable,
and checks the remaining unbounded tail. A strictly negative supremum in each sector gives the stated ratio
by the original JM1 theorem. The input to that check includes both endpoints of each χ interval.

Run from the repository root with Python 3 and a C++17 compiler.

```sh
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/test_replay.py
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/replay.py
```

To generate candidate multipliers again, use the original C++ certifier’s `--dump-rows row.json --only-row 0.855`
option, then run `python3 price.py row.json` in the [witness directory](../../code/piece15-content-codex-062a/).
The pricing step uses NumPy and SciPy. The proof replay uses Python’s standard library and the C++ certifier.
