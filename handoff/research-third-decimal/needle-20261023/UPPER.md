# A smaller upper endpoint from the existing Hardy hypothesis

The same numerical premises as the current concrete upper theorem imply

\[
K_G^{\mathbb C}\le
\frac{500000000000000000}{355973579786182891}
=1.4045986230223243446\ldots <1.404598623023.
\]

This is a strict improvement of approximately `1.23486736e-8` over the previous exact endpoint
`500000000000000000 / 355973576656604491`. It does not discharge the three remaining numerical
premises or change the rounding. It reuses information already present in them.

The proof is integrated into the canonical `Grothe/Upper/Residual.lean` and
`Grothe/Upper/PolynomialBridge.lean`. `Grothe.fresh_upper` takes exactly the existing
`Upper.DirectHyps E EX`, without another premise. The result constants in `Structural.lean`,
`Rounder.lean`, and `PhiBound.lean` are updated, so `fresh_upper_rounder` gives the improved
endpoint under precisely the same three numerical hypotheses. `Upper/Data.lean` changes only
its explanatory endpoint comment; its numerical declarations are unchanged. An ignored
`HardyBudget.standalone.lean` preserves the initial proof for reference and is not imported.

## Why the previous tail estimate loses budget

Write `h n = kernelCoeff E n` and `r = 4149/4000`. The existing Hardy premise is

\[
\sum_{n<J} h_n^2 r^{2(2n+1)}\le \frac74\qquad (J\in\mathbb N).
\]

The old tail calculation applies Cauchy--Schwarz with the full budget `7/4`, even though the
linear coefficient already consumes a substantial fraction of it. The existing comparison and
head hypotheses give

\[
\sum_{n=0}^{250}|h_n-s\mathbf1_{n=0}|\le H,
\quad
s=\frac{1779870886481}{2500000000000},
\quad
H=\frac{582265595509}{500000000000000000}.
\]

In particular,

\[
h_0\ge L:=s-H
=\frac{355973595030604491}{500000000000000000}>0.
\]

Consequently the linear term uses at least

\[
r^2L^2=0.5453338392843296526058120419633\ldots,
\]

leaving only

\[
B_*:=\frac74-r^2L^2
=1.2046661607156703473941879580367\ldots
\]

for the remaining weighted coefficient squares. This deduction needs neither the value of the
true `h 0` nor a new source certificate.

## Reusable lemma and exact numerical gate

The generic lemma `Grothe.hardy_budget_after_linear` proves that if `0 < r`, `0 ≤ L ≤ h 0`, and
the original finite-prefix square bound holds, then

\[
\sum_{n<J}h_{n+1}^2r^{2(2n+1)}
\le \frac{B-r^2L^2}{r^4}.
\]

Apply the existing `Grothe.hardy_tail` to this shifted sequence with `K = 250`. Its infinite tail
is the original `n ≥ 251` tail. The unrounded Cauchy--Schwarz value is

\[
\sqrt{\frac{B_*r^{-1006}}{1-r^{-4}}}
=3.0488843168031588253\ldots\times10^{-8}.
\]

The proof uses the upward rational cap

\[
T_*:=\frac{19055527}{625000000000000}=3.04888432\times10^{-8},
\]

instead of `tailQ = 3.6748e-8`. After exact rational simplification, the numerical gate is the
integer inequality

```text
120466616071567034739418795803669547412017975 * 4000^1002
  ≤ 14643885483565936271617911329 * 4149^1002.
```

Lean proves this with `decide +kernel`, rather than introducing a native evaluation axiom.
The resulting residual is

\[
H+T_*=\frac{597510017109}{500000000000000000}
=1.195020034218\times10^{-6}.
\]

The existing transfer theorem then gives the stated endpoint. Separate `norm_num` theorems
prove the advertised decimal and strict improvement over the old rational endpoint.

## Verification and conditional status

The initial standalone module compiled successfully with Lean `4.34.1` on `ssh yo`, at
`nice 19`, using the matching upstream `PolynomialBridge` and `Residual` build cache. All six
changed canonical modules compiled successfully with warnings treated as errors, using an
owned tmpfs overlay ahead of the matching project cache. Four required unchanged dependencies
(`Energy2`, `Kernel2`, `Realise2`, `PhiCover`) also compiled successfully. The source-manifest
audit of the 139-module project dependency closure found exactly the six intended source
differences against the cached checkout; no other dependency source differed. The final
concrete wrapper completed at `2026-10-23 04:13:43 UTC`. The audit of the generic
budget lemma and exact numerical gate reports only `propext`, `Classical.choice`, and
`Quot.sound`. The table-level endpoint theorem additionally depends on the existing
`Grothe.head_check._native.native_decide.ax_1_1`, exactly as the previous upper assembly does.
The concrete `fresh_upper_rounder` also uses the existing
`Grothe.UpperChaos.phi_cover_check._native.native_decide.ax_1_1`, again unchanged. The sharper
`tail_le` now reuses the existing head check because it depends on the linear lower bound.
No theorem introduces a new native axiom or `sorry`. The complete axiom and wrapper-type
output is preserved in `UPPER_AXIOMS.txt`; `UPPER_BUILD.json` records source hashes and the
validation scope.

The same three numerical obligations remain for the concrete smoothed rounding:

1. Its energy table is within `compareQ = 1065637497/10^15` of the truncation table in `ℓ¹`.
2. The truncation table's finite head is within `energyErrQ = 6847009/(5·10^17)` of the stored
   table.
3. Its weighted square prefixes at radius `4149/4000` are bounded by `7/4`.

The structural rounding and summability fields are already supplied by the concrete upper
interface. This refinement strengthens only the conclusion of that interface, once those same
three numerical premises are supplied.

## Comparison reoptimization is a separate task

The older `reassessment-20261023/upper/ImprovedComparison.lean` endpoint
`40000000000000000 / 28477888065186929 ≈ 1.40459854004758` assumes the stronger comparison
`1017321032757/10^18`. Its smaller number must not be presented as a consequence of the current
comparison premise. `comparison-result.json` contains useful finite optimization output, but
that stronger premise still needs an analytic source enclosure.

The original joint-prefix, Taylor-correction, and contour source inputs referenced by that
reassessment are not present in this safe checkout. Regenerating or restoring those inputs is
the next prerequisite for an honest new comparison optimization. The Hardy refinement above
does not depend on them and is ready for integration now.
