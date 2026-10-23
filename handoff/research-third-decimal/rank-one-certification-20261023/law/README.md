# Exact rank-one law interface and first closed tau intervals

23 October 2026. This directory contains new finite law certificates. No
existing cover, source table, global endpoint, or Lean fact is changed.

The strongest completed result is a strict improvement of the **pure row 15**
interpolated law bound on the closed rectangle

- `7810930603720704/38058222370430125 <= tau <= 8022036836253696/38058222370430125`,
  approximately `[0.205236348868, 0.210783277216]`;
- `0 <= x <= 31/256`.

It has two pieces, joined at
`tau=7951668092076032/38058222370430125`, approximately `0.208934301100`.
The first saves at least `4/5000000 = 8e-7`; the second saves at least
`9/20000000 = 4.5e-7`. These compare the new bounds with the corresponding old
pure-row endpoint chords, after paying the exact semiconvex tau allowance.
They do **not** claim an improvement of the mixed box 8150 or the row-cap box
8168. The exact minima are in the two localized tau-bridge ledgers.

The proofs still inherit source Gaussian bounds where their source records
have not individually been replayed. The newly replayed localized nine-piece
caps enter through `analytic/source-nodes-m15-localized.json`; the other source
nodes retain their declared inherited status. The response-extraction / Young
rank-one reduction and the paper semiconvex theorem are mathematical premises,
not Lean claims made by these files.

## What is checked

`tools/rankone_law.py` uses only Python's standard library and exact `Fraction`
arithmetic. It rejects `-O` and `-OO`. It provides:

1. Rational lower convex hulls of `(r,G+A*r^2)`, with the quadratic correction
   removed on each hull edge and a separately specified affine tail.
2. Piecewise quadratic sources in the physical coordinate `r=tau*sqrt(U)`.
3. Exact reconstruction of inherited Stein bank cut polynomials and the newer
   spectral / tensor-budget polynomials.
4. Whole-half-line verification of
   `P(v) - min(old_source,new_source)(tau*v) - G(v^2) >= 0`.
   Every rational interval is covered by Bernstein certificates; the final
   interval is certified by nonnegative Taylor coefficients at its start.
   Choosing either source bound on a leaf is sufficient. The tests need no
   approximate roots of quadratic source intersections.
5. Exact moment evaluation and an exact rational *negative witness* showing
   that each displayed improved polynomial fails with the original source and
   the same old cuts. Bernstein non-acceptance alone is not used as that
   evidence.
6. Endpoint-profile interpolation with `A=c^2/d`, checked from the same bank
   geometry at both endpoints. The saving is minimized as an exact quadratic
   in tau, including its possible interior vertex.

A source quadratic contributes only degrees zero, one and two after
`r=tau*v`. Clearing the existing Stein denominator multiplies this difference
by `v^4`; the maximal polynomial degree stays **10**, as in the old checker.
The compatibility replay of real node `b3-232.json` verifies 880 rational
intervals, 933 Bernstein leaves, and degree 10 against the unchanged inherited
source tables.

## PAD accounting and the zero phase

The inherited source tables are raw: their analytic statement is
`Psi <= raw_table + PAD`, where `PAD=1e-11`. The old row evaluator adds that
same PAD once.

For direct bank selections, the valid statement is

`selected F <= min(raw_old,bank_cap) + PAD`.

This retains one existing external PAD. It does not claim that raw old caps
bound Psi without their allowance. Source selection uses the zero test on the
entire first source cell and on the final affine tail, so an atom at `U=0`
does not require an undefined radial phase or a nonzero test at zero.

The explicit localized node tables store **effective** caps. The node-table
adapter instead applies the semiconvex theorem to `H=F-PAD`: its node caps are
`effective_cap-PAD`, and the single external PAD is restored after law
integration. This is an exact accounting identity, not a claim that
`F <= effective_cap-PAD`. Every endpoint's original scalar test is retained,
and the final tail has test zero.

## Completed real node certificates

The strongest localized selection has 996 explicit source nodes, 920 lifted
hull nodes/cells, and all source proof references pinned by hashes.

Three inherited pure-row Stein nodes have new exact moment polynomials with
all old cut coefficients unchanged:

- `(row=15, xcell=0, node=5)`, tau approximately `0.205236348868`;
- `(row=15, xcell=1, node=5)`, tau approximately `0.208934301100`;
- `(row=15, xcell=0, node=6)`, tau approximately `0.210783277216`.

Each whole-half-line replay checks 990 rational intervals, at most 1006
Bernstein leaves, and maximal degree 10. A floating LP proposed the five
moment coefficients. Upward rational rounding and the exact whole-half-line
check alone determine acceptance. The saved JSON node files can be verified
without SciPy or rerunning the LP.

The first, simpler source bank also supplies a genuine exact constant
`1e-6` decrement at node `(15,0,5)` with unchanged cuts. The new source is
essential: with that same decremented polynomial and the original source,
`v=595/888` has exact negative gap approximately `-1.01523206e-7`.
That certificate remains useful as a small independent fixture.

## Why the moment-only shortcut was not sufficient

A separate implementation checks a gain minorant

`max(0,old_source-new_source) >= a0+a1*r+a2*r^2+a4*r^4+a6*r^6`,

with `a1,a6 <= 0`. The moment assumptions give an exact lower expectation;
negative coefficients use the upper bounds on `E sqrt(U)` and `E U^3`.
For nonnegative x the resulting cubic's minimum is at an x endpoint, and tau
is covered with rational Bernstein bounds.

For the initial unlocalized row-14 and row-15 source banks on
`tau in [.2,.21]`, `x <= 31/256`, the attempted LP found no positive saving;
its saved checked minorant is merely `-1e-12`. The source-cap gains have holes
where a weaker moment relaxation can concentrate mass. This is **not** a
proof of optimality of that relaxation or an obstruction to the rank-one
attack. Retaining the inherited Stein cuts produced the positive real node
and interval certificates above.

The synthetic self-test proves the complete gain route algebraically for
`Psi(r;f)=|r-f|`, `d=1`, `c=-1/2`. It checks a uniform gain `97/20000` and a
sharp nonzero semiconvex interpolation-cost fixture. It is a test of the
interface, not evidence for any numerical Grothendieck improvement.

## Relation to the actual bottlenecks

The local repository has Step 22 data. The manuscript describes Steps 24 and
25 on a droplet `~/p24`; their scripts/data are not in the local attack
folder, so this work does not report an independent replay of those steps.

The current box 8150 has weights `row12=0.133952501`,
`row15=0.866047499`, tau approximately `[.205371,.209174]`, and
`x <= 31/256`. Its references are inherited pure-row Stein nodes, not new
spectral/tensor-budget nodes. The new pure-row15 intervals cover that tau/x
rectangle, but **their saving cannot simply be multiplied by row15's weight**.
The common completion changes the law-linear coefficient from pure `c15` to
`c_box,15`. Either the corrected source term
`2*(c_box,15-c15)*r*f` must be included or a sound common-row test must be
constructed before certifying the actual mixture box.

Box 8168 is the pure row-15 cap envelope, covers all
`tau in [0,rho]`, `x in [0,31/4]`, and can improve only after a complete row cap
cover or a replacement cover. The interval certificates here do not discharge
that obligation. An individual endpoint, or even the whole low-x interval,
is insufficient for it.

## Replay

Run from the repository root. All existing certificate files remain untouched.
Each saved-node or tau-bridge replay takes seconds on one worker.

```sh
python3 -I tools/rankone_law.py --self-test
python3 -I tools/rankone_law.py --inherited-dir handoff/lower-stein/cert-jointmoment-lifted-codex --node b3-232.json
python3 -I tools/rankone_law.py --reused-stein handoff/research-third-decimal/rank-one-certification-20261023/law/m15-localized-c0n5.json
python3 -I tools/rankone_law.py --reused-stein handoff/research-third-decimal/rank-one-certification-20261023/law/m15-localized-c1n5.json
python3 -I tools/rankone_law.py --reused-stein handoff/research-third-decimal/rank-one-certification-20261023/law/m15-localized-c0n6.json
python3 -I tools/rankone_law.py --tau-bridge handoff/research-third-decimal/rank-one-certification-20261023/law/m15-localized-tau-bridge-a.json
python3 -I tools/rankone_law.py --tau-bridge handoff/research-third-decimal/rank-one-certification-20261023/law/m15-localized-tau-bridge-b.json
```

`rankone_law_nodes.py` rebuilds the lifted source selection from the explicit
node table. `rankone_law_gain.py` rebuilds the simple rational-cell selection
and attempts a moment-only gain minorant. `rankone_law_reoptimize.py` repeats
the bounded LP proposal and its exact acceptance for one inherited Stein
node; SciPy/Numpy are needed only for those proposal tools.

## Coefficient-corrected input for the actual box 8150

Root's `tools/rankone_reprice_mixture.py` supplies the active-row15 coefficient
`c' = v15_0-hbar^T*Cbar^-1*v15_R`, approximately `0.180321885313`.
Its exact repricing adds `2*(c'-c15)*r*f` while keeping the old explicit
profiles, and supplies a new bank and effective node table. The generalized
mixture Young/L10/L21 proof is separately audited by the source/reduction
work; these law files do not silently replace that coefficient by pure c15.

The exact law adapter and optimizer have also run on **those corrected inputs**:

- `m15-box8150-selection.json`, 996 explicit source nodes, 919 lifted hull
  nodes/cells;
- `m15-box8150-c0n5.json`, `m15-box8150-c1n5.json`,
  `m15-box8150-c0n6.json`, all with unchanged old cut banks and new moment
  polynomials;
- `m15-box8150-tau-bridge-a.json` and `m15-box8150-tau-bridge-b.json`.

Each corrected node checks 987 rational intervals and at most 1002 Bernstein
leaves, with polynomial degree 10. The bridge uses the repriced `A'=c'^2/d15`,
not pure-row A. This certifies the active row component on the same closed
low-x tau interval. The actual mixed box evaluator must still multiply the
active-row scalar terms and its semiconvex allowance by `lambda15`, preserve
row12's old contribution and the pinned common gate price, and reconstruct
the complete box maximum. That evaluator is separate from this law layer.

To replay a corrected saved node or interval, substitute its file above in
`--reused-stein` or `--tau-bridge`. No SciPy is required for saved certificate
replay. All source and repricing analytic premises retain their own explicit
proof status.
