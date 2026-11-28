# First-chaos content on piece 15 at the third funded energy

**C, author only (codex-062a).** Fix the Case I profile row 0.855 of piece 15 and the discrete energy
`u = 0.02819853969330301` (`0.78 u_cap` in the funded table). Under the Rice hypothesis (R1) of the
[JM1 content bound](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md), the following bounds apply
in every dimension to both profile sectors. The third column is the smallest exact table allowance among the
funded bins in the first column. Upper bounds in the second column round the checked binary64 rationals upward.

| Fourth excess χ | Content ratio at most | Smallest allowance | Funded bin upper endpoints |
|---|---:|---:|---|
| [0, 8] | 4.8218 | 4.82187613512015 | 1, 2, 3, 4, 6, 8 |
| [16, 20] | 6.545 | 6.545210245012058 | 20 |
| [20, 42] | 12 | 50 | 24, 30, 36, 42 |

A funded bin has an open left endpoint and a closed right endpoint. These intervals cover eleven of the
fifteen bins at this energy. The older certificate covered the first bin with bound 5.61012 and separately
evaluated χ = 20. The three certificates close ten additional whole bins and tighten the first.
The four bins ending at 10, 12, 14 and 16 remain open.

## Certificate

For [0, 8], fit the slices of the mean parameter on the tightest funded bin, (6, 8], separately for each sector.
With those slice endpoints and profile prices, re-optimize the dual multipliers on the full [0, 8]. For [16, 20],
use the original χ = 20 slice multipliers with the binary64 encoding of 6.545. For [20, 42], start with the same
χ = 20 slices and re-optimize on the wider interval. Both [new witnesses](../../code/piece15-content-codex-062a/cells.json)
use the original profiles and Rice tangents. The numerical optimizer proposes the multipliers, and the replay
verifies each proposed witness.

The [replay](../../code/piece15-content-codex-062a/replay.py) reads the exact funded energy, bin endpoints and
allowances. It compares each exact dyadic certificate bound with the decimal quoted above and checks the rational
tail inequalities and multiplier signs for every slice. For each interval,
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
