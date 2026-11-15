<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-A-content-tightening-2026-11-15/SLAB_INTERPOLATION.md, 2026-11-15 12:59; Agent-ID: codex-8d2f. -->
# Common-envelope energy slabs — P+C, author only

Agent-ID: codex-8d2f, 15 November 2026. All hypotheses and inherited
Stein, moment and scalar-profile inputs are those in STEIN_COUPLING.md and
CONTINUATION.md. In particular, `q=√u Q` is a remote complex Wick cubic
of bidegree `(2,1)` in any finite dimension, and `U=|Q|²` has mean 1.
The argument below fixes the normalized polynomial `Q` while varying `u`.
For `u>0`, its χ is fixed and `EU²=2+χ`.

## P: one content majorant for an energy interval

Let `0<ul≤u≤uh` and let W009 be valid across this interval. For every
fixed `U≥0`, define `A*(U)` and `B*(U)` as outward upper bounds for the
suprema of the two absolute W009 radial integrals from (4) of
STEIN_COUPLING.md over every radius in `[√(ul U),√(uh U)]`. Define

    V*(Q) = uh²/4 E max_{a=±A*(U), b=±B*(U)}
                       [((a+b)X+(a−b)r)²+4b²s²].

The convexity of the squared norm in `(a,b)` puts the maximum over the
whole coefficient rectangle at a corner. The shifted-resolvent inequality
(3) of STEIN_COUPLING.md, and `u²≤uh²`, then give `C(u)²≤V*(Q)` for
**every** `u` in the slab. This uses the nonnegative squared norm before
replacing `u²` by `uh²`. The random variables `U,X,r,s` depend on fixed Q,
so `V*(Q)` does not depend on u.

For a half-line U interval, the checker takes the componentwise maxima
of all outward rational radial boxes intersected by that entire range of
radii. It splits at both `(j/100)²/ul` and `(j/100)²/uh` for all
`0≤j≤200`. Thus the same maxima apply throughout each U interval, including
the radial tail. Its two corner signs cover four corners by simultaneous
sign reversal. In the Stein square completion, use `uh²` rather than the
endpoint `u²` in the content matrix. Since the completion is pointwise,
it also holds for a measurable choice of maximizing corner. Separate
endpoint duals can therefore bound the same fixed `V*(Q)`.

## P: interpolation and χ

For fixed Q set `F(u)=V*(Q)+(1/5)(E h(uU)−B(u))`. The inherited signs
`−3≤h''≤0`, `B''≤0` imply `F''(u)≥−(3/5)(2+χ)`. Consequently,

    F(u) ≤ max(F(ul),F(uh)) + (3/40)(2+χ)(uh−ul)².

At either endpoint, the exact verifier proves a bound for `F(endpoint)`
by global rational Stein dual inequalities and a cubic moment majorant.
Its `P3≥0` makes that majorant convex in χ, so checking the two endpoints
of the stated χ interval proves the budget throughout it. Comparing the
smaller endpoint budget margin with the interpolation loss at the largest
χ proves `F(u)≤η` everywhere in the stated rectangle. Since `C²≤V*`,
this proves the stronger signed-deficit inequality and hence the requested
`D+` inequality, without assuming D nonnegative.

## First accepted slab — C

For `[ul,uh]=[1/100,21/2000]` and `χ∈[32,42]`, the exact checker
`certify_slab_010_0105.py` verifies the common-envelope global dual at
both endpoints, including the entire tail, and the four outward-rounded
endpoint budgets. Their minimum exceeds `33/40000000`, the exact worst
interpolation loss. The strict remaining margin is recorded in
`certify_slab_010_0105.log` and the full replay log. This is an author-only
partial certificate, not a full-domain theorem. The preceding numerical
SDP searches are proposal generators and not acceptance criteria.

## Second accepted slab — C

The same construction on `[21/2000,11/1000] × [28,42]` is checked by
`certify_slab_0105_011.py`. It uses endpoint duals for the same radial
majorant, and its four exact/outward endpoint margins all exceed the
worst interpolation loss `33/40000000`. Its union with the previous
certificates extends the all-χ prefix to `11/1000`. The full requested
domain is still not covered.

## Third accepted slab — C

`certify_slab_011_012.py` proves `[11/1000,3/250] × [23,42]` with
interpolation loss `33/10000000`. Its tightest remaining margin, at the
lower energy and χ=42, is the positive rational printed in its log (about
`9.88·10⁻⁷`). The lower-energy candidate passes the global half-line
polynomial check without extra constant slack; the upper endpoint needs the
separately checked slack `1/50000`. This slab and the earlier cover extend
the all-χ prefix to `3/250`.

An initial proposal optimized at χ=32.5 passed the lower-energy global
polynomial check but its χ=42 budget was negative, about `−8.05·10⁻⁷`
with slack `1/50000`, even before interpolation. This rejects that dual,
not the theorem. A new proposal optimized at χ=37 and certified without
that slack succeeds as above. Saved search outputs are N; the rejection
and final acceptance use outward rounding and exact arithmetic.

## Failed wider proposal — C for that candidate, N for the search

For the attempted slab `[3/250,13/1000] × [19,42]`, the proposal
optimized at χ=37 passes the lower-endpoint global half-line polynomial
check but misses its χ=42 budget by approximately `4.056·10⁻⁶`. A second
proposal optimized directly at χ=42 also passes that global check and
misses the same budget by approximately `4.018·10⁻⁶`, even with no extra
constant slack; the slab's interpolation allowance would be another
`3.3·10⁻⁶`. These are outward-rounded rejections of these particular
proposals, not a proof of impossibility. The corresponding sampled solver
objectives are N. `certify_slab_012_013.py` deliberately exits with a
budget failure for the saved χ=42 candidate and is not part of the PASS
replay; `certify_slab_012_013_42_draft.log` records the result. Narrower
slabs or a sharper common envelope remain possible routes.

## Fourth accepted slab — C

Halving the failed proposal's energy width gives the accepted rectangle
`[3/250,1/80] × [20,42]`. `certify_slab_012_0125.py` checks both endpoint
duals and its exact interpolation loss is `33/40000000`; the smallest
remaining rational margin is recorded in its log. The exact union with
all earlier certificates has the full χ range through `u=1/80`.
