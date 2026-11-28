import Grothe.LowerAnalytic.QuinticRemoteSupport

/-!
# Signed tests for a physical phase pair

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower

noncomputable section

def carrierSupport {n : ℕ} (z q : L2G n) (s : ℝ) : ℝ :=
  ∫ x, ‖z x * (s : ℂ) + q x‖ ∂(stdGaussian (n + n))

/-- A signed real test supplies the same averaged upper bound for either choice of sign. -/
theorem phase_pair_abs_signed {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (z q : L2G n) (s : ℝ) :
    |s| * (inner ℂ (hOf n f g) z).re + (inner ℂ (kOf n f g) q).re ≤
      (carrierSupport z q s + carrierSupport z q (-s))/2 := by
  have step (a : ℝ) := phase_pair_support hf hg ((a:ℂ) • z) q
  have hstep (a : ℝ) : a * (inner ℂ (hOf n f g) z).re + (inner ℂ (kOf n f g) q).re ≤
      (carrierSupport z q a + carrierSupport z q (-a))/2 := by
    have ha := step a
    rw [inner_smul_right, Complex.re_ofReal_mul] at ha
    refine ha.trans_eq ?_
    congr 2
    · apply integral_congr_ae
      filter_upwards [Lp.coeFn_smul (a:ℂ) z] with x hx
      rw [hx]
      simp [mul_comm]
    · apply integral_congr_ae
      filter_upwards [Lp.coeFn_smul (a:ℂ) z] with x hx
      rw [hx]
      change ‖(a:ℂ)*z x - q x‖ = _
      rw [← norm_neg ((a:ℂ)*z x - q x)]
      congr 1
      push_cast
      ring
  by_cases hs : 0 ≤ s
  · simpa only [abs_of_nonneg hs] using hstep s
  · rw [abs_of_neg (lt_of_not_ge hs)]
    simpa only [neg_neg, add_comm (carrierSupport z q (-s))] using hstep (-s)

end
end Grothe.LowerAnalytic
