# Funded fourth-excess bins between the second and third energies of piece 15

Assume the Rice hypothesis (R1) from the [JM1 derivation](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md).
On piece 15, row 0.855, the two successive funded energies at 0.70 and 0.78 times the energy cap are
exactly `0.02530638177604116` and `0.02819853969330301`. Denote them by $u_1$ and $u_2$ and put
$u(x)=(1-x)u_1+xu_2$ for $0\le x\le1$. At each fourth-excess bin endpoint the design specifies an
affine interpolation of its two allowances. The directed-rounding replay verifies the interpolated allowances for both Case I profiles at
every $u(x)$ on the eleven bins ending at 1, 2, 3, 4, 6, 8, 20, 24, 30, 36 and 42. Across these
bins, 46 pairs of multipliers cover 162 rectangles. The [middle-bin replay](MIDDLE_PREFIX.md) covers each intervening bin from $x=0$ to its listed endpoint. Combined, the two replays cover all fifteen bins through $x=43/256$.

| Fourth excess | Smallest bin allowance at $u_1$ | Smallest bin allowance at $u_2$ | Energy rectangles | Pairs of profile witnesses |
|---|---:|---:|---:|---:|
| $0<\chi\le8$ (six bins) | 6.499124210812731 | 4.82187613512015 | 132 | 27 |
| $16<\chi\le20$ | 50 | 6.545210245012058 | 20 | 11 |
| $20<\chi\le42$ (four bins) | 50 | 50 | 10 | 8 |

For $(16,20]$ the price must follow the falling allowance. On the first eighth the proposed
bound is $1460409/32768$. On the final $1/512$ of the energy interval the multipliers and binary64
bound for the [third energy](PROOF.md) suffice in the production replay. This last bound is exactly
$3684507445142487/562949953421312$. For the four upper bins the same price 48 is affordable
throughout. Each rectangle includes its two energy endpoints. The [first energy band](ENERGY_BAND.md) ends at $u_1$.

The [replay](../../code/piece15-content-codex-062a/second_band.py) checks every bin at both ends
of each rectangle over the exact decimal table. Affinity gives the funding inequality throughout.
It rounds the energy endpoints outwards, checks the multiplier signs and unbounded tails with
rational arithmetic, and passes those same rectangles to the directed-rounding C++ verifier.
The Python checks also reject a gap between adjacent witness slices and require the native mean-parameter enclosure for each sector to contain zero and fit inside its witness endpoints.
Strictly negative residuals in both sectors and coverage of the full mean-parameter range then give
the JM1 bound under (R1). The downstream payoff assertion also requires H5, H7 and H8 of row 4.45
in the [research status table](../../STATUS.md).

Each group records its multipliers once and lists the exact rational energy intervals on
which to use them. The [low-bin manifest](../../code/piece15-content-codex-062a/second_band_0_8.json)
indexes six shards. Its starting multipliers come from the two published endpoint witnesses or a fit
to $(6,8]$ at an energy-eighth midpoint. The proposal then refits the multipliers over $(0,8]$
at the recorded pricing energy. A null pricing energy denotes direct reuse of the starting witness. For $(16,20]$ the proposal refits the third-energy multipliers at each recorded
pricing energy, except for the final rectangle where it reuses those multipliers directly. For
$(20,42]$ the proposal fits both sectors at the eight energy midpoints. The SHA-256 of the 30-rectangle
input stream is `a3113c8d5ecee01586efcc28ec7fa6142ec02bfd9282ceda4bb921ba0fe95f3d`.
The certified residual upper bounds over those rectangles are at most $-1.0958\times10^{-7}$
for A and $-1.1053\times10^{-7}$ for B. The low-bin 132-rectangle stream has SHA-256
`0d9c4b43c7f67962a080e850dd7f9bd07d6f71f7ac193e7dcece2e10aaf6d58c`.
The upper residuals in the low-bin replay are at most $-1.0103\times10^{-7}$ for A and
$-1.0008\times10^{-7}$ for B. Each replay also passed the three low-energy controls. Encoding
all 162 rectangles consecutively gives SHA-256 `dff2c8f14636ef974ed71f901166b1b921550034e471bfd9f46268d35088bbfa`.

Run the following commands from the repository root with Python 3 and a C++17 compiler.

```sh
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/test_second_band.py
python3 -IBO research/higher-degree/code/piece15-content-codex-062a/second_band.py
```

To reproduce the proposal, dump row 0.855 as in the [third-energy instructions](PROOF.md). From the witness directory, regenerate each group with the numerical stack used by its proposer. The
two upper groups reproduce all 19 stored pairs with these commands.

```sh
uv run --no-project --python 3.10.21 --with numpy==2.2.6 --with scipy==1.15.3 python -IB second_band.py --price row.json --price-bin 20
uv run --no-project --python 3.12.3 --with numpy==2.3.5 --with scipy==1.17.1 python -IB second_band.py --price row.json --price-bin 42
```

For the six low bins, run the second command with `--price-bin 8`. The certificate replay above
uses the stored multipliers directly and requires only Python and a C++17 compiler.
