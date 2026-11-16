<!-- Verbatim from the delivery conjecture_k_content_law_codex_a786.zip (AUDIT.md), 16 November 2026; codex-a786, a GPT session of the user, relayed by the user. Only this line was added. -->
# Author audit

codex-a786 · 16 November 2026. This is an author check, not an independent review.

**P: checked analytically**

1. Ω̂ is used with exactly the factors 3/2 and 3/4 from the question.
   The inverse quadratic form is I+Π_const, not twice the identity.
2. The derivative of a standard complex Gaussian uses the convention E|X|²=1.
3. P_m is normalized: EP_m²=1, EP_m³=2/√m, EP_m⁴=3+6/m.
4. The sign-conditioned dual norm has coefficients 17, 24, 16.
   Its potentially signed cross term vanishes because EP_m=0.
5. The Gamma/reflection affinity is exp(−2r(m/2)), not exp(−r(m)).
   Consequently α_m²≤1−exp(−2/(3m))≤2/(3m).
6. The P2 bulk has a_W=0 and c_{2,W}=D. This uses disjoint holomorphic U and
   antiholomorphic Z coordinates. It is not true for a general cubic bulk.
7. Conditional Gaussian regression uses E[X|X|²]=M(|M|²+2s).
   The factor 2 is retained in H=bT+2(1−b).
8. δ_c+δ_b is the fourth cumulant of the actual same q; both terms are
   nonnegative, and the content estimates use the same Ω̂.
9. All bulk and Y content coordinates vanish by exact rotations; X remains
   and has nonzero content in the h(v)=v control.
10. The actual profiles satisfy |h(v)|≤C/√v; the extension across zero is
    proved using h(max(v,ε)) and dominated convergence.
11. The literal Γ_B in the question has charge −1; its real-axis radial
    restriction, hence h_B used in the inequality, is unchanged.
12. The 1/m rate cannot be improved for a theorem uniform in h on P1:
    h(v)=v gives 16/[3(m+3)], while the upper bound is 77/[9(m+3)].
    The ratio of these constants is 77/48.
13. Constants do not require the row decimals or an energy approximation.
    The only check on b_A for admissibility is 1+b_A≠0, verified exactly.
14. At m=8, the rational Taylor bound α²≤829/10368 and the rational square-root
    bound in (29a) improve the bulk constant below 13/10. For m≥9 the simpler
    decreasing formula is already sufficient.

**C: replayed**

The dependency-free Node checker passed 246 exact polynomial-profile instances,
including both pure factors and finite cubics with bulk, and profiles with
mixed signs. It compares the direct Gaussian-mixture expression for the content
to the independent regression expression from 6.3.23. All six rational row
comparisons and the 1024/252 control passed. These tests corroborate the
derivation but do not replace the written proof.

**Open / not claimed**

- No theorem for all H_{2,1} tensors.
- No proof of K_G^C>1.402 or closure of a complete degree-5 row.
- No interval certification of the external numerical “room” thresholds.
- No certification of the low-rank scalar reductions.
- No Lean formalization or independent review of this package.

