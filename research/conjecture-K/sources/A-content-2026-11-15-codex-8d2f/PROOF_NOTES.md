<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-A-content-tightening-2026-11-15/PROOF_NOTES.md, 2026-11-15 10:19; Agent-ID: codex-8d2f. -->
# Proof notes and trust boundary

Agent-ID: **codex-8d2f**. Labels: P = written argument, C = exact or outward
certificate, N = numerical only. No fresh all-cubic target is certified.

## Centered content and its direct budget — P, author only

For the peak row and `s=3/5`, rotational symmetry supplies a real radial
function `h_A` such that the remote A first-variation field at `w` is
`w h_A(|w|²)`. Write `Π₁` for orthogonal projection onto remote
holomorphic first chaos. The remote cubic is orthogonal to that space, so
for any real `k`,

    C² = ||Π₁[q(h_A(|q|²)−k)]||²
       ≤ E[|q|²(h_A(|q|²)−k)²] = V_k.

Only projection contraction and `Π₁q=0` are used. The result holds for all
finite remote dimensions and any energy. A constant can be subtracted
from `h_A` without changing the claim; the numerical code subtracts the
linear coefficient at zero and optimizes `k` for that shifted profile.

For nonzero `u`, set `U=|q|²/u`, `F=E h(uU)=Λ(q)+pu` and let
`h(v)=2E_Z|L+sqrt(v)|`. Then `D=B(u)−F` and

    V_k = u E[U(h_A(uU)−k)²].

Thus, if the signed inequality `V_k+γF≤γB+η` holds for each admissible law
in a cell, then `C²≤γD+η≤γD₊+η` for γ≥0. If `H(u,χ)` is another valid
content upper bound and `α∈[0,1]`, also

    C² ≤ α H(u,χ)+(1−α)V_k.

This remains true for cell-specific choices of α and k. Its use together
with a spectral dual requires a *single* valid majorant of the combined
profile on the entire positive half-line and a cell-cover argument. The
numerical search makes neither acceptance check.

## Finite cubic tests — P for definitions; N for computed profiles

Let independent standard complex Gaussians `X_j,Y_j` define

    Qsplit = (Σ_(j=1)^4 X_j² conjugate(Y_j))/sqrt(8).

This is a remote `(2,1)` Wick cubic in eight complex variables with
`E|Qsplit|²=1` and `χ=5/2`: each normalized
summand has fourth moment 12, and the fourth cumulants add with weights
`1/4`. Invariance under `X_j→e^{it}X_j, Y_j→e^{2it}Y_j` fixes Qsplit
and forces all its first-chaos content coefficients to zero.

The second example is

    Qwick = Σ_j sqrt(w_j) Z_j(|Z_j|²−2)/sqrt(2),
    w=(2/5,1/5,1/5,1/5).

It has energy 1 and `χ=42 Σw_j²=294/25=11.76` by independence and
circularity. The computed deficit and profiles use numerical quadrature,
spline interpolation, and scrambled Sobol integration; no error bars are
proved. The actual energy is exact despite the sampled energy fluctuating.

## Explicit radial relaxation witness — C for moments, N for budget

For `χ=3`, consider `U` supported on `7/8,20,90` with respective weights

    36160/36363, 19/3570, 13/49910.

Exact rational arithmetic gives `EU=1`, `EU²=5`, `EU³=1865/8`. The
inherited cubic sixth-moment cap is
`EU³≤6+9χ+(4045313/100000)χ^(3/2)`. Since `3 sqrt(3)>5`, the stronger
rational comparison `1865/8 < 33+5·4045313/100000` proves the stated
moment cap for this law. It is a probability distribution, not a proposed
remote cubic, and no Stein identity is checked for it. Both the minimum
`V_k` for this law and its deficit are evaluated only numerically.

## Sampled spectral experiment — N

The existing sampled SOCP bounds a profile by a cubic plus a spectral
Stein cut. We add `(1−α) v(h_A(v)−k)²/γ` to its supplied profile, and add
`α H` to the reported signed budget. The radial profile addition is
interpolated numerically. Only finitely many half-line constraints are
enforced and solver output is not rounded into a globally valid dual.
The base profile caps are historical inputs, not freshly certified here.
The 3×3 mixing grid and local Nelder–Mead search are not global searches.
This is a candidate search for a possible certificate, not a certificate.

## Exact fixed-pool diagnostic — C with inherited inputs

The verifier reads the saved 119 accepted models and stored benchmark
balls, checks input hashes, encloses each `sqrt(χ)` by rational endpoints,
and evaluates every saved model at the two energy nodes. It checks which
of the four inherited upper envelopes is smallest and proves the stated
lower thresholds on the coefficient needed by those *particular* bounds.
It does not replay the analytic proof, profile integrals or acceptance of
the saved models. The result cannot bound the true content from below or
the true deficit from above.
