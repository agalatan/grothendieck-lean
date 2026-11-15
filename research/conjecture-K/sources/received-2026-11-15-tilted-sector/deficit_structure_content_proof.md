<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_structure_content_proof.md (file dated 2026-11-15 05:34). Only this line was added. -->
# Further energy-dependent content bounds and absolute profile envelopes

Agent-ID: **codex-6e2b**, 15 November 2026.

**P+C**, using the shifted-resolvent and angular arguments in
`secant_content_proof.md`, with fresh scalar acceptance in
`deficit_structure_content_verify.py`.

For every dimension and every complex cubic `q` of bidegree `(2,1)`, set
`u=E|q|^2`, `delta=E|q|^4-2u^2`. At the peak row and tilt `s=3/5`:

| Energy interval | Certified content bound |
|---|---|
| `9/1000 <= u <= 463/10000` | `||c||^2 <= (11/192) delta < .06 delta` |
| `1/50 <= u <= 463/10000` | `||c||^2 <= (539/10800) delta < .05 delta` |
| `1/25 <= u <= 463/10000` | `||c||^2 <= (11/300) delta` |

The previously certified coefficient `1077659/27000000` remains stronger
on `3/100<=u<1/25`. No condition on the normalized fourth cumulant is used.

There are also two certified nonnegative envelopes for the entire scalar
resolvent profile, rather than only its supremum. Let

\[
k_u(x)=\int_0^\infty e^{-5t/3}P_t^{u/2}m''(x)\,dt,
\quad m(x)=\mathbb E[(T-2/5)\operatorname{sign}(\Re L+x)].
\]

The exact rational Hermite functions `W_40,W_44` in the witnesses below,
extended by `9/25` for `x>=1`, satisfy

\[
|k_u(x)|\le W_{40}(|x|)
\quad(1/25\le u\le463/10000),
\]
\[
|k_u(x)|\le W_{44}(|x|)
\quad(11/250\le u\le463/10000).
\]

Both are bounded by `3/5`. They retain their shape on `[0,1]` and can
therefore be used in a sharper angular metric certificate. This note
does not claim the resulting stronger angular constant.

## Exact witnesses and acceptance

Each JSON witness contains rational decimal strings for the values and
physical first derivatives at `x_i=i/500`, `0<=i<=500`. These define
the cubic Hermite interpolant exactly. The checker does not trust the
floating optimizer; all inequalities are revalidated with exact rational
polynomials and outward Arb source enclosures.

| Witness suffix | Energy interval | Supremum cap | Constant extension | Differential source |
|---|---|---|---|---|
| `low9` | `[.009,.0463]` | `3/4` | `3/4` | `m''` |
| `medium` | `[.02,.0463]` | `7/10` | `7/10` | `m''` |
| `high` | `[.04,.0463]` | `3/5` | `3/5` | `m''` |
| `absolute` | `[.04,.0463]` | `3/5` | `9/25` | both `m''` and `-m''` |
| `absolute44` | `[.044,.0463]` | `3/5` | `9/25` | both `m''` and `-m''` |

The filenames are `deficit_structure_content_witness_SUFFIX.json`.
The earlier `low` witness on `[.01,.0463]` is retained and replayed too,
although `low9` supersedes its energy coverage.

Put

\[
\mathcal L_u=5/3-(u/2)\partial_x^2+x\partial_x.
\]

For every witness the checker verifies its zero value at `x=0`, the
specified endpoint value at one, and a nonnegative derivative at one.
It verifies the stated supremum cap by the cubic Bernstein coefficients;
for the absolute envelopes it additionally verifies nonnegativity.

The source integrals are recomputed at all 501 knots. The same explicit
density derivative and interval Riemann proof as in
`secant_content_proof.md` certifies `|m''''|<=1000` on `[0,1]`
(the actual enclosure is below `92.108`). Thus the linear interpolation
of the source values plus `1000/(8*500^2)` is a valid majorant on every
cell. For an absolute witness this is done separately for each sign.

After subtracting the applicable source majorant from `mathcal L_u K`,
every cubic Bernstein coefficient is strictly positive at both energy
endpoints. Affine dependence on `u` covers the entire intervening
interval. The smallest residual margins exceed `1.93e-5`.

## Stronger outer source bounds

Fresh quadrature and the explicit infinite-ray estimate prove

\[
m''(x)>-1\quad(x\ge0),\qquad
|m''(x)|<3/5\quad(x\ge1). \tag{1}
\]

The compact cover consists of the 150 exact rational intervals
`[j/50,(j+1)/50]`, covering `[0,3]`. On the first 50 intervals only the
lower bound is tested; on the remaining 100 the absolute bound is tested.
The outer parameter ray starts at `ell(4)=2.264`, overlapping that cover,
and has the same absolute bound `<0.363864` already derived in
`secant_content_proof.md`. All source integration tails beyond `ell(20)`
are included. In the completed replay the compact/outer lower bound is
greater than `-0.972519`, and the absolute bound on `x>=1` is below
`0.597935`.

For an ordinary witness, (1) gives the lower scalar barrier `-3/5`
on the positive half-line. Its upper constant extension `c` is a valid
supersolution because `(5/3)c>=3/5`. The half-line comparison proof from
`secant_content_proof.md`, including the favorable downward derivative
jump at one, gives `-3/5<=k_u<=K` for `x>=0`. Oddness then gives the
stated supremum cap on the entire real line.

For an absolute witness, its source bounds are
`mathcal L_u W>=m''` and `mathcal L_u W>=-m''`. Its extension `9/25`
satisfies `(5/3)(9/25)=3/5`, so (1) validates both inequalities beyond
one. Comparing with `k_u` and `-k_u` separately yields `|k_u|<=W`.
The nonnegative endpoint derivative again gives the correct sign at the
piecewise junction. These are bounded half-line comparisons; no sign
assumption on `m''` or `k_u` is made.

## Content constants

The existing exact angular estimate and tensor resolvent identity give

\[
\|c_{3/5}(q)\|^2\le
\frac23\delta\sup_RN_{\Psi_u}(R)
\le\frac{11}{108}\|k_u\|_\infty^2\delta.
\]

The three scalar caps `3/4`, `7/10`, `3/5` therefore give the exact
coefficients `11/192`, `539/10800`, `11/300`, respectively. The absolute
envelopes give the same coarse last constant and preserve additional
information for a subsequent angular integration.

The numerical primal scans `deficit_structure_scan.py` and their result
files are separate diagnostics, not part of this certificate. They use
finitely many Stein tests and do not establish a theorem about all laws
or all cubic tensors.
