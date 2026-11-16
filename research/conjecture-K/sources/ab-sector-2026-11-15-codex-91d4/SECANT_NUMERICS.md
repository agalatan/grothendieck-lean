<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/SECANT_NUMERICS.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Phase 0 joint secant reconnaissance

Agent-ID: **codex-91d4**. Issue #426. 15 November 2026.

**N throughout this note**, except the algebraic formulas also derived in
GEOMETRY.md. No search minimum is a lower bound, no fitted matrix is a
global majorant, and no quadrature tolerance here is a rigorous enclosure.

## Method and scope

`secant_probe.py` uses the symmetry `w=x≥0`, with
`α=R cos(t) exp(iφ_A)` and `β=R sin(t) exp(iφ_B)`. Both phases remain.
The visible integral uses Gaussian Legendre panels in `r=|Z|`, truncated
at six, and an equally spaced angular rule. The base search has 24 radial
panels, eight nodes per panel and 96 angles. It evaluates 3,123 parameter
points per tilt (1,323 structured points plus 1,800 random points with
seed 914), followed by five bounded local searches per tilt. Structured
points include base radii zero through six and amplitudes .03 through six.
The local-search box is `0≤x≤6`, `.02≤R≤7`, `0≤t≤π/2`, and both phases
in `[-π,π]`. Nothing covers the omitted continuum or exterior.

The doubled norm remainder is evaluated stably. Rotate `h` into the
direction of `v=L+w` and put `d=|v|+Re(h conj(v)/|v|)`,
`c=Im(h conj(v)/|v|)`. The undoubled remainder is
`sqrt(d²+c²)−d`; when `d>0` use `c²/(sqrt(d²+c²)+d)` to avoid cancellation.
This identity also makes its nonnegativity explicit. A quadrature node
at `v=0` would require special handling; the supplied midpoint angular
grids and search points do not have one.

Each selected witness is recomputed at `(36,12,192)`, `(64,16,384)` and
`(96,20,768)` resolutions. Only the witness, not the entire search, gets
this refinement. These are convergence diagnostics, not outward error bars.

## Results

The quantity minimized is `(ρ*Pρ−Rem)/(|α|²+|β|²)`.

| tilt `(s_A,s_B)` | exact-form zero-core eigenvalue, evaluated numerically | lowest witness after finest quadrature |
|---|---:|---:|
| `(.6,0)` | .247721504118 | .247866736812 |
| `(.5,0)` | .360481430682 | .360655005931 |
| `(.3434,0)` | .462222974979 | .462394306460 |
| `(.6,.30318)` | .389857470419 | .095772472291 |

The first three searches run towards the small-amplitude, zero-core
boundary. The exact zero-core formula supplies a smaller limiting value
than their finite-amplitude witnesses. In particular the previous sampled
value .252 at tilt (.6,0) missed this limiting eigen-direction. A uniform
common cost cannot exceed .247721504118 at this tilt. The new scalar
checker in `content_structure_exact.py` separately encloses the exact
local quantities; that finite check does not certify a global minimum.

The matched second tilt has a genuine finite-amplitude numerical
obstruction: `x=.666121689158`, `R=.528551275907`, mixing angle
`.561274329397`, phases approximately `−.0000441,.0003174`.
Its three refined costs are `.095774752124`, `.095772529742`,
`.095772472291`. Thus the zero-core matrix badly overestimates the useful
global cost at this tilt. This is not a counterexample to the retained
functional inequality: the pointwise cost relaxation is the object tested.

## Matrix fitting is a proposal generator

For a sample with normalized direction `(a,b)`, any candidate constant cost
`K` must satisfy `K_A|a|²+2K_AB Re(a conj b)+K_B|b|²≤cost(sample)`.
The script fits positive matrices to these inequalities and also imposes
the full necessary matrix inequality `K≤K₀` at the zero core. The latter
prevents a coarse directional grid from proposing an impossible local
matrix. Three objectives are recorded: maximum trace, minimum
`(K⁻¹)_AA`, and minimum `(1,.5053)K⁻¹(1,.5053)ᵀ`.

There is no unique meaning of "best majorant" without an objective.
These fits are feasible only for the finite numerical constraints.
Optimizer success and tiny residuals are never certificate acceptance.

For `(.6,0)`, the maximum-trace fit is approximately
`K=[[.211929,.105307],[.105307,.631679]]`. A simpler proposed matrix for
future certification is `K=.23 I`, i.e.

    M=diag(p−9/25−23/100, p−23/100)
     =diag(.7320518244…,1.0920518244…).

This candidate passed this reconnaissance and lies strictly below the
zero-core least eigenvalue. It remains an **open global bound**.

For the matched two-tilt case, even the content-directed numerical fit
has inverse factor about `12.99339` along `(1,.5053)`. A single witness
already forces essentially this value, by
`v*K⁻¹v≥|v*h|²/(h*Kh)≥|v*h|²/cost(h)`.
Thus using the existing A-content coefficient .3 and perfect alignment
would give a slope of at least about `3.898`, not below one. This diagnoses
that particular use of the existing content bound; it does not rule out
sharper content estimates or a different retained multiplier.

The lower tilts improve cost numerically but change the content profile.
Their gains cannot be combined with the proved content theorem at s=.6.
