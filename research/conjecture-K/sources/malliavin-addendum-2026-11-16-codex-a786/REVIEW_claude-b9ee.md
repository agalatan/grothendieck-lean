<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-malliavin-addendum-2026-11-16/REVIEW_claude-b9ee.md (16 November 2026); Agent-ID: claude-b9ee. Only this line was added. -->
# Review of codex-a786's addendum `conjecture_k_malliavin_book_addendum.zip` (claude-b9ee, 16 November 2026)

**Verdict: correct; P + C.** Every proof was re-derived, the delivered checker was replayed, and the cubic was
recomputed by a second method. It is an obstruction and one exactly solved family, as the delivery says; the general
content inequality stays open.

## Re-derived (P)

- **The budget identity (§1).** ℬ = 6δ − ℛ₄ with ℛ₄ = 2‖J₄Γ(q, q̄)‖² + ‖J₄Γ(q, q)‖². For F = √2·Re q:
  Γ(F, F) = ½(𝓛 + 6)F² = 3u + 2H₂ + H₄, κ₄(F) = 2‖H₂‖² + ‖H₄‖², Var Γ(F, F) = 4‖H₂‖² + ‖H₄‖², and
  Var Γ(F, F) = ½ℬ(q) by circularity. This is the first identity of ledger 6.3.22 (and the Lean theorem
  `fluctuation_identity`) in real Hermite degrees: J₄Γ(q, q̄) = P₂,₂(|q|²) and J₄Γ(q, q) = P₃,₁(q²), so
  ℛ₄ = ‖P₃,₁q²‖² + 2‖P₂,₂|q|²‖².
- **The cubic (§2).** q = conj(X₀)·Σ_a Y_a² + Σ_{i=1}^{7} X_i·Y*A_iY with the seven Pauli words
  IIY, IYX, XYZ, YIZ, YXX, YZX, ZYZ. They are Hermitian, antisymmetric and traceless, and anticommute with squares I.
  The first term is in H₀,₁(X) ⊗ H₂,₀(Y), the others in H₁,₀(X) ⊗ H₁,₁(Y) (zero diagonals), so q ∈ H₂,₁(ℂ¹⁶).
- **The norm identity and the law (§3).** With the nine real symmetric anticommuting 16×16 matrices P_a:
  Σ_a(GᵀP_aG)² ≤ |G|⁴ by Bessel (the vectors P_aG are orthogonal of norm |G|), and the two sides have the same mean, 72;
  so |YᵀY|² + Σ_i(Y*A_iY)² = |Y|⁴. Given Y, q is a circular Gaussian of variance |Y|⁴. Hence q has the law of R·W,
  R ~ Gamma(8, 1) independent of a standard complex Gaussian W: u = 72, E|q|⁴ = 2·E R⁴ = 15840, δ = 5472, χ = 19/18.
- **The budget of the cubic.** F = Σ_{a=0}^{8} x_a·Q̃_a(G) with nine real standard Gaussians x_a;
  |∇_xF|² = S₀ = R² and |∇_GF|² = 2R·H₀ by anticommutation, H₀ ~ χ²₉ independent. So
  E Γ² = 7920 + 4·720·9 + 4·72·99 = 62352, Var Γ = 15696, ℬ = 31392 = (109/19)δ.
- **Zero content (§4).** The seven maps Y → A_kY, X₀ → −X₀, X_i → −X_i (i ≠ k) are unitary and fix q:
  (A_kY)ᵀ(A_kY) = −YᵀY, and A_kA_iA_k = −A_i for i ≠ k. Every X-coordinate is flipped by one of them, and two
  anticommuting conj(A_k) have no common fixed vector. So Π₁F(q) = 0 for every F (ledger 11.31a).
- **The consumers (§5).**
  - (16)–(18): in `content_profile_proof.md` the bound is ‖c‖² ≤ (1/9)·sup N_Ψ·E[(tr 𝒟)² + 2‖𝒟‖²_F] before the step
    "≤ 6δ" (its (3), (4), (6)). Keeping ℬ gives ‖c_{3/5}‖² ≤ (6δ − ℛ₄)/75 and ‖c_{3/5}‖² ≤ γ_i(δ − ℛ₄/6) on the rows of 11.49.
  - (20): B_row(v) = √π·E√(V + v) is concave (2.7), so Λ(λq) = E B_row(|λ|²|Y|⁴) − pu ≤ B_row(u) − pu ≤ S at every λ.
    11.39–11.40 hold for every remote cubic of any energy and every r, and the linear term vanishes by §4. Hence
    Λ̂(λq + (T − 1)r) ≤ S − (59009/189100)‖r‖², with k = p − 9/25 − 13/20.

## Replayed and recomputed (C)

- **Package integrity:** `SHA256SUMS` matches on 7 of 7 files.
- **Delivered checker:** `node verify.mjs` passes; its output is identical to the delivered `result.json`.
- **A second method** (`check-claude-b9ee/clifford_check.py`, exact Gaussian-integer Wick calculus on the 64 monomials
  of q; no trace-cumulant formula and no use of the law R·W):
  - the matrix relations; q has bidegree (2, 1) and every contraction vanishes;
  - u = 72, E|q|⁴ = 15840, δ = 5472;
  - E c₁ = 144, E c₂ = 72, E(c₁ + c₂ − 3u)² = 13680, E|a|² = 1008, so ℬ = 2·13680 + 4·1008 = 31392;
  - the antiholomorphic identities of ledger 6.3.20–6.3.22 on this cubic: ‖c₂ − u‖² = 2064, ‖P₃,₁q²‖² = 448,
    ‖P₂,₀q²‖² = 896, and 896 + 448 + 2·2064 = 5472 = δ; 6δ − ℬ = 1440 = (5/18)u² = ‖P₃,₁q²‖² + 2‖P₂,₂|q|²‖²;
  - the norm identity as an identity of polynomials, coefficient by coefficient;
  - the seven symmetries fix q exactly.

## Assessment

- **The obstruction is now nearly tight.** The best universal constant in ℬ ≤ cδ lies in [109/19, 6]; improving only
  that constant gains at most 114/109 < 1.046 on any bound linear in the budget (the earlier witness gave 6/5).
- **The same cubic has zero content.** A nearly maximal scalar budget and perfect phase cancellation coexist, so the
  information the content bounds need is not in the budget.
- **A third description of one quantity.** ℛ₄ here, the defect of ledger 6.3.22 and the remainder of the Lean theorem
  `fluctuation_identity` are equal; on this cubic all three give 1440.
- **Not copied into the repository:** `SOURCES.json` (it carries an identifier of the author's uploaded copy of the book).
