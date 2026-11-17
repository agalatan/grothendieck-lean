# A fourth-moment bound for trilinear forms on three spheres

claude-b9ee, 17 November 2026. Issue #507 (parent #458); `../../STATUS.md` row 4.30. Scripts and logs:
`../../code/kappa-three-cluster-2026-11-17/`.

## Statement

Let x, y, w be independent standard complex Gaussian vectors in ℂ^c (E xx\* = I), c ≥ 1. Every polynomial in the span of
the 3c³ monomials of #507 (one variable from each cluster, exactly one conjugated) is
R = A(x̄, y, w) + B(x, ȳ, w) + C(x, y, w̄), with
A(x̄, y, w) = Σ A_abd x̄_a y_b w_d, B(x, ȳ, w) = Σ B_abd x_a ȳ_b w_d, C(x, y, w̄) = Σ C_abd x_a y_b w̄_d
for complex tensors A, B, C. Put α = ‖A‖², β = ‖B‖², γ = ‖C‖² (sums of squared moduli of the coefficients) and
κ(R) = (c/(c + 1))³ E|R|⁴/(E|R|²)², which is E G² for G = |R(ω)|²/E|R(ω)|² with ω uniform on the product of the three
unit spheres.

**Theorem (P, author only).**

    E|R|⁴ ≥ 2(α + β + γ)² + (2/c)[(α + β)² + (β + γ)² + (γ + α)² + α² + β² + γ²],   E|R|² = α + β + γ.

Hence E|R|⁴/(E|R|²)² ≥ 2 + 10/(3c), and

    κ(R) ≥ k(c) := 2c²(3c + 5)/(3(c + 1)³) > 2 − 8/(3c)   for every c ≥ 1,

since 3c(c + 1)³·(k(c) − 2 + 8/(3c)) = 6c² + 18c + 8. So #507's target κ ≥ 2 − C/c with C ≤ 2.8 holds with C = 8/3.
The previous bound of 4.30 (i), 2c²/(c + 1)², is k(c) − 4c²/(3(c + 1)³).

## Proof

1. **Charges.** The Gaussian law is invariant under (x, y, w) ↦ (e^{iθ₁}x, e^{iθ₂}y, e^{iθ₃}w). Under it A, B and C carry
   the characters (−1, 1, 1), (1, −1, 1) and (1, 1, −1), so they are orthogonal and E|R|² = α + β + γ (Wick). The six
   terms of R² = A² + B² + C² + 2AB + 2AC + 2BC carry the pairwise distinct characters (−2, 2, 2), (2, −2, 2),
   (2, 2, −2), (0, 0, 2), (0, 2, 0), (2, 0, 0). Hence
   E|R|⁴ = E|R²|² = E|A|⁴ + E|B|⁴ + E|C|⁴ + 4E|AB|² + 4E|AC|² + 4E|BC|².
2. **One form.** For one trilinear form T, Wick's formula pairs, in each cluster, the two factors of T with the two of
   T̄, straight or crossed. All straight and all crossed give ‖T‖⁴ each. One cluster k crossed, or the other two, gives
   ‖P_T^k‖²_F, where P_T^k is the c × c Gram matrix of the k-th flattening, e.g. (P_T^w)_dd' = Σ_ab T_abd T̄_abd'. So
   E|T|⁴ = 2‖T‖⁴ + 2Σ_k ‖P_T^k‖²_F (the form behind 4.30 (ii)).
3. **Two forms.** Take A and B, and let w be the cluster where neither is conjugated. In E[A B Ā B̄]:
   - each of x and y is paired *across* (A with Ā, B with B̄) or *within* (A with B, Ā with B̄);
   - w is paired *straight* (A with Ā, B with B̄) or *twisted* (A with B̄, B with Ā).

   The eight terms are:
   - (across, across, straight) = αβ;
   - (across, across, twisted) = Σ_dd' (P_A^w)_dd' (P_B^w)_d'd = tr(P_A^w P_B^w) ≥ 0;
   - for each other choice on (x, y), the straight and twisted terms are Σ|Z_{I d, J d'}|² and
     Σ Z_{I d, J d'} conj(Z_{I d', J d}). Here Z is a contraction of A with B over the clusters paired within: for
     (within, within), Z_dd' = Σ_ab A_abd B_abd'; for (within, across), Z_{(b, d), (b', d')} = Σ_a A_abd B_ab'd'. Their
     sum is ½Σ|Z_{I d, J d'} + Z_{I d', J d}|² ≥ 0.

   So E|AB|² ≥ αβ + tr(P_A^w P_B^w). Likewise E|AC|² ≥ αγ + tr(P_A^y P_C^y) and E|BC|² ≥ βγ + tr(P_B^x P_C^x).
4. **Assembly by clusters.** The terms ‖T‖⁴ and αβ, αγ, βγ add up to 2(α + β + γ)². In cluster w the remaining terms are
   2‖P_A^w‖² + 2‖P_B^w‖² + 4tr(P_A^w P_B^w) + 2‖P_C^w‖² = 2‖P_A^w + P_B^w‖²_F + 2‖P_C^w‖²_F ≥ (2/c)[(α + β)² + γ²],
   because ‖P‖²_F ≥ (tr P)²/c for a positive semidefinite c × c matrix and tr P_T^k = ‖T‖². Clusters x and y give
   (2/c)[(β + γ)² + α²] and (2/c)[(γ + α)² + β²]. This is the theorem. Finally
   (α + β)² + (β + γ)² + (γ + α)² + α² + β² + γ² = (α + β + γ)² + 2(α² + β² + γ²) ≥ (5/3)(α + β + γ)².
5. **From the Gaussian to the spheres.** R(x, y, w) = r₁r₂r₃R(ω) with r_k² ~ Gamma(c) independent of ω, and
   E r⁴/(E r²)² = (c + 1)/c. So E|R(ω)|⁴/(E|R(ω)|²)² = (c/(c + 1))³ E|R|⁴/(E|R|²)² = κ. ∎

The bound is not sharp. Equality would need α = β = γ, flat Gram matrices and the dropped pair sums to vanish; at c = 2
it gives 88/81 = 1.0864 against the true minimum 4/3.

## Checks (`../../code/kappa-three-cluster-2026-11-17/`)

- `wick4.py`: the Wick formula for E|R|⁴ agrees with Monte Carlo (2·10⁶ samples) on random A, B, C at c = 2 and 3,
  within the sampling error of about 1 %. The c = 2 cubic of 4.30 (iii) gives κ = 4/3 exactly.
- `pairs_check.py` (N), on 800 random pairs, c = 2 to 5:
  - (across, across, straight) = αβ and (across, across, twisted) = tr(P_A^w P_B^w) to a relative 10⁻⁹;
  - the three other pair sums are nonnegative;
  - on 1,500 random mixed R, c = 2 to 8, the theorem holds with margin.
- `minkappa.py` (N): local minimisation of κ over all 3c³ coefficients reproduces the minima of 4.30 (4/3 at c = 2,
  1.58002 at c = 3, 1.600 at c = 4), all above k(c).
- `bound_exact.py` (exact):
  - the polynomial identity above;
  - k(c) − 2c²/(c + 1)² = 4c²/(3(c + 1)³);
  - k(c) against the κ that 4.30 needs on the piece t = 0.70:

| c | 4 | 5 | 6 | 8 | 10 | 12 |
|---|---|---|---|---|---|---|
| κ needed (1.612u\* / 1.449u\*) | 1.285 / 1.290 | 1.402 / 1.407 | 1.483 / 1.488 | 1.591 / 1.596 | 1.658 / 1.662 | 1.705 / 1.708 |
| previous bound 2c²/(c + 1)² | 1.2800 | 1.3889 | 1.4694 | 1.5802 | 1.6529 | 1.7041 |
| new bound k(c) | 1.4507 | 1.5432 | 1.6093 | 1.6973 | 1.7531 | 1.7915 |

## Consequence and what stays open

- In the three-cluster family with G of Gamma shape (4.30), the content ratio on the piece t = 0.70 now stays under the
  allowance for every c. The previous bound left c = 4, …, 12 above it by 0.2–3.4 %; the formula values at the new
  bound are 0.1786–0.1838 at 1.612u\* against 0.2190 and 0.1924–0.1979 at 1.449u\* against 0.2323, so 14–18 % below
  (`formula_t070.log`; **N**: the formula is floating point and the Gamma shape is an approximation; laws of G with
  two atoms and the same two moments add up to 2 %).
- Open:
  - the minimum of κ for each c (task 2 of #507; numerically 2 − κ ≈ 1.26/c to 1.60/c);
  - the law of G beyond its first two moments (task 3);
  - the content law outside the three-cluster family (4.19, 4.28).
