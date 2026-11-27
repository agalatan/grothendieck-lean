import Grothe.LowerAnalytic.MomentCone
import Grothe.Lower.Reserve

/-!
# The exact scalar boundary of the joint moment-cost cone

This optimizes the sufficient cone, not the set of genuine response laws.
The low-cost branch is J3; the other branch is the shifted family. Thus an
outer search over the two Young parameters cannot improve this cone envelope.
-/

namespace Grothe.LowerAnalytic.MomentCone

noncomputable section

variable {w t z A B r1 r2 : ℝ}

/-- Adding the two PSD matrices gives their Schur bound. -/
lemma Feasible.sum_schur (H : Feasible w t z A B r1 r2) (ht : 0 < t) (hz : 0 < z) :
    22500 * w ^ 2 ≤ (t + z) * (r1 + r2) := by
  obtain ⟨hr1, hr2⟩ := H.remainders_nonneg ht hz
  have hx := Grothe.Lower.psd_pair ht.le hr1 H.psd_t hr2 hz.le
    (show (-165 * w / 2) ^ 2 ≤ r2 * z by nlinarith [H.psd_z])
  nlinarith [H.psd_t, H.psd_z]

/-- A lower bound for every cost in the cone, sharp on the upper branch. -/
theorem Feasible.shifted_lower (H : Feasible w t z A B r1 r2)
    (hw : 0 < w) (ht : 0 < t) (hz : 0 < z) :
    198 * w + 22500 * w ^ 2 / (A + 40 * w) ≤ B := by
  obtain ⟨hA, -⟩ := H.costs_nonneg hw ht hz
  obtain ⟨hr1, hr2⟩ := H.remainders_nonneg ht hz
  have hK : 0 < A + 40 * w := by positivity
  have hm := mul_le_mul H.linear_s H.linear_h (add_nonneg hr1 hr2) hK.le
  have hc : 22500 * w ^ 2 / (A + 40 * w) ≤ B - 198 * w :=
    (div_le_iff₀ hK).2 (by nlinarith [H.sum_schur ht hz])
  linarith

/-- The shifted branch attains that lower bound once its second diagonal is admissible. -/
theorem shifted_feasible (hw : 0 < w) (hA : 360 * w ≤ 11 * A) :
    Feasible w (9 * (A + 40 * w) / 20) (11 * (A + 40 * w) / 20)
      A (198 * w + 22500 * w ^ 2 / (A + 40 * w))
      (10125 * w ^ 2 / (A + 40 * w)) (12375 * w ^ 2 / (A + 40 * w)) := by
  have hK : 0 < A + 40 * w := by linarith
  refine ⟨by linarith, by linarith, ?_, ?_, ?_⟩
  · exact le_of_eq (by ring)
  · generalize he : A + 40 * w = K at hK ⊢
    apply le_of_eq
    field_simp [ne_of_gt hK]
    ring
  · generalize he : A + 40 * w = K at hK ⊢
    apply le_of_eq
    field_simp [ne_of_gt hK]
    ring

/-- J3 gives a feasible cone point for every positive first cost. -/
theorem young_feasible (hw : 0 < w) (hA : 0 < A) :
    Feasible w A (40 * w) A (11781 * w / 32 + 18225 * w ^ 2 / (4 * A))
      (18225 * w ^ 2 / (4 * A)) (5445 * w / 32) := by
  refine ⟨le_rfl, le_rfl, ?_, ?_, ?_⟩
  · exact le_of_eq (by ring)
  · apply le_of_eq
    field_simp [ne_of_gt hA]
    ring
  · exact le_of_eq (by ring)

/-- On the lower branch the constraint `z ≥ 40w` makes the J3 point optimal. -/
theorem Feasible.young_lower (H : Feasible w t z A B r1 r2)
    (hw : 0 < w) (ht : 0 < t) (hz : 0 < z) (hlow : 11 * A ≤ 360 * w) :
    11781 * w / 32 + 18225 * w ^ 2 / (4 * A) ≤ B := by
  obtain ⟨hr1, hr2⟩ := H.remainders_nonneg ht hz
  have hA : 0 < A := by linarith [H.linear_s, H.z_lower]
  let γ := 135 * w / (2 * A)
  have hγ : 33 / 16 ≤ γ := by
    dsimp [γ]
    apply (le_div_iff₀ (by positivity : 0 < 2 * A)).2
    linarith
  have hγ2 : (33 / 16 : ℝ) ^ 2 ≤ γ ^ 2 := by nlinarith
  have htangent := Grothe.Lower.psd_pair ht.le hr1 H.psd_t (sq_nonneg γ)
    (show (0 : ℝ) ≤ 1 by norm_num) (show (-γ) ^ 2 ≤ γ ^ 2 * 1 by nlinarith)
  have hztangent := Grothe.Lower.psd_pair hz.le hr2 H.psd_z
    (sq_nonneg (33 / 16 : ℝ)) (show (0 : ℝ) ≤ 1 by norm_num)
    (show (-(33 / 16 : ℝ)) ^ 2 ≤ (33 / 16 : ℝ) ^ 2 * 1 by norm_num)
  have hslack : 0 ≤ (A - t) * γ ^ 2 - (z - 40 * w) * (33 / 16 : ℝ) ^ 2 := by
    have h1 := mul_nonneg (sub_nonneg.2 H.linear_s) (sq_nonneg γ)
    have h2 := mul_nonneg (sub_nonneg.2 hγ2) (sub_nonneg.2 H.z_lower)
    nlinarith
  have hid : 2 * (135 * w / 2) * γ - A * γ ^ 2 = 18225 * w ^ 2 / (4 * A) := by
    dsimp [γ]
    field_simp [ne_of_gt hA]
    ring
  nlinarith [H.linear_h]

/-- Exact optimal scalar cost of this sufficient conic recipe. -/
def boundary (w A : ℝ) : ℝ :=
  if 11 * A ≤ 360 * w then 11781 * w / 32 + 18225 * w ^ 2 / (4 * A)
  else 198 * w + 22500 * w ^ 2 / (A + 40 * w)

/-- Every positive-multiplier cone point lies above the explicit two-branch boundary. -/
theorem Feasible.boundary_lower (H : Feasible w t z A B r1 r2)
    (hw : 0 < w) (ht : 0 < t) (hz : 0 < z) : boundary w A ≤ B := by
  unfold boundary
  split_ifs with h
  · exact H.young_lower hw ht hz h
  · exact H.shifted_lower hw ht hz

/-- The boundary is attained with positive first diagonals for every positive first cost. -/
theorem boundary_attained (hw : 0 < w) (hA : 0 < A) :
    ∃ t z r1 r2 : ℝ, 0 < t ∧ 0 < z ∧ Feasible w t z A (boundary w A) r1 r2 := by
  unfold boundary
  split_ifs with h
  · exact ⟨A, 40 * w, _, _, hA, by positivity, young_feasible hw hA⟩
  · have hK : 0 < A + 40 * w := by positivity
    exact ⟨9 * (A + 40 * w) / 20, 11 * (A + 40 * w) / 20, _, _,
      by positivity, by positivity, shifted_feasible hw (le_of_lt (lt_of_not_ge h))⟩

/-- An exact epigraph description, eliminating all four auxiliary diagonal variables. -/
theorem exists_feasible_iff (hw : 0 < w) (hA : 0 < A) :
    (∃ t z r1 r2 : ℝ, 0 < t ∧ 0 < z ∧ Feasible w t z A B r1 r2) ↔ boundary w A ≤ B := by
  constructor
  · rintro ⟨t, z, r1, r2, ht, hz, H⟩
    exact H.boundary_lower hw ht hz
  · intro hB
    obtain ⟨t, z, r1, r2, ht, hz, H⟩ := boundary_attained hw hA
    exact ⟨t, z, r1, r2, ht, hz, H.z_lower, H.linear_s, by linarith [H.linear_h],
      H.psd_t, H.psd_z⟩

/-- The closed-form boundary evaluated with exact rational arithmetic. -/
def boundaryQ (w A : ℚ) : ℚ :=
  if 11 * A ≤ 360 * w then 11781 * w / 32 + 18225 * w ^ 2 / (4 * A)
  else 198 * w + 22500 * w ^ 2 / (A + 40 * w)

lemma boundaryQ_cast (w A : ℚ) : (boundaryQ w A : ℝ) = boundary (w : ℝ) (A : ℝ) := by
  by_cases h : 11 * A ≤ 360 * w
  · have hR : (11 : ℝ) * A ≤ 360 * w := by exact_mod_cast h
    simp only [boundaryQ, boundary, ite_eq_left h, ite_eq_left hR]
    push_cast
    rfl
  · have hR : ¬ (11 : ℝ) * A ≤ 360 * w := by exact_mod_cast h
    simp only [boundaryQ, boundary, ite_eq_right h, ite_eq_right hR]
    push_cast
    rfl

/-- A three-scalar exact checker replaces the two PSD blocks and their four auxiliary variables. -/
def boundaryCheck (w A B : ℚ) : Bool := decide (0 < w ∧ 0 < A ∧ boundaryQ w A ≤ B)

theorem boundaryCheck_sound {w A B : ℚ} (h : boundaryCheck w A B = true) :
    ∃ t z r1 r2 : ℝ, 0 < t ∧ 0 < z ∧ Feasible (w : ℝ) t z A B r1 r2 := by
  simp only [boundaryCheck, decide_eq_true_eq] at h
  have hw : (0 : ℝ) < w := by exact_mod_cast h.1
  have hA : (0 : ℝ) < A := by exact_mod_cast h.2.1
  have hB : boundary (w : ℝ) (A : ℝ) ≤ B := by
    rw [← boundaryQ_cast]
    exact_mod_cast h.2.2
  exact (exists_feasible_iff hw hA).2 hB

/-- The optimized boundary gives a genuine cubic moment theorem, not only a scalar recipe. -/
theorem boundary_moment {ι : Type*} [Fintype ι] [DecidableEq ι]
    {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    (hw : 0 < w) (hA : 0 < A) :
    w * (E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2))
      ≤ Real.sqrt (E (radU a b ^ 2) - 2)
        * (A * JointSixth.s0 (gramT J a b) + boundary w A * JointSixth.h0 (gramT J a b)) := by
  obtain ⟨t, z, r1, r2, ht, hz, H⟩ := boundary_attained hw hA
  exact gram_weighted hE ha hc haa hw ht hz H

/-- A closed-form optimal recipe, already connected to the moment correction on its node range. -/
theorem boundary_node {ι : Type*} [Fintype ι] [DecidableEq ι]
    {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    {ζ xmax : ℝ} (hζ : 0 < ζ) (hxmax : 0 < xmax) (hA : 0 < A)
    (hrange : Real.sqrt (E (radU a b ^ 2) - 2) ≤ xmax) :
    ζ * (E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2))
      ≤ A * JointSixth.s0 (gramT J a b)
        + boundary (ζ * xmax) A * JointSixth.h0 (gramT J a b) := by
  obtain ⟨t, z, r1, r2, ht, hz, H⟩ := boundary_attained (mul_pos hζ hxmax) hA
  exact gram_node hE ha hc haa hζ hxmax ht hz H hrange

/-- Every accepted three-scalar recipe proves the actual cubic moment correction on its range. -/
theorem boundaryChecked_node {ι : Type*} [Fintype ι] [DecidableEq ι]
    {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    (ζ xmax A B : ℚ) (hζ : 0 < ζ) (hxmax : 0 < xmax)
    (hcheck : boundaryCheck (ζ * xmax) A B = true)
    (hrange : Real.sqrt (E (radU a b ^ 2) - 2) ≤ (xmax : ℝ)) :
    (ζ : ℝ) * (E (radU a b ^ 3) - 6 - 9 * (E (radU a b ^ 2) - 2))
      ≤ (A : ℝ) * JointSixth.s0 (gramT J a b) + (B : ℝ) * JointSixth.h0 (gramT J a b) := by
  obtain ⟨t, z, r1, r2, ht, hz, H⟩ := boundaryCheck_sound hcheck
  have H' : Feasible ((ζ : ℝ) * xmax) t z A B r1 r2 := by
    simpa only [Rat.cast_mul] using H
  exact gram_node hE ha hc haa (by exact_mod_cast hζ) (by exact_mod_cast hxmax) ht hz H' hrange

end

end Grothe.LowerAnalytic.MomentCone
