<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-A-content-tightening-2026-11-15/CONTINUATION.md, 2026-11-15 13:00; Agent-ID: codex-8d2f. -->
# Gamma 1/5 continuation: certified prefix, partial cover and gaps

Agent-ID: **codex-8d2f**, 15 November 2026. Continuation baseline:
`7ec0d234bae387f6a5789346b8db7b20309216ca`. New analytic arguments are
**P, author only**; exact rational and outward-rounded checks are **C**;
sampled optimization is **N**. No new full-domain coefficient is claimed.
During the work, master advanced to `5b09134d797ccfc10d83f1543495f7a37e5b62b4`;
the research delta concerns the joint/odd-sector work and overview records,
not the hash-pinned tilted-content and Stein inputs used here.

All results concern the peak row and tilt `3/5`, every finite dimension,
every remote complex Wick cubic `q` of bidegree `(2,1)`,
`u=E|q|²`, `χ=E|q|⁴/u²−2` for `u>0`, and
`D=B(u)−pu−Λ(q)`. The inherited tensor theorem bounds `0≤χ≤42`.
The target throughout is

    ||c_(3/5)(q)||² ≤ (1/5) D₊(q) + 3/500000.            (1)

## Certified scope

**P+C, author only:** (1) holds for **all** `0≤u≤1/80` and every allowed χ.
The exact union of three independent moment covers proves the range through
`9/1000`:

* `[0,1/250]`, using the reviewed `2δ/25` content bound;
* `[1/250,3/400]`, using `58619δ/1080000` from the new W004 barrier;
* `[3/400,9/1000]`, using the sharper `481δ/10000` angular certificate.

The first accepted mid-energy boxes extend this full-χ prefix to `3/320`;
the new high-χ coupled rectangles extend it further to `1/100`; the common-envelope slab in
[SLAB_INTERPOLATION.md](SLAB_INTERPOLATION.md) extends it to `1/80`.
`gap_audit.py` verifies both extensions by an exact union in `(u,χ)`.
The partition checker includes `u=0`, uses `x=√χ∈[0,13/2]`, and
therefore covers χ up to `169/4>42`. It recomputes the Gaussian benchmark
and all Hermite moment caps using Arb, then accepts every box by exact
rational Bernstein coefficients. No `3δ^(3/2)` content branch is used.
The proof dependencies are the reviewed moment theorem, the benchmark
profile derivative signs and the explicitly checked content barriers.

**P+C, author only:** the coupled Stein dual in STEIN_COUPLING.md also
proves (1), even with the signed `D`, on each of these rectangles:

* `639/40000≤u≤2/125`, `12≤χ≤36`;
* `199/20000≤u≤1/100`, `30≤χ≤42`;
* `999/40000≤u≤1/40`, `4≤χ≤18`;
* `599/20000≤u≤3/100`, `4≤χ≤12`;
* `37/800≤u≤463/10000`, `3/2≤χ≤9/4`;
* `4629/100000≤u≤463/10000`, `6/5≤χ≤17/4`.

Each uses one rational global half-line dual at the upper energy endpoint,
exact endpoint comparisons in χ, and the energy-transfer argument of
STEIN_COUPLING.md. The 0.01, 0.016, 0.025 and 0.03 nodes use W009,
W016, W025 and the inherited W30, respectively. The accepted margins and transfer losses are in the replay
log. The coupling is not a use of the old pointwise δ envelope.

**C with inherited content inputs:** `legacy_cover_020.json` lists further
accepted rectangles on `[2/125,463/10000]×[0,42]` and an explicit list of
uncovered rectangles. The verifier recomputes the base and extended
profile caps, checks all 119 original spectral duals on the half-line,
recomputes every benchmark and checks the new budgets. It uses the reviewed
energy-dependent content bounds, strengthened where the fresh W016/W025
angular bounds improve them. It excludes the partly unreviewed
`3δ^(3/2)` branch. The original curvature allowance was derived for
coefficient `3/10`; retaining it at `1/5` is conservative. Both accepted
and uncovered intervals are included in an exact partition check.

`moment_020_mid_witness.json` similarly records accepted **and** uncovered
boxes in `[9/1000,2/125]×[0,42]`; its second coordinate is `x=√χ`.
The saved boxes, rather than an unverified picture, specify those partial
claims. Uncovered boxes are not counterexamples. The exact union of these
pieces does **not** cover the full target domain, and the
listed legacy and mid-energy gaps are not automatically filled by the
small coupled rectangles. `gap_audit.json` records the remaining gaps after
their exact union with the prefix and all coupled rectangles.
The first unresolved box begins at `u=1/80`: its conservative χ interval
is `[20449/1024,42]` on `[1/80,51/4000]`. The file lists the rest with
exact rational endpoints; inclusion in a gap is not evidence of failure.
The current union has 187 accepted rectangles and 40 conservative gap
rectangles. The gap count can rise when an added certificate subdivides an
energy strip; it does not mean that previously covered points were lost.

## New scalar barriers and angular coefficients — P+C, author only

The five rational Hermite witnesses in this folder bound the odd scalar
resolvent `|k_u(x)|` by nonnegative `W(|x|)` for their stated energy ranges.
They extend by the constant `9/25` for `|x|≥1`. Their cap, lower energy
endpoint, both differential residuals, compact source interpolation,
outer source and infinite tails are rechecked by `verify_barrier_004.py`.
The smallest outward residual in the fresh replay exceeds `1.93·10⁻⁵`.

| Witness | Energy lower endpoint | Supremum cap | Certified `C²/δ` coefficient |
|---|---:|---:|---:|
| W004 | `1/250` | `73/100` | `58619/1080000` (coarse angular bound) |
| W0075 | `3/400` | `71/100` | `481/10000` |
| W009 | `9/1000` | `71/100` | `472/10000` |
| W016 | `2/125` | `17/25` | `435/10000` |
| W025 | `1/40` | `13/20` | `393/10000` |

The W004 coefficient is `(11/108)(73/100)²`. The remaining four use the
existing one-switch angular reduction, exact outward serialization,
400 radial intervals, 4096 angular intervals and the entire tail. The
adapted C++ checker differs from the reviewed checker only in permitting
cap `71/100` and using the corresponding larger exact tail component
bounds `247/1000` and `33/200`. Its largest accepted compact upper bounds
are recorded in `angular_low.log`, `angular_009.log`, `angular_016.log`
and `angular_025.log`. Numerical LP produced the Hermite coefficients;
no optimizer output is accepted without the differential and angular
checks.

## Coupled transfer constants — P+C

At `u₀=1/40` and `4≤χ≤18`, the W025 angular bound gives
`C(u₀)<1/40`. For `Δ=u₀−u≤1/40000`, the content change is at most
`(4/3)Δ` and `|D'|≤3u₀·22`. The exact loss is

    (1/15)Δ+(16/9)Δ²+(1/5)·3u₀·22Δ.

The complete half-line dual and both χ endpoint budgets are accepted by
`certify_stein_025.py`. A proposal with χ up to 22 failed the exact endpoint
budget; only the displayed χ interval is claimed. The numerical search used
a `0.02` matrix regularization after an earlier sampled proposal failed its
tail check. The regularization and sampled objective are not trusted by the
exact verifier.

At `u₀=1/100` and `30≤χ≤42`, the W009 angular bound gives
`C(u₀)<1/70`. For `Δ=u₀−u≤1/20000`, the content change is at most
`2Δ` and `|D'|≤3u₀·46`. The exact signed-budget loss is therefore

    (2/35)Δ+4Δ²+(1/5)·3u₀·46Δ.

`certify_stein_010.py` accepts the complete half-line dual at `u₀`, checks
both χ endpoints, and proves that its smallest margin exceeds this loss.

The node verifier at `u₀=3/100` uses a single dual for `4≤χ≤12`, with
`EU²≤14`; the endpoint content bound and curvature give `C(u₀)<1/10`.
The radial profile derivative gives a change at most `(11/10)Δ` in C for
`Δ=u₀−u`, while `|D'|≤3u₀·16`. The exact loss for
`Δ≤1/20000` is

    (11/50)Δ+(121/100)Δ²+(1/5)·3u₀·16Δ.

At `u₀=2/125`, the range `12≤χ≤36` gives `EU²≤38`, `C(u₀)<3/50`,
content change at most `(9/5)Δ` and `|D'|≤3u₀·40`. For
`Δ≤1/40000`, the loss is

    (27/125)Δ+(81/25)Δ²+(1/5)·3u₀·40Δ.

The endpoint margins dominate those losses by exact comparison. The wider
top-energy rectangle follows the same argument with `χ≤17/4` and
`Δ≤1/100000`. These are one-sided transfers downward from a certified
node, not interpolations between unrelated cubic laws.


## High-χ continuation through u=1/100 — P+C, author only

For every finite dimension and remote `(2,1)` cubic, the new duals prove
the signed γ=1/5 budget with η=3/500000 on the following closed rectangles:

- `[3/320,19/2000] × [40,42]`;
- `[19/2000,77/8000] × [37,42]`;
- `[77/8000,39/4000] × [37,42]`;
- `[39/4000,79/8000] × [37,42]`;
- `[79/8000,1/100] × [30,42]`.

The first four use W009 and one global Stein dual at each upper energy
endpoint. Numerical proposals are accepted only after exact PSD and
Bernstein checks on every finite half-line cell and the tail, and outward
rounded endpoint χ budgets. Each dual has nonnegative cubic moment
coefficient, hence its χ budget is convex and both endpoint checks suffice.
Using W009 gives `C(u₀)<7/500` for χ≤42 at the four nodes. With
`Δ=1/8000`, `|C(u)−C(u₀)|≤2Δ` and `|D'|≤3u₀·46`, the exact transfer
loss is `(7/125)Δ+4Δ²+(1/5)·3u₀·46Δ`. The last of these transfers has
the smallest margin, about `1.70·10⁻⁸`, positive by rational comparison.
The fifth rectangle uses the previously accepted node at `u₀=1/100`
with a reduced, still exactly checked constant slack; it has
`C(u₀)<1/70` and transfer loss `(2/35)Δ+4Δ²+(1/5)·3u₀·46Δ`.

At `u₀=1/50`, a W016-coupled dual proves the rectangle
`[499/25000,1/50] × [9,26]`. Its endpoint content bound gives
`C(u₀)<11/500`; `|C(u)−C(u₀)|≤(8/5)Δ` and `|D'|≤3u₀·30`.
For `Δ=1/25000`, the exact transfer loss is
`(176/2500)Δ+(64/25)Δ²+(1/5)·3u₀·30Δ`. A trial of the same
dual through χ=35 failed its outward-rounded budget and is not claimed.

At `u₀=11/400`, a W025-coupled dual proves the rectangle
`[1099/40000,11/400] × [6,18]`. Here `C(u₀)<3/125`,
`|C(u)−C(u₀)|≤(4/3)Δ` and `|D'|≤3u₀·22`. For `Δ=1/40000`,
the exact transfer loss is `(8/125)Δ+(16/9)Δ²+(1/5)·3u₀·22Δ`.
At χ=20 the node is accepted, but its margin does not pay for the
initially attempted transfer of `1/20000`; that rectangle is not claimed.

The exact union with the earlier certificates gives the complete χ range
`0≤χ≤42` for `0≤u≤1/80` after adding the slabs below. Above
`1/80`, the uncovered rectangles
in `gap_audit.json` remain unproved; the geometric list is conservative
and does not assert that every listed pair comes from a cubic.

## Wider energy slabs — P+C for four slabs

The one-sided Lipschitz transfers above produce narrow strips. The slab
route constructs one content majorant `V̄(Q)` valid simultaneously for
`u∈[u₋,u₊]` for each fixed normalized cubic law `Q`. It uses `u₊²`
and radial W-envelope maxima over every radius reached on the slab, with
exact splits at both endpoint sets of radial boundaries. Given this
u-independent majorant, write
`F(u)=V̄(Q)+(1/5)(E h(uU)−B(u))`. The inherited profile signs
`−3≤h''≤0`, `B''≤0` imply `F''≥−(3/5)(2+χ)` for that fixed law.
Thus linear interpolation between endpoint upper budgets incurs at most
`(3/40)(2+χ)(u₊−u₋)²`. The endpoint Stein duals may be different:
each must upper-bound the same `V̄(Q)` for the same normalized law.
The common majorant and endpoint budgets have now been constructed and
accepted for `[1/100,21/2000] × [32,42]`,
`[21/2000,11/1000] × [28,42]`, `[11/1000,3/250] × [23,42]`, and
`[3/250,1/80] × [20,42]`; see
[SLAB_INTERPOLATION.md](SLAB_INTERPOLATION.md). This closes the first
previously uncovered high-χ strips. Other slabs require their own checks.

## Numerical reconnaissance and the remaining work

**N:** Coupled searches using the freshly accepted W30/W35/W40/W44
envelopes gave negative sampled γ=1/5 budgets at the tested middle χ nodes
for energies `.03,.035,.04,.044` (`run_grid.log`). The W004 search also
passed its sampled nodes at `.005,.009,.016`, but failed at
`(u,χ)=(.025,22)`; replacing W004 by the sharper W025 changed the sampled
excess from about `+4.09·10⁻⁵` to `−5.52·10⁻⁵`. These are useful proposal
diagnostics, not continuum acceptance. A finer tail grid was essential:
the first `.03` candidate missed an interior tail failure of order
`4.86·10⁻³` in its proposed majorant; it was discarded and regenerated.

To finish (1), construct and accept enough coupled global duals and
energy/χ boxes to cover the recorded gaps, then run an exact union check
with the moment prefix. The test grid and individual rectangles here do
not discharge that obligation. No Lean theorem or full-range γ=1/5 result
is asserted.
