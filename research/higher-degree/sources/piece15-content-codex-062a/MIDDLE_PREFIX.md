# Middle fourth-excess bins above the second energy of piece 15

Agent-ID: codex-062a. Issue #623. The first 40 rectangles have status **C**. Gemini-21d5 independently checked their exact funding, slice coverage and input digest. The 25 further rectangles have status **C, author only**. [Funding audit](https://github.com/agalatan/grothendieck-lean/pull/909#issuecomment-7237479243).

On the funded row 0.855 let $u_1=0.02530638177604116$, $u_2=0.02819853969330301$ and
$u(x)=(1-x)u_1+xu_2$. These are the 0.70 and 0.78 energy-cap nodes.
For each fourth-excess bin the table below gives the last $x$ in a contiguous cover starting
at zero. The common endpoint is $x=13/64$, corresponding to $u=165720648659103829/6400000000000000000$.
The verifier tests the interpolated allowance for both Case I profiles under the
[Rice hypothesis (R1)](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md).

| Fourth excess χ | Last normalized energy x | Rectangles |
|---|---:|---:|
| (8, 10] | 13/64 | 16 |
| (10, 12] | 63/256 | 17 |
| (12, 14] | 83/256 | 13 |
| (14, 16] | 139/256 | 19 |

The first 40 rectangles use sector multipliers from the [preceding band](ENERGY_BAND.md) or its
[0.70 endpoint](FIRST_ENERGIES.md). In the [manifest](../../code/piece15-content-codex-062a/middle_prefix.json)
each interval lists its right endpoint, exact dyadic price, and the two witness identifiers in A, B order.
Its left endpoint is the preceding right endpoint or zero for the first interval of a bin.
`prior-H-I` selects the zero-based record `I` in the preceding band's group ending at `H`.
`node-I` selects the zero-based record `I` from the verified 0.70 endpoint.

The additional 25 rectangles use [four refitted pairs](../../code/piece15-content-codex-062a/middle_fits.json).
Each starts with the last witness on $(10,16]$ of the preceding energy band.
In `fit-L-H-i`, the fit uses the fourth-excess bin $(L,H]$ at the midpoint of the normalized energy interval
$[i/8,(i+1)/8]$. The proposal price rounds that interval's minimum allowance down to the nearest multiple of $2^{-16}$.
The manifest separately gives the price and the two donors for each target rectangle. The native replay checks each
donated sector on its target domain at that rectangle's price. This permits reuse across bins, energy intervals and prices.

The [replay](../../code/piece15-content-codex-062a/middle_prefix.py) reads the exact decimals of the
funding table. It checks the price at both endpoints of each interval. The allowance is affine,
so the price is affordable throughout. It rounds the energy endpoints outward for the
native computation and checks the multiplier signs and unbounded tails with rational arithmetic.
The C++ verifier integrates the Gaussian row, checks coverage of the full mean-parameter range
and bounds the continuous residual in both sectors. Its input stream for all 65 rectangles has
SHA-256 `c0b585465ceb78f96395ba22a93d7be566500e20b0b77a6bbb3dbbc145d8cd4a`.

The original Linux replay integrated all 15 source rows and passed the parent controls and the first 40 rectangles.
The largest reported residuals were below $-2.10\times10^{-7}$ for A and $-1.01\times10^{-7}$ for B.
[Native replay at the recorded input digest](https://github.com/agalatan/grothendieck-lean/actions/runs/46131175115).

Run the following commands from the repository root.

```sh
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/test_middle_prefix.py
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/middle_prefix.py
```

To regenerate the four refits, dump row 0.855 as in the [endpoint instructions](PROOF.md).
From the witness directory, run the proposer with the pinned numerical stack.

```sh
uv run --no-project --python 3.12.3 --with numpy==2.3.5 --with scipy==1.17.1 python -IB middle_prefix.py --price row.json
```

The remaining portions of these four bins toward $u_2$ are open. The downstream payoff assembly
also requires H5, H7 and H8 of row 4.45 in the [status table](../../STATUS.md).
