# Independent replay of the transported anchor

The anchor used by `analytic/transport-m14-r015.json` now has a fresh full
integral replay. The selected input is
`handoff/lower-stein/cert-0745e/bundles/newA_proof_0.85_0.json`, index 15 in
both `recipes` and `results`, row `0.85`, anchor `s=31/400`. Rebuilding the
Gaussian moment tables, the rational prices, the integrated majorant, and
every output field gives **exact equality with the archived result**.

```
python3 -I tools/rankone_replay_anchor.py \
  --out handoff/research-third-decimal/rank-one-certification-20261023/replay/row085-anchor031400.json \
  --tables-out handoff/research-third-decimal/rank-one-certification-20261023/replay/moments-1600-64.json
```

This took 26.977 seconds, including 18.136 seconds to regenerate the shared
moment tables. The anchor's old scalar cap is approximately
`1.3904676638940174`; its minimum Schur LDL pivot is approximately
`0.13307149638979165`. The JSON ledger contains the exact rationals, hashes
of every source dependency, normalization checks, and the whole regenerated
result. The full rational moment table is also saved. Neither cap nor
eigenvalue display decimal is an acceptance criterion.

## Source lineage

The original bundle verifier is documented as `table_generator.py --verify`
in `handoff/research-third-decimal/pipeline/wcert/CAPS_PROVENANCE.md` and
`handoff/lower-stein/cert-0745e/CAPS_PROVENANCE_e.md`. The older output
package referenced there is outside the repository. Reading its content
stalled in the filesystem, so this replay uses the repository's local exact
copy, not an unrecorded substitute:

`handoff/research-third-decimal/gpt-reviews/rotation-gates-20261015/review/rebase_support/`

* `anchored_certificate.py`: deterministic price construction, outward
  fixed-point integration, rational Loewner rounding and Schur completion.
* `moments.py`: all radial, angular and tail integral enclosures.
* `check_incumbents.py`: elementary exponential and trigonometric enclosures.
* `exact_base.py`: rational intervals, Machin pi bounds, square-root bounds,
  exact matrix algebra.
* `verify_rebased_anchors.py`: independent reconstruction of the Schur
  formula and profile checks; its default `full=True` reconstructs selected
  original anchors from their recipes and requires equality.

The wrapper `tools/rankone_replay_anchor.py` exposes one bounded replay. It
checks bundle/profile/recipe alignment, the source-row hash, grid dimensions,
the entire regenerated result, and the independently recomputed old Schur
quadratic. The stored C, h and H never enter the regenerated integrals.
The archived table-v1 row hash includes a terminal newline; the replay
records both that convention and its own compact canonical hashes.

## Why this is a global quadratic majorant

Write `lambda(r)=r*(ell-2*beta+beta*r^2)`,
`L=lambda(r)*exp(i theta)`, and `x=Re(p*conj(L))`. For any positive rational
prices a,b, put `S=a+b`, `Delta=a-b`, and choose `R>=|L|`. Let

`u=|L+p|`, `v=|L-p|`, `alpha=u-a`, `eta=v-b`, `delta=u-v`.

The ordinary Young gap is

`alpha^2/(2a)+eta^2/(2b)`.

The reverse triangle inequality gives `|delta|<=2R`. The exact identity

`u^2-v^2-(a^2-b^2)=(delta+S)*alpha+(delta-S)*eta`

and weighted Cauchy--Schwarz show that its square is at most

`(alpha^2/a+eta^2/b)*S*(S^2+delta^2+2*delta*Delta)`

and hence at most

`(alpha^2/a+eta^2/b)*D`, where
`D=S*(S^2+4R^2+4R*|Delta|)`.

Consequently the Young majorant can be decreased by
`(4*x-(a^2-b^2))^2/(2D)` for **every complex p**. On a polar cell the
prices and R are constant. Expanding gives

`nu*(|L|^2+|p|^2) - gamma*x^2 + 2*tau*x + xi`,

with exactly the coefficients used by `weights`:

```
nu    = (1/a+1/b)/2
gamma = 8/D
tau   = (1/a-1/b)/2 + gamma*(a^2-b^2)/4
xi    = (a+b)/2 - gamma*(a^2-b^2)^2/16
```

Integration therefore bounds the paired norms by
`C+2*h^T*v+v^T*H*v` for all 12 real fibre coordinates v. The prices are
chosen using the anchor, but the inequality is global in v. The choice is
a singleton positive rational at scale `10^-40`; using an approximate RMS
to choose that rational does not approximate the inequality.

## Moments, symmetries and matrix rounding

The grid has 1600 radial bands on `[0,8]` and 64 quarter-angle cells. The
radial table encloses

`Rad[i,k]=integral_[r_i,r_(i+1)] 2*r^(k+1)*exp(-r^2) dr`, `k=0,...,12`.

The angular table encloses

`Ang[j,k]=(2/pi)*integral_[theta_j,theta_(j+1)] cos(k*theta) dtheta`,
`k=0,...,4`, where `theta_j=j*pi/128`.

The Gaussian density is `pi^-1*exp(-|z|^2)`. The quarter-angle measure is
normalized to `2/pi` after symmetry. The radial degrees are sufficient:
the even radial factors have degree at most 2; the odd factors have degree
at most 3; multiplying by lambda before squaring reaches degree 12.
The highest angular harmonic is 4.

Radial integrals use the Taylor polynomial through order 10 of
`exp(-2*c*t-t^2)` on a band centered at c with halfwidth h. With
`Y=2*c*h+h^2<1`, the pointwise remainder is bounded by
`Y^11/(11!*(1-Y))`. The polynomial is integrated exactly. `exp(-c^2)`
is enclosed by an alternating Taylor enclosure for `exp(-c^2/64)`,
then six interval squarings. Pi uses Machin's arctangent identity;
trigonometric values use Taylor enclosures after exact rational angle
symmetries reduce the sine argument to `[0,pi/2]`.

Beyond radius 8 the generator uses ordinary Young with a=b=1 and no square
correction. The tail table encloses `J_k=integral_8^infinity
2*r^(k+1)*exp(-r^2) dr` using

`J_0=exp(-64)`, `J_1=8*exp(-64)+integral_8^infinity exp(-r^2) dr`,
`0<=integral_8^infinity exp(-r^2) dr<=exp(-64)/16`,
`J_k=8^k*exp(-64)+(k/2)*J_(k-2)`.

As independent consistency checks, the regenerated radial sums enclose
`Gamma(1+k/2)` for all 13 degrees and the angular sums enclose the
corresponding five exact quarter-angle integrals. These checks supplement
the analytic remainder derivations; normalization alone would not certify
each cell.

The even fibre basis is `(1,r^2-1,r^2*exp(2i theta)/sqrt(2))`, with
conjugation on the third complex coordinate as in `Fib.fn`. The odd basis
is `(r*exp(i theta),(r^3-2r)*exp(i theta)/sqrt(2),r*exp(-i theta))`.
Conjugation kills real/imaginary cross terms. Under `z -> -z` the two
prices **swap** rather than remain individually fixed: nu,gamma,xi are
unchanged and tau changes sign. This kills even/odd cross terms and all
linear terms outside the real-even block. It yields the four 3 by 3
blocks used by the source generator. The even shift is entirely real.

All integral operations are enclosed using decimal fixed-point integers
with outward rounding at scale `10^40`; the elementary moment routines
use rational intervals with outward denominator `10^48`. The final
interval matrices are replaced by an exact rational matrix: take entrywise
midpoints and add the maximum row sum of interval radii to the diagonal.
The augmented 4 by 4 block `[C h^T; h H0]` is rounded jointly; the other
three blocks are rounded separately. The row-sum norm inequality proves
Loewner domination.

**Naming detail:** `h_exact` is an exact rational coefficient of this
joint rational majorant. It is not a claim that the analytic Gaussian
linear integral has been evaluated to an exact rational number.

Finally, the generator checks positive LDL factorizations of both gates
and all four `D_i=Q_i-H_i` blocks. Completing squares gives the exact
stored global quadratic. The replay also reconstructs that quadratic by
the separate rebasing verifier with the original gate.

## What is and is not closed by this replay

The finite arithmetic/provenance obligation for this **one selected
anchor** is closed: all Gaussian tables and C,h,H values were regenerated,
and every archived result field matches exactly. The next rank-one
transport can refer to this ledger instead of inheriting these coefficients
without replay.

The Python run does not prove the scalar, polar-coordinate, symmetry or
elementary Taylor theorems inside Lean. Their mathematical justification
is given above and in the source notes; integrating the selected anchor
with a Lean checker remains separate. Nor does this run verify the other
archived anchors, a full rank-one tau interval, the row/envelope cover,
or an improved endpoint for the Grothendieck constant.
