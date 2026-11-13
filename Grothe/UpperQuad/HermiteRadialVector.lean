import Grothe.UpperQuad.PolynomialHermiteDegree
import Grothe.UpperQuad.FinitePolynomialMehler
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-!
# A radial graded-vector bound without a mode-count factor

The map `(q,c,d) ↦ ((q-d,q+1-c),(c,d))` embeds the full graded rectangle into a product
of two Hermite degree triangles. Nonnegativity bounds the sum by the product of the two
triangle sums. Applying finite Mehler to the first triangle leaves the coefficient energy
in the second triangle, with no additional dimension factor.

Agent-ID: codex-1a87. Refs #343, #334, #339.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.HermiteRadialVector

open Complex PolynomialHermite FinitePolynomialMehler

noncomputable section

private abbrev GradeIndex := Σ _ : ℕ, ℕ × ℕ

private def gradeIndices (Q : ℕ) : Finset GradeIndex :=
  (Finset.range Q).sigma fun q ↦ Finset.range (q + 2) ×ˢ Finset.range (q + 1)

private lemma mem_gradeIndices {Q : ℕ} {i : GradeIndex} :
    i ∈ gradeIndices Q ↔ i.1 < Q ∧ i.2.1 ≤ i.1 + 1 ∧ i.2.2 ≤ i.1 := by
  simp only [gradeIndices, Finset.mem_sigma, Finset.mem_product, Finset.mem_range]
  omega

private def splitIndex (i : GradeIndex) : (ℕ × ℕ) × (ℕ × ℕ) :=
  ((i.1 - i.2.2, i.1 + 1 - i.2.1), i.2)

private lemma splitIndex_injOn (Q : ℕ) : Set.InjOn splitIndex (gradeIndices Q) := by
  rintro ⟨q, c, d⟩ hi ⟨q', c', d'⟩ hj hij
  obtain ⟨_, _, hd⟩ := mem_gradeIndices.mp hi
  obtain ⟨_, _, hd'⟩ := mem_gradeIndices.mp hj
  change d ≤ q at hd
  change d' ≤ q' at hd'
  simp only [splitIndex, Prod.mk.injEq] at hij
  change ((q - d = q' - d') ∧ (q + 1 - c = q' + 1 - c')) ∧
    c = c' ∧ d = d' at hij
  obtain ⟨⟨hn, _⟩, hc, hd_eq⟩ := hij
  have hq : q = q' := by omega
  cases hq
  cases hc
  cases hd_eq
  rfl

private lemma splitIndex_image_subset {Q D : ℕ} (hQD : 2 * Q ≤ D + 1) :
    (gradeIndices Q).image splitIndex ⊆ indices D ×ˢ indices D := by
  intro p hp
  obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hp
  obtain ⟨hq, hc, hd⟩ := mem_gradeIndices.mp hi
  rw [Finset.mem_product]
  change (i.1 - i.2.2, i.1 + 1 - i.2.1) ∈ indices D ∧
    (i.2.1, i.2.2) ∈ indices D
  simp only [mem_indices]
  constructor <;> omega

/-- The full graded sum embeds into a product of two degree triangles without multiplicity. -/
theorem sum_grade_product_le (Q D : ℕ) (hQD : 2 * Q ≤ D + 1)
    (H U : ℕ × ℕ → ℝ) (hH : ∀ i, 0 ≤ H i) (hU : ∀ i, 0 ≤ U i) :
    (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      H (q - d, q + 1 - c) * U (c, d)) ≤
        (∑ i ∈ indices D, H i) * ∑ i ∈ indices D, U i := by
  have hinj : ∑ i ∈ gradeIndices Q, H (splitIndex i).1 * U (splitIndex i).2 ≤
      ∑ p ∈ indices D ×ˢ indices D, H p.1 * U p.2 :=
    Finset.sum_le_sum_of_injOn splitIndex (splitIndex_injOn Q)
      (splitIndex_image_subset hQD) (fun _ _ ↦ le_rfl)
      (fun p _ _ ↦ mul_nonneg (hH p.1) (hU p.2))
  simpa only [gradeIndices, Finset.sum_sigma, Finset.sum_product, splitIndex,
    Finset.sum_mul_sum] using hinj

private lemma norm_exp_neg_sq (r : ℂ) :
    ‖Complex.exp (-(r ^ 2))‖ ^ 2 = Real.exp (-2 * (r ^ 2).re) := by
  rw [Complex.norm_exp, ← Real.exp_nat_mul]
  congr 1
  simp only [Complex.neg_re]
  ring

/-- The full radial graded-vector energy is bounded by finite Mehler times coefficient energy. -/
theorem sum_radial_sq_le (Q D : ℕ) (hQD : 2 * Q ≤ D + 1)
    (C : ℕ → ℕ → ℂ) (r : ℂ) (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r * C c d‖ ^ 2) ≤
      Real.exp (-2 * (r ^ 2).re) * (t ^ D)⁻¹ * (1 - t ^ 2)⁻¹ *
        Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) *
          ∑ cd ∈ indices D, ‖C cd.1 cd.2‖ ^ 2 := by
  have hcomb := sum_grade_product_le Q D hQD
    (fun nm ↦ ‖normalizedHf nm.1 nm.2 r r‖ ^ 2) (fun cd ↦ ‖C cd.1 cd.2‖ ^ 2)
    (fun _ ↦ sq_nonneg _) (fun _ ↦ sq_nonneg _)
  have hmeh := sum_norm_normalizedHf_sq_le (indices D) D
    (fun nm hnm ↦ mem_indices.mp hnm) t ht0 ht1 r r
  have hcoeff : 0 ≤ ∑ cd ∈ indices D, ‖C cd.1 cd.2‖ ^ 2 :=
    Finset.sum_nonneg fun _ _ ↦ sq_nonneg _
  have hterm (q c d : ℕ) :
      ‖Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r * C c d‖ ^ 2 =
        Real.exp (-2 * (r ^ 2).re) *
          (‖normalizedHf (q - d) (q + 1 - c) r r‖ ^ 2 * ‖C c d‖ ^ 2) := by
    rw [norm_mul, norm_mul, mul_pow, mul_pow, norm_exp_neg_sq]
    ring
  calc
    _ = Real.exp (-2 * (r ^ 2).re) *
        ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          ‖normalizedHf (q - d) (q + 1 - c) r r‖ ^ 2 * ‖C c d‖ ^ 2 := by
      simp_rw [hterm, ← Finset.mul_sum]
    _ ≤ Real.exp (-2 * (r ^ 2).re) *
        ((∑ nm ∈ indices D, ‖normalizedHf nm.1 nm.2 r r‖ ^ 2) *
          ∑ cd ∈ indices D, ‖C cd.1 cd.2‖ ^ 2) :=
      mul_le_mul_of_nonneg_left hcomb (Real.exp_pos _).le
    _ ≤ Real.exp (-2 * (r ^ 2).re) *
        (((t ^ D)⁻¹ * ((1 - t ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp t r r).re)) *
          ∑ cd ∈ indices D, ‖C cd.1 cd.2‖ ^ 2) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hmeh hcoeff) (Real.exp_pos _).le
    _ = _ := by
      rw [Mehler.mehlerExp_diag_re t ht1 ht0.le r]
      ring

/-- The natural cutoff `2*Q-1` also covers the empty case `Q=0`. -/
theorem sum_radial_sq_le_cutoff (Q : ℕ) (C : ℕ → ℕ → ℂ) (r : ℂ)
    (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r * C c d‖ ^ 2) ≤
      Real.exp (-2 * (r ^ 2).re) * (t ^ (2 * Q - 1))⁻¹ * (1 - t ^ 2)⁻¹ *
        Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) *
          ∑ cd ∈ indices (2 * Q - 1), ‖C cd.1 cd.2‖ ^ 2 :=
  sum_radial_sq_le Q (2 * Q - 1) (by omega) C r t ht0 ht1

end

end Grothe.UpperQuad.HermiteRadialVector
