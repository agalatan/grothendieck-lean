import Grothe.Upper.Selector.Cosine

/-! # Radial symmetry of the squared-norm selector -/

open MeasureTheory Complex
open scoped ComplexConjugate

set_option warningAsError true

namespace Grothe.Upper.Selector

noncomputable section

/-- Squared lengths of both components of a Mehler pair. -/
def normPair (z : ℂ) (u : ℂ × ℂ) : ℝ × ℝ := (normSq u.1, normSq (mY z u))

private lemma measurable_normPair (z : ℂ) : Measurable (normPair z) := by
  exact (continuous_normSq.measurable.comp measurable_fst).prodMk
    (continuous_normSq.measurable.comp (measurable_mY z))

/-- Taking component lengths removes the common phase of the Mehler correlation. -/
theorem normPair_law (z : ℂ) :
    mu2.map (normPair z) = mu2.map (normPair (‖z‖ : ℂ)) := by
  by_cases hz : z = 0
  · simp [hz]
  let c := z / (‖z‖ : ℂ)
  have hc : ‖c‖ = 1 := by
    simp [c, Complex.norm_real, norm_ne_zero_iff.2 hz]
  have hcz : c * (‖z‖ : ℂ) = z := by
    exact div_mul_cancel₀ z (by exact_mod_cast norm_ne_zero_iff.2 hz)
  let rot : ℂ × ℂ → ℂ × ℂ := Prod.map id (fun v => c * v)
  have hr : Measurable rot := measurable_id.prodMap (by fun_prop)
  have hrot : mu2.map rot = mu2 := by
    rw [show mu2 = gaussC.prod gaussC from rfl, show rot = Prod.map id (fun v => c * v) from rfl,
      ← Measure.map_prod_map _ _ measurable_id (by fun_prop), Measure.map_id, map_rot_gaussC c hc]
  have hsig : sig (‖z‖ : ℂ) = sig z := by simp [sig]
  have hcomp : normPair z ∘ rot = normPair (‖z‖ : ℂ) := by
    funext u
    have he : z * u.1 + sig z * (c * u.2) =
        c * ((‖z‖ : ℂ) * u.1 + sig (‖z‖ : ℂ) * u.2) := by
      rw [hsig, mul_add, ← mul_assoc c (‖z‖ : ℂ), hcz]
      ring
    change (_, normSq (z * u.1 + sig z * (c * u.2))) = _
    rw [he, normSq_mul, normSq_eq_norm_sq c, hc, one_pow, one_mul]
    rfl
  calc
    _ = (mu2.map rot).map (normPair z) := by rw [hrot]
    _ = _ := by rw [Measure.map_map (measurable_normPair z) hr, hcomp]

/-- The angular power series represents the selector moment for complex correlation. -/
theorem angularRow_hasSum_complex {z : ℂ} (hz : ‖z‖ ≤ 1) (t : ℝ) (k : ℕ) :
    HasSum (fun n => angularRow t k n * (‖z‖ ^ 2) ^ n)
      (∫ u : ℂ × ℂ, Real.cos (t * (normSq u.1 + normSq (mY z u) - 2)) ^ (2 * k + 1) ∂mu2) := by
  let h (p : ℝ × ℝ) := Real.cos (t * (p.1 + p.2 - 2)) ^ (2 * k + 1)
  have hm : Measurable h := by dsimp [h]; fun_prop
  change HasSum _ (∫ u, h (normPair z u) ∂mu2)
  rw [← integral_map (measurable_normPair z).aemeasurable hm.aestronglyMeasurable, normPair_law,
    integral_map (measurable_normPair _).aemeasurable hm.aestronglyMeasurable]
  exact angularRow_hasSum (by linarith [norm_nonneg z]) hz t k

end

end Grothe.Upper.Selector
