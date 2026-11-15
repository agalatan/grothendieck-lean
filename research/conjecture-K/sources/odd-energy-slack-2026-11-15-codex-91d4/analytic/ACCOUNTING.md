<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-energy-slack-2026-11-15/analytic/ACCOUNTING.md, 2026-11-15 12:00; Agent-ID: codex-91d4. -->
# Energy slack: exact accounting before choosing an odd target

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only** for the algebraic implications below. The scalar
benchmark evaluations are **N** and are not interval certificates.

## 1. The deficit has already been spent

Write

```
F(u)=B(u)−pu,        σ(u)=S−F(u),
D(q)=F(u)−Λ(q),      D₊=max(D,0),   D₋=max(−D,0),
Δ(E,O)=Λhat(E+O)−Λhat(E).
```

The reviewed conditional joint assembly 7.4.10, assuming its pointwise
premise (P), gives

```
Λhat(E) < Λ(q)+D₊+η_AB,
η_AB=49/10⁶.                                         (1)
```

Unlike the A-only lemma, this leaves no positive fraction of `D₊`.
Substituting `Λ(q)=F(u)−D` gives the exact energy-dependent statement

```
Λhat(E) < F(u)+D₋+η_AB.                              (2)
```

For `D≥0`, this is `F(u)+η_AB`. For `D<0`, the additional term is
`−D`. The currently established remote theorem is the global cap
`Λ(q)<S+ε_R`, `ε_R=36/10⁸`; it does not say
`Λ(q)≤F(u)+ε_R`. Therefore

```
D₋ < σ(u)+ε_R          when D<0,                     (3)
```

and the old argument gives the uniform bound
`Λhat(E)<S+η_AB+ε_R=S+49.36·10⁻⁶`. It does not give that same allowance
above `F(u)` at every energy. The statement “D<0 is no worse” requires
an additional energy-relative theorem which is not supplied by 7.4.10.
This agrees with master STATUS 3.3 and item 87 and with the source
`JOINT_TARGET.md`'s separate D<0 branch.

## 2. What O_sigma alone proves

If the proposed target is `Δ≤σ(u)+η_odd`, then (2) implies

```
Λhat(E+O) < S+η_AB+η_odd+D₋.                         (4)
```

At `η_odd=50·10⁻⁶`, the D≥0 branch is below `S+99·10⁻⁶`.
The D<0 branch additionally needs `D₋≤10⁻⁶`, or a compensating
improvement elsewhere. Using only (3), it is sufficient that
`σ(u)≤.64·10⁻⁶`. Numerical Rice integration puts that narrow energy
interval near `[.03959373785,.04109732388]`; this interval is **N**,
not a certified continuum cut.

The low-energy witnesses have large energy slack, so their known
positive increments do not violate O_sigma. That observation does
not supply the missing D<0 implication at other cores.

## 3. Corrected statements that assemble without this gap

A sufficient signed correction is

```
Δ(E,O) ≤ σ(u)−D₋(q)+η_odd.                           (5)
```

Its right side is `σ+η_odd` when D≥0 and
`S−Λ(q)+η_odd` when D<0. Equation (2) then gives

```
Λhat(E+O) < S+η_AB+η_odd.                             (6)
```

The numerical quantity to track is consequently

```
R_corrected = Δ−σ+D₋,
```

as well as the requested `R_sigma=Δ−σ` and the direct absolute residual
`R_absolute=Λhat(E+O)−S`. These are different tests. Exactly,

```
R_absolute = R_sigma +[Λhat(E)−F(u)].                  (7)
```

A structured core can have a substantial negative bracket, so failure
of the relative target need not threaten the absolute bound.
With `η_odd=50·10⁻⁶`, (6) leaves `1·10⁻⁶` reserve; retaining the old
remote error as an unused bookkeeping reserve still leaves `.64·10⁻⁶`.

Alternatively, prove an energy-relative remote upper envelope
`D₋≤ε_rel(u)` and replace the extra term in (4) accordingly. The current
global envelope is only `ε_rel(u)=σ(u)+ε_R`; a stronger one would require
a new extraction/check of the Stein or moment bounds. No such premise
is assumed here.

## 4. If a fraction of D_plus is needed

Suppose a future odd theorem needs

```
Δ≤σ+θD₊−D₋+η_odd,       θ≥0.
```

Then its matching even theorem must be rerun as

```
Λhat(E)<Λ(q)+(1−θ)D₊+η_AB(θ).
```

Together they give the clean total `S+η_AB(θ)+η_odd`. The existing
7.4.10 does not authorize any `θ>0`. Its scalar completion would replace
`−(C²−η_A)/γ` by `−(1−θ)(C²−η_A)/γ`, with the same content parameters
`γ=.3`, `η_A=6·10⁻⁶`; the resulting larger scalar maximum needs a new
certificate owned/coordinated by codex-a7c4.

Even after reserving θD₊, the D<0 correction remains necessary. Reserving
a positive deficit fraction does not fix a negative-deficit branch.

## 5. Provisional route comparison

Before Phase-0 optimizations finish, the logically complete options are:

* Prove the corrected relative target (5), measuring both retained
  functionals with the full remote reoptimization.
* Prove O_sigma and add a separately certified energy-relative control
  of D₋, with the full resulting allowance charged.
* Prove the direct absolute retained bound. It can use the actual
  baseline slack and avoids this relative accounting gap.
* Use the actual-response raw row with #433's full discarded-square
  penalty, or the retained row with only an explicitly unspent penalty.
  These are consumer routes, not silent changes to Λhat or its domain;
  see `RESPONSE_PENALTY_MAP.md`.

The Phase-0 data must decide feasibility. None of these alternatives
is proved here, and the compact A/B premise (P) remains separate.
