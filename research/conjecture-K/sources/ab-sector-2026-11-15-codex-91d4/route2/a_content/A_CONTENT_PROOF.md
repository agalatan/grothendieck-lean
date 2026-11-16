<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/route2/a_content/A_CONTENT_PROOF.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# A tightened content–deficit theorem

Agent-ID: **codex-91d4**. Refs #426. 15 November 2026.

**P, author only + C, author only.** At the exact peak row, for every
finite-dimensional remote complex Wick cubic `q∈H_(2,1)` with
`u=E|q|²≤463/10000`,

    ‖c_(A,3/5)(q)‖² ≤ (7/25)D₊(q)+3/500000.               (1)

Here `D(q)=B(u)−2E|L+q|`, `D₊=max(D,0)`,
`L=Z(699/1250+(179/1250)|Z|²)`, and
`c_(A,3/5)=Π_(1,0) E_Z[(|Z|²−2/5)ph(L+q)]`.
The linear subtraction used in the original profile definition has zero
first-chaos projection, since `Π₁q=0`.

This improves the reviewed coefficient `3/10` to `7/25=.28`, keeping the
same additive `6·10⁻⁶`, energy range, and all-dimensional quantifiers.
It does **not** establish the requested `.15` coefficient or close the
joint A/B bound. No same-variance deficit sign is assumed.

The new work consists of five scalar OU barriers, their angular metric
certificates, and a newly checked continuum budget using those stronger
content coefficients. The general shifted-resolvent, genuine-complex-chaos
moment/Stein, global profile-cap and spectral-dual soundness arguments are
the reviewed ones identified below. They are mathematical dependencies,
not proved mechanically by the new scripts.

## 1. Five new energy-dependent δ coefficients

Put `δ=E|q|⁴−2u²`, and write

    m(x)=E_Z[(T−2/5)sign(Re L+x)],
    k_u=∫_0^∞ exp(−5t/3)P_t^(u/2)m″ dt.

The reviewed shifted-resolvent proof gives the scalar differential
equation

    ℒ_u k_u=m″,       ℒ_u=5/3−(u/2)∂²+x∂,

and `‖c_(A,3/5)‖²≤(2/3)δ sup_R N_(Ψ_u)(R)`.
See the inherited `content_profile_proof.md`, `secant_content_proof.md`,
`deficit_structure_content_proof.md`, and `deficit_angular_proof.md`
under `research/conjecture-K/sources/received-2026-11-15-tilted-sector/`.

The following new coefficients hold for **every** `u` between the listed
lower endpoint and `463/10000`, and every fourth cumulant permitted by
the complex chaos theorem:

| lower energy | new coefficient `γ` in `‖c‖²≤γδ` | absolute scalar barrier cap | certified angular upper |
|---|---:|---:|---:|
| `1/125=.008` | `49/1000=.049` | `18/25` | `.047759056425647401` |
| `1/50=.02` | `83/2000=.0415` | `67/100` | `.041449732971425409` |
| `1/40=.025` | `393/10000=.0393` | `13/20` | `.039234493499131815` |
| `3/80=.0375` | `173/5000=.0346` | `61/100` | `.034486457330653968` |
| `21/500=.042` | `331/10000=.0331` | `3/5` | `.033007073865579079` |

The last column is an outward directed-rounding upper bound for the
content coefficient `(2/3)N`, not a numerical maximization estimate.

For each energy interval, the candidate JSON contains values and physical
first derivatives of a cubic Hermite interpolant `W` at `x=j/500`,
`0≤j≤500`. Candidates are numerical proposals only. The new checker
`certify_barrier.py` freshly verifies all of the following:

* `W(0)=0`, `W(1)=9/25`, `W′(1)≥0`, and `0≤W≤cap` by exact rational
  Bernstein coefficients.
* It freshly encloses all 501 values of `m″`; no saved source values
  are accepted. It rechecks the source interpolation derivative bound
  `|m''''|<1000`, with actual enclosure below `92.108`, and both the
  compact and infinite source tails.
* On each cell and at both energy endpoints, every Bernstein coefficient
  of `ℒ_uW−m″` and `ℒ_uW+m″` is positive, using the source interpolation
  allowance `1000/(8·500²)`. The minimum new margins exceed `1.93·10⁻⁵`.
  Affine dependence on `u` covers its whole interval.
* On `x≥1`, the fresh bound `|m″(x)|<3/5` makes the constant extension
  `W=9/25` dominate both signs because `(5/3)(9/25)=3/5`.

Oddness of `k_u` and the reviewed bounded half-line comparison principle
then give `|k_u(x)|≤W(|x|)`. The nonnegative left derivative at one gives
the favorable downward derivative jump when the constant extension starts.

The accepted table is passed to `angular_route2.cpp`. The angular metric
proof is unchanged: each supporting linear functional has an integrand
whose sign is determined by an affine function of `cos²θ`, hence has at
most one switch. The checker encloses all switch cells. It covers
`0≤R≤2` by 400 exact radius cells, each with 4096 angular cells, and the
whole `R≥2` ray analytically. All five tests passed without adaptive
radius subdivision. The new C++ file differs from the reviewed checker
only in the permitted already-certified scalar cap (`≤3/4` instead of
`≤13/20`), the include path, and removal of redundant fixed intermediate
tail ceilings: the final tail interval is compared directly with the
requested coefficient. The directed-rounding compiler flags are retained.
Additional acceptance guards reject `NDEBUG`, test upward rounding, and
bind each candidate tag to its exact advertised energy interval.

## 2. Content envelopes used in the continuum cover

In addition to the new table, the following reviewed inputs are inherited:

    C²≤(2/25)δ,
    C²≤3δ^(3/2),
    C²≤1/2500,
    C²≤(19321/10⁶)u,

and the previously certified energy-dependent coefficients at `.009`,
`.012`, `.015`, `.018`, `.03`, `.035`, `.04`, `.044`. At each energy slab
we use a coefficient valid from its lower endpoint; where multiple bounds
apply we may use the smaller one. Each accepted rectangle chooses **one**
valid content branch throughout that rectangle. The minimization of
different branches is only a search over valid certificates.

For nonzero energy write `U=|q|²/u`, `χ=EU²−2`. The reviewed genuine
complex `(2,1)` chaos inputs give

    EU=1,       0≤χ≤42,
    EU³≤6+9χ+(4045313/100000)χ^(3/2).

The Gaussian benchmark is `B(u)=E_Exp(1) h(uE)`, where
`h(v)=2E_Z|L+√v|`. The reviewed positive-mixture argument gives
`h''''≤0`, `−3<h″≤0`, and concavity of `B`.

## 3. Low energies: fresh Hermite-cap acceptance

`moment_cover.py` covers `[0,2/125]×[0,13/2]` in coordinates
`(u,x)`, `x=√χ`. The upper `13/2` also covers every `χ≤42`.
The exact global cubic Hermite caps for `h` are recomputed by fresh Arb
quadrature at their candidate nodes. Their global validity, including
outside the interpolation interval, follows from `h''''≤0`. Increasing
each coefficient outward preserves an upper cap on `v≥0`.

The exact Gaussian benchmark integrals are also recomputed. Concavity of
`B` gives a lower chord on each energy slab. Combining that chord, a
global profile cap, the three moment inequalities and one content branch
gives a bivariate polynomial lower bound for

    (7/25)(B(u)−E h(uU))+6·10⁻⁶−H_C(u,χ).

Exact rational Bernstein coefficients verify it on each accepted
rectangle. An exempt rectangle instead satisfies `H_C≤6·10⁻⁶` directly.
The checker verifies an exact partition of the entire rectangle.

The completed **fresh** run accepted 70 rectangles with zero uncovered
rectangles, in 29.45 seconds. Saved old witness coefficients are used only
by the explicitly conditional diagnostic mode; the default mode integrates
every profile cap and benchmark afresh.

## 4. Central energies: fresh spectral-dual acceptance

`deficit_cover.py` covers `[2/125,463/10000]×[0,42]`.
It reuses the 119 rational candidate dual models from the previously
reviewed certificate, but rechecks their full half-line polynomial
inequalities against freshly integrated base and extended profile caps.
The old `passed` flag and optimizer values are never acceptance inputs.
All Gaussian benchmark integrals are freshly recomputed as well.

The exact spectral-cut soundness statement is the one in the inherited
`deficit_dual_proof.md`. Every accepted model gives an explicit upper
bound `F_P(u,χ)` for `E h(uU)` for all genuine complex cubics with those
parameters. For a fixed energy, the **same** model and content branch
cover both kurtosis endpoints of an accepted rectangle. The quantity
`F_P+H_C/α` is convex in `χ`, so the margin `α(B−F_P)+η−H_C` is concave
in `χ` and its minimum on that interval is attained at an endpoint.

For a fixed normalized law and one fixed content branch define

    Q(u)=(7/25)(B(u)−E h(uU))+6·10⁻⁶−H_C(u,χ).

Since the content branches are convex in energy and `h″≥−3`,

    Q″(u)≤3(7/25)(2+χ).

Therefore the endpoint margins are reduced by the exact allowance

    [3(7/25)(2+χ_hi)/8]·(u_hi−u_lo)².

The resulting lower bound is positive on every accepted nonexempt box.
This is an upper second-derivative bound used for a **lower** chord bound;
its direction agrees with the reviewed original argument. Exempt boxes
again satisfy `C²≤6·10⁻⁶` without a deficit-sign premise.

The completed fresh replay accepted all 119 models and 126 rectangles,
with no uncovered boxes, in 20.63 seconds.

## 5. Union and positive part

The two covers meet exactly at `u=2/125`. Squaring the low cover's
nonnegative `x` endpoints and clipping to `χ≤42` gives an exact cover
of the same coordinates as the spectral cover. Together there are
196 rectangles over 45 energy strips. `verify_a.py` checks that there is
no gap in `[0,463/10000]×[0,42]`.

On every nonexempt rectangle the stronger signed statement
`C²≤(7/25)D+6·10⁻⁶` was established. It implies (1) because `D≤D₊`.
On an exempt rectangle `C²≤6·10⁻⁶` already proves (1), irrespective of
the sign of `D`. The zero-energy case has `q=0` and zero content.

No independence between `q` and shell drivers is used in (1); its
quantifier is every finite-dimensional remote cubic. It supplies content
only. A joint finite-amplitude cost and a sufficiently small B-content
budget are still needed for the user's joint result.

As a separate inherited-cost corollary, the reviewed global tilted-A
secant theorem with `k=59009/189100` now gives, for every remote linear
form `r` and every amplitude/sharing,

    J(q,r) ≤ (52948/59009)D₊(q)+5673/295045000.

Here `52948/59009≈.8973` replaces the previous `.9614` coefficient; the
additive sector allowance is unchanged. This is not a joint A/B theorem.

## 6. Replay and limits

Use Python 3.12 with python-flint and a C++17 compiler:

    python3 -I verify_a.py --dependency-dir /path/to/python-flint/site-packages

The wrapper rebuilds the directed-rounding checker, freshly replays every
new barrier, runs all five angular certificates, freshly rebuilds both
deficit covers, and verifies their exact union. It rejects `-O`/`-OO`.
Candidate search scripts are not in the acceptance path. The source helper
copies are bundled in `inputs/`; original files remain untouched. The
parent delivery's bundled 119-model witness is read as candidate data.

The preliminary `signed_probe.py`, `second_resolvent_probe.py`, and
`moment_probe.py` are **N only**. They showed that simply replacing
absolute angular envelopes by the true signed resolvent cannot achieve
the requested `.15` with the current deficit relaxations: its numerical
supremum coefficient at `u=.0463` is already about `.03143`, while the
fixed deficit bottleneck would require about `.0206`. These diagnostic
limitations do not refute a stronger true content theorem.
