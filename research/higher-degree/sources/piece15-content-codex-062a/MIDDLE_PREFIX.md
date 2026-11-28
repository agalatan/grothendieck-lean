# Middle fourth-excess bins above the second energy of piece 15

Agent-ID: codex-062a. Issue #623. Status **C**. The author completed the native replay. Gemini-21d5 independently checked the exact funding, slice coverage and input digest. [Funding audit](https://github.com/agalatan/grothendieck-lean/pull/909#issuecomment-7237479243).

On the funded row 0.855 let $u_1=0.02530638177604116$, $u_2=0.02819853969330301$ and
$u(x)=(1-x)u_1+xu_2$. These are the 0.70 and 0.78 energy-cap nodes.
For each fourth-excess bin the table below gives the last $x$ in a contiguous cover starting
at zero. The common endpoint is $x=43/256$, corresponding to $u=660279652510879651/25600000000000000000$.
The verifier tests the interpolated allowance for both Case I profiles under the
[Rice hypothesis (R1)](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md).

| Fourth excess χ | Last normalized energy x | Rectangles |
|---|---:|---:|
| (8, 10] | 51/256 | 15 |
| (10, 12] | 13/64 | 11 |
| (12, 14] | 37/128 | 7 |
| (14, 16] | 43/256 | 7 |

Every sector multiplier comes from the [preceding band](ENERGY_BAND.md) or its
[0.70 endpoint](FIRST_ENERGIES.md). In the [manifest](../../code/piece15-content-codex-062a/middle_prefix.json)
each interval lists its right endpoint, exact dyadic price, and the two witness identifiers in A, B order.
Its left endpoint is the preceding right endpoint or zero for the first interval of a bin.
`prior-H-I` selects the zero-based record `I` in the preceding band's group ending at `H`.
`node-I` selects the zero-based record `I` from the verified 0.70 endpoint.

The [replay](../../code/piece15-content-codex-062a/middle_prefix.py) reads the exact decimals of the
funding table. It checks the price at both endpoints of each interval. The allowance is affine,
so the price is affordable throughout. It rounds the energy endpoints outward for the
native computation and checks the multiplier signs and unbounded tails with rational arithmetic.
The C++ verifier integrates the Gaussian row, checks coverage of the full mean-parameter range
and bounds the continuous residual in both sectors. Its input stream for all 40 rectangles has
SHA-256 `d5f214e862f259850007d5946ef2233ec12edc54ba3b62e853ecd2d4a3306c5b`.

The Linux replay integrated all 15 source rows and passed the parent controls and all 40 rectangles.
The largest reported residuals were below $-2.10\times10^{-7}$ for A and $-1.01\times10^{-7}$ for B.
[Native replay at the recorded input digest](https://github.com/agalatan/grothendieck-lean/actions/runs/46131175115).

Run the following commands from the repository root.

```sh
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/test_middle_prefix.py
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/middle_prefix.py
```

The remaining portions of these four bins toward $u_2$ are open. The downstream payoff assembly
also requires H5, H7 and H8 of row 4.45 in the [status table](../../STATUS.md).
