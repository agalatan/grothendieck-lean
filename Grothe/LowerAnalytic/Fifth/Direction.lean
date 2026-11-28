import Grothe.LowerAnalytic.Frame
import Grothe.LowerAnalytic.WitnessCap
import Mathlib.Probability.HasLaw

/-! # The visible Gaussian direction of a response pair

Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

private theorem hasLaw_zeta0 (n : ℕ) :
    HasLaw (fun x => zeta0 n x) gaussC (stdGaussian ((n+1)+(n+1))) := by
  have h := (measurePreserving_snd.comp (measurePreserving_split2 (n := n))).hasLaw
  apply h.congr
  have h₀ : (fun x => (split2 (n := n) x).2) =
      (fun x => (((√2 : ℝ) : ℂ)⁻¹) * zc (n+1) 0 x) := by
    apply funext_joinR
    intro z y
    rw [split2_joinR, joinR_zc0]
    have htwo : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast sqrt_two_ne
    field_simp
  change _ =ᵐ[_] (fun x => (split2 (n := n) x).2)
  rw [h₀]
  filter_upwards [Lp.coeFn_smul (((√2 : ℝ) : ℂ)⁻¹) (zL (n+1) 0), zL_ae (n+1) 0] with x hx hz
  change (((((√2 : ℝ) : ℂ)⁻¹) • zL (n+1) 0 : L2G (n+1)) x) = _
  rw [hx]
  simp only [Pi.smul_apply, hz, smul_eq_mul]

/-- A unit first-chaos direction has exactly the standard complex Gaussian law. -/
theorem hasLaw_unit_H10 {n : ℕ} (u : L2G (n+1)) (hu : u ∈ H10 (n+1)) (hunit : ‖u‖ = 1) :
    HasLaw (fun x => u x) gaussC (stdGaussian ((n+1)+(n+1))) := by
  obtain ⟨W, hW⟩ := exists_Cop_eq (Nat.succ_pos n) hu hunit
  have he : Cop W u = zeta0 n := hW
  have h := Cop_ae W.symm (Cop W u)
  rw [Cop_symm_Cop, he] at h
  exact ((hasLaw_zeta0 n).comp (measurePreserving_Phi W.symm).hasLaw).congr h

end

end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- The direction of the visible projection. At zero amplitude it is the zero function. -/
def visibleDirection (n : ℕ) (f g : L2G n) : L2G n :=
  (((tOf n f g)⁻¹ : ℝ) : ℂ) • (H10 n).starProjection (hOf n f g)

theorem visibleDirection_mem (n : ℕ) (f g : L2G n) : visibleDirection n f g ∈ H10 n :=
  (H10 n).smul_mem _ ((H10 n).starProjection_apply_mem _)

theorem norm_visibleDirection_of_pos {n : ℕ} {f g : L2G n} (ht : 0 < tOf n f g) :
    ‖visibleDirection n f g‖ = 1 := by
  rw [visibleDirection, norm_smul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (inv_pos.mpr ht)]
  change (tOf n f g)⁻¹ * tOf n f g = 1
  exact inv_mul_cancel₀ ht.ne'

theorem re_inner_visibleDirection (n : ℕ) (f g : L2G n) :
    (inner ℂ (hOf n f g) (visibleDirection n f g)).re = tOf n f g := by
  rw [visibleDirection, inner_smul_right, Complex.re_ofReal_mul, re_inner_starProjection]
  change (tOf n f g)⁻¹ * tOf n f g ^ 2 = tOf n f g
  by_cases h : tOf n f g = 0
  · simp [h]
  · field_simp

end

end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- A unit complex phase with the visible direction, with a fixed value at the origin. -/
def unitPhaseL {n : ℕ} (z : L2G n) : L2G n :=
  (MemLp.of_bound (measurable_ph.comp_aemeasurable (Lp.aestronglyMeasurable z).aemeasurable).aestronglyMeasurable
    1 (.of_forall fun x => norm_ph_le (z x))).toLp (fun x => ph (z x))

end
end Grothe.LowerAnalytic
