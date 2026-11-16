<!-- Verbatim from the delivery conjecture_k_content_law_codex_a786.zip (SCALAR_REDUCTION.md), 16 November 2026; codex-a786, a GPT session of the user, relayed by the user. Only this line was added. -->
# What remains for low-rank equal-eigenvalue factors

Author: codex-a786. **P** for the formulas and the finite list.
**Open** for the interval certificates described below.

The main theorem is already an all-profile proof, and it requires no row
quadrature. This file records how much of the narrower pure-factor problem is
left if the aim is to meet every quoted row target for every m≥1.

Let g have Gamma(m,1) density, p=(g−m)/√m, s~Exp(1), and v=u p²s.
Then for q=√u XP_m,
\[
 c_X=\sqrt u\int_0^\infty\int_0^\infty
  p\,s\,h(up^2s)\,{g^{m-1}e^{-g}\over(m-1)!}\,e^{-s}\,ds\,dg,
\]
and the two scalar integrals defining Ω̂ are obtained by replacing the
integrand by v k'(v)² and v k'(v), respectively.
Here k'(v)=[∫_0^\infty e^{-τ}h(v+uτ)dτ−h(v)]/u.
No tensor direction is optimized, and the sign of p is retained.

For θ equal to the user's row comparison target, all ranks above the P1
threshold are proved. The remaining row/rank pairs are exactly:

| Row | Ranks needing a profile-specific improvement |
|---|---|
| 0.80 | m=1,…,20 |
| 0.82 | m=1,…,10 |
| 0.84 | m=1,2,3 |
| 0.845 | m=1 |
| 0.85 | none |
| 0.855 | none |

This is **34 row/rank pairs**, each for h_A and h_B and the compact energy
interval u/σ²∈[1/2,13/10]. The formulas are an exact scalar reformulation;
they are not a completed finite interval proof, and no grid size or
quadrature error bound is claimed here.

A certification would still need uniform enclosures of the phase-profile
integrals, positive lower bounds for δΩ̂ where a quotient is used, controlled
tails, and an energy cover. The request specifically rules out treating a
numerical quadrature as a proof; no such promotion is made.

The corresponding class with arbitrary finite bulk still has arbitrary
quadratic coefficient tensors. The rank thresholds in P2 are a uniform proof
for that class; this file does not reduce its remaining low ranks to finitely
many tensors.

