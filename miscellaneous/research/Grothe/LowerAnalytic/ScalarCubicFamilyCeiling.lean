import Mathlib.Tactic
import Mathlib.Analysis.Real.Pi.Bounds

/-!
Generic complex affine cancellation behind the scalar cubic-family ceiling.
The actual Gaussian coefficient identities and the Arb integral bounds remain
external hypotheses. No Gaussian realization theorem is asserted here.
-/
namespace Grothe.LowerAnalytic.ScalarCubicFamilyCeiling

noncomputable section

/-- Exact cancellation works for arbitrary complex multipliers. -/
theorem affine_cancel (p₁ p₂ s₁ s₂ w : ℝ)
    (hcancel : w*s₁+(1-w)*s₂=0) (z : ℂ) :
    (w:ℂ)*((p₁:ℂ)-z*(s₁:ℂ))+(1-(w:ℂ))*((p₂:ℂ)-z*(s₂:ℂ)) =
      ((w*p₁+(1-w)*p₂:ℝ):ℂ) := by
  calc
    _ = ((w*p₁+(1-w)*p₂:ℝ):ℂ)-z*((w*s₁+(1-w)*s₂:ℝ):ℂ) := by
      push_cast
      ring
    _ = _ := by rw [hcancel]; simp

/-- A convex combination of two actual complex pairings is bounded by their
maximum norm. The coefficients themselves are never averaged before squaring. -/
theorem mixed_floor_le_max (p₁ p₂ s₁ s₂ w : ℝ)
    (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1)
    (hcancel : w*s₁+(1-w)*s₂=0) (z : ℂ) :
    w*p₁+(1-w)*p₂ ≤
      max ‖(p₁:ℂ)-z*(s₁:ℂ)‖ ‖(p₂:ℂ)-z*(s₂:ℂ)‖ := by
  let j₁ := (p₁:ℂ)-z*(s₁:ℂ)
  let j₂ := (p₂:ℂ)-z*(s₂:ℂ)
  have hw₂ : 0 ≤ 1-w := sub_nonneg.mpr hw₁
  have hn₀ : ‖(w:ℂ)‖=w := Complex.norm_of_nonneg hw₀
  have hn₂ : ‖(1-(w:ℂ))‖=1-w := by
    simpa only [Complex.ofReal_sub, Complex.ofReal_one] using
      (Complex.norm_of_nonneg hw₂)
  calc
    w*p₁+(1-w)*p₂ ≤ |w*p₁+(1-w)*p₂| := le_abs_self _
    _ = ‖((w*p₁+(1-w)*p₂:ℝ):ℂ)‖ := by
      rw [Complex.norm_real, Real.norm_eq_abs]
    _ = ‖(w:ℂ)*j₁+(1-(w:ℂ))*j₂‖ := by
      rw [affine_cancel p₁ p₂ s₁ s₂ w hcancel z]
    _ ≤ ‖(w:ℂ)*j₁‖+‖(1-(w:ℂ))*j₂‖ := norm_add_le _ _
    _ = w*‖j₁‖+(1-w)*‖j₂‖ := by
      rw [norm_mul, norm_mul, hn₀, hn₂]
    _ ≤ w*max ‖j₁‖ ‖j₂‖+(1-w)*max ‖j₁‖ ‖j₂‖ :=
      add_le_add (mul_le_mul_of_nonneg_left (le_max_left _ _) hw₀)
        (mul_le_mul_of_nonneg_left (le_max_right _ _) hw₂)
    _ = _ := by dsimp [j₁, j₂]; ring

/-- If the two lines are actual bounded-response pairings, their exact
zero-slope mixture supplies a uniform lower bound on the operator norm. -/
theorem family_floor (p₁ p₂ s₁ s₂ w : ℝ) (N : ℂ → ℝ)
    (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1)
    (hcancel : w*s₁+(1-w)*s₂=0)
    (h₁ : ∀ z, ‖(p₁:ℂ)-z*(s₁:ℂ)‖ ≤ N z)
    (h₂ : ∀ z, ‖(p₂:ℂ)-z*(s₂:ℂ)‖ ≤ N z) :
    ∀ z, w*p₁+(1-w)*p₂ ≤ N z := by
  intro z
  exact (mixed_floor_le_max p₁ p₂ s₁ s₂ w hw₀ hw₁ hcancel z).trans
    (max_le (h₁ z) (h₂ z))

/-- Strictly opposite finite slopes supply the required exact mixing weight. -/
theorem opposite_slopes (s₁ s₂ : ℝ) (hs₁ : 0 < s₁) (hs₂ : s₂ < 0) :
    ∃ w : ℝ, 0 ≤ w ∧ w ≤ 1 ∧ w*s₁+(1-w)*s₂=0 := by
  have hd : 0 < s₁-s₂ := by linarith
  refine ⟨-s₂/(s₁-s₂), div_nonneg (by linarith) (le_of_lt hd), ?_, ?_⟩
  · apply (div_le_iff₀ hd).2
    linarith
  · field_simp
    ring

/-- Arithmetic only: the externally certified mixed intercept is above the
short advertised rational floor. This does not assert its Gaussian hypotheses. -/
theorem rounded_mix_floor :
    (14262709317/20000000000:ℝ) <
      1742619936289202336457234374653146799/2443602961448005824645000000000000000 := by
  norm_num

theorem floor_positive : (0:ℝ) < 14262709317/20000000000 := by norm_num

theorem reciprocal_ceiling :
    (1/(14262709317/20000000000:ℝ)) < 14022581233/10000000000 := by
  norm_num

theorem ceiling_below_140226 :
    (14022581233/10000000000:ℝ) < 70113/50000 := by norm_num

/-- Purely real arithmetic for extending a scalar norm floor to a ratio
bound. The vector spectral bound and the pure-cubic response bound are
supplied as hypotheses; no Gaussian statement is encoded in this lemma. -/
theorem spectral_ratio_ceiling (B x α N V : ℝ)
    (hB : 0 < B) (hx : 0 ≤ x) (hα : B ≤ α)
    (hNB : B ≤ N) (hNx : α*x ≤ N) (hV : V ≤ max 1 x) :
    V/N ≤ 1/B := by
  have hN : 0 < N := lt_of_lt_of_le hB hNB
  have hbx : B*x ≤ N :=
    (mul_le_mul_of_nonneg_right hα hx).trans hNx
  have h₁ : (1:ℝ) ≤ N/B := (le_div_iff₀ hB).2 (by nlinarith)
  have h₂ : x ≤ N/B := (le_div_iff₀ hB).2 (by nlinarith)
  apply (div_le_iff₀ hN).2
  calc
    V ≤ max 1 x := hV
    _ ≤ N/B := max_le h₁ h₂
    _ = (1/B)*N := by ring

/-- Arithmetic for the pure-cubic coefficient used by the external Gaussian
construction. This only evaluates its stated scalar expression. -/
theorem pure_cubic_coefficient_above_floor :
    (14262709317/20000000000:ℝ) <
      ((1000000000000:ℝ)/1000000000001)*(Real.pi/4) := by
  have hpi := Real.pi_gt_d20
  nlinarith

#print axioms affine_cancel
#print axioms mixed_floor_le_max
#print axioms family_floor
#print axioms opposite_slopes
#print axioms rounded_mix_floor
#print axioms floor_positive
#print axioms reciprocal_ceiling
#print axioms ceiling_below_140226
#print axioms spectral_ratio_ceiling
#print axioms pure_cubic_coefficient_above_floor

end
end Grothe.LowerAnalytic.ScalarCubicFamilyCeiling
