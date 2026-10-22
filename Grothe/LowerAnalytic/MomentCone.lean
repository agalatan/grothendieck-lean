import Grothe.LowerAnalytic.JointSixth

/-!
# A homogeneous cone for joint sixth-moment costs

`Feasible weight t z A B r1 r2` records three linear inequalities and the two
2-by-2 determinant inequalities.  Positivity of `weight`, `t`, and `z` is an
explicit argument of the soundness theorem; no division by a possibly zero
multiplier or diagonal entry is used.  The other two diagonal entries are
nonnegative by `Feasible.remainders_nonneg`.

The witnesses `β = 2t/(135 weight)` and `η = z/(2 weight) - 20` instantiate
`JointSixth.gram_j_eta`.  Thus the cone eliminates searches over these two
parameters while keeping the same five contraction invariants.
-/

open MvPolynomial Grothe.LowerAnalytic.JointSixth

namespace Grothe.LowerAnalytic.MomentCone

noncomputable section

/-- The finite homogeneous cost constraints.  The three positive denominator
assumptions are supplied separately to every theorem that performs division. -/
structure Feasible (weight t z A B r1 r2 : ℝ) : Prop where
  z_lower : 40 * weight ≤ z
  linear_s : t + z ≤ A + 40 * weight
  linear_h : r1 + r2 ≤ B - 198 * weight
  psd_t : (135 * weight / 2) ^ 2 ≤ t * r1
  psd_z : (165 * weight / 2) ^ 2 ≤ z * r2

/-- Positive first diagonal entries and the determinant tests force the other
PSD diagonal entries to be nonnegative; these are not additional hypotheses. -/
lemma Feasible.remainders_nonneg {weight t z A B r1 r2 : ℝ}
    (H : Feasible weight t z A B r1 r2) (ht : 0 < t) (hz : 0 < z) :
    0 ≤ r1 ∧ 0 ≤ r2 := by
  exact ⟨(mul_nonneg_iff_of_pos_left ht).1 ((sq_nonneg _).trans H.psd_t),
    (mul_nonneg_iff_of_pos_left hz).1 ((sq_nonneg _).trans H.psd_z)⟩

/-- Every feasible positive-multiplier cost is an ordinary nonnegative reserve. -/
lemma Feasible.costs_nonneg {weight t z A B r1 r2 : ℝ}
    (H : Feasible weight t z A B r1 r2) (hw : 0 < weight) (ht : 0 < t) (hz : 0 < z) :
    0 ≤ A ∧ 0 ≤ B := by
  obtain ⟨hr1, hr2⟩ := H.remainders_nonneg ht hz
  constructor
  · linarith [H.z_lower, H.linear_s]
  · linarith [H.linear_h]

/-- Exact coefficient identities for the explicit cone-to-Young substitution. -/
lemma coefficient_identities {weight t z : ℝ}
    (hw : 0 < weight) (ht : 0 < t) (hz : 0 < z) :
    weight * (135 * (2 * t / (135 * weight)) / 2 + 2 * (z / (2 * weight) - 20))
        = t + z - 40 * weight ∧
      weight * (198 + 27225 / (8 * (20 + (z / (2 * weight) - 20)))
          + 135 / (2 * (2 * t / (135 * weight))))
        = 198 * weight + (18225 / 4) * weight ^ 2 / t + (27225 / 4) * weight ^ 2 / z := by
  constructor
  · field_simp [ne_of_gt hw]
    ring
  · rw [show 20 + (z / (2 * weight) - 20) = z / (2 * weight) by ring]
    field_simp [ne_of_gt hw, ne_of_gt ht, ne_of_gt hz]
    ring

/-- Every feasible cone point supplies valid η and β and bounds both weighted
coefficients of the global joint sixth-moment family. -/
theorem Feasible.parameters {weight t z A B r1 r2 : ℝ}
    (H : Feasible weight t z A B r1 r2) (hw : 0 < weight) (ht : 0 < t) (hz : 0 < z) :
    0 ≤ z / (2 * weight) - 20 ∧ 0 < 2 * t / (135 * weight) ∧
      weight * (135 * (2 * t / (135 * weight)) / 2 + 2 * (z / (2 * weight) - 20)) ≤ A ∧
      weight * (198 + 27225 / (8 * (20 + (z / (2 * weight) - 20)))
        + 135 / (2 * (2 * t / (135 * weight)))) ≤ B := by
  have hη : 0 ≤ z / (2 * weight) - 20 := by
    apply sub_nonneg.mpr
    apply (le_div_iff₀ (by positivity : 0 < 2 * weight)).2
    linarith [H.z_lower]
  have hβ : 0 < 2 * t / (135 * weight) := by positivity
  have hr1 : (18225 / 4) * weight ^ 2 / t ≤ r1 := by
    apply (div_le_iff₀ ht).2
    nlinarith [H.psd_t]
  have hr2 : (27225 / 4) * weight ^ 2 / z ≤ r2 := by
    apply (div_le_iff₀ hz).2
    nlinarith [H.psd_z]
  obtain ⟨hA, hB⟩ := coefficient_identities hw ht hz
  refine ⟨hη, hβ, ?_, ?_⟩
  · rw [hA]
    linarith [H.linear_s]
  · rw [hB]
    linarith [H.linear_h]

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Soundness of the homogeneous cost cone for a genuine normalized circular cubic.
The only analytic inputs are the original Gaussian, chaos, circularity, and
variance hypotheses; all remaining assumptions are the explicit finite cone tests. -/
theorem gram_weighted {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {u v : MvPolynomial ι ℝ}
    (hu : Chaos3 u) (hc : Circular J u v) (huu : E (u * u) = 1 / 2)
    {weight t z A B r1 r2 : ℝ} (hw : 0 < weight) (ht : 0 < t) (hz : 0 < z)
    (H : Feasible weight t z A B r1 r2) :
    weight * (E (radU u v ^ 3) - 6 - 9 * (E (radU u v ^ 2) - 2))
      ≤ Real.sqrt (E (radU u v ^ 2) - 2)
        * (A * s0 (gramT J u v) + B * h0 (gramT J u v)) := by
  obtain ⟨hη, hβ, hA, hB⟩ := H.parameters hw ht hz
  obtain ⟨hs, hh, -⟩ := gram_j1 hE hu hc huu
  have hm := gram_j_eta hE hu hc huu hη hβ
  have hm' : E (radU u v ^ 3) - 6 - 9 * (E (radU u v ^ 2) - 2)
      ≤ Real.sqrt (E (radU u v ^ 2) - 2)
        * ((135 * (2 * t / (135 * weight)) / 2 + 2 * (z / (2 * weight) - 20))
            * s0 (gramT J u v)
          + (198 + 27225 / (8 * (20 + (z / (2 * weight) - 20)))
            + 135 / (2 * (2 * t / (135 * weight)))) * h0 (gramT J u v)) := by
    linarith
  have hr := add_le_add (mul_le_mul_of_nonneg_right hA hs)
    (mul_le_mul_of_nonneg_right hB hh)
  calc
    _ ≤ weight * (Real.sqrt (E (radU u v ^ 2) - 2)
        * ((135 * (2 * t / (135 * weight)) / 2 + 2 * (z / (2 * weight) - 20))
            * s0 (gramT J u v)
          + (198 + 27225 / (8 * (20 + (z / (2 * weight) - 20)))
            + 135 / (2 * (2 * t / (135 * weight)))) * h0 (gramT J u v))) :=
      mul_le_mul_of_nonneg_left hm' (le_of_lt hw)
    _ = Real.sqrt (E (radU u v ^ 2) - 2)
        * ((weight * (135 * (2 * t / (135 * weight)) / 2 + 2 * (z / (2 * weight) - 20)))
            * s0 (gramT J u v)
          + (weight * (198 + 27225 / (8 * (20 + (z / (2 * weight) - 20)))
            + 135 / (2 * (2 * t / (135 * weight))))) * h0 (gramT J u v)) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hr (Real.sqrt_nonneg _)

/-- Node-range form: a cone point of weight `ζ xmax` pays for `ζ` times the moment
excess wherever `√χ ≤ xmax`.  Both positive multipliers are explicit. -/
theorem gram_node {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {u v : MvPolynomial ι ℝ}
    (hu : Chaos3 u) (hc : Circular J u v) (huu : E (u * u) = 1 / 2)
    {ζ xmax t z A B r1 r2 : ℝ} (hζ : 0 < ζ) (hxmax : 0 < xmax)
    (ht : 0 < t) (hz : 0 < z) (H : Feasible (ζ * xmax) t z A B r1 r2)
    (hrange : Real.sqrt (E (radU u v ^ 2) - 2) ≤ xmax) :
    ζ * (E (radU u v ^ 3) - 6 - 9 * (E (radU u v ^ 2) - 2))
      ≤ A * s0 (gramT J u v) + B * h0 (gramT J u v) := by
  have hw := mul_pos hζ hxmax
  obtain ⟨hA, hB⟩ := H.costs_nonneg hw ht hz
  obtain ⟨hs, hh, -⟩ := gram_j1 hE hu hc huu
  have hreserve : 0 ≤ A * s0 (gramT J u v) + B * h0 (gramT J u v) := by positivity
  have hm := gram_weighted hE hu hc huu hw ht hz H
  have hr := mul_le_mul_of_nonneg_right hrange hreserve
  have hscaled : xmax * (ζ * (E (radU u v ^ 3) - 6 - 9 * (E (radU u v ^ 2) - 2)))
      ≤ xmax * (A * s0 (gramT J u v) + B * h0 (gramT J u v)) := by
    nlinarith
  exact (mul_le_mul_iff_right₀ hxmax).1 (by simpa only [mul_comm xmax] using hscaled)

end

end Grothe.LowerAnalytic.MomentCone
