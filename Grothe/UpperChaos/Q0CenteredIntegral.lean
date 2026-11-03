import Grothe.UpperChaos.Q0ConditionalShift
import Grothe.UpperChaos.ConditionalGaussianPhase

/-!
# Gaussian translation for the centered q0 phase polynomial

A general scalar Gaussian tilt translates a measurable complex source using
completion of squares. Its q0 specialization evaluates the actual invariant
phase polynomial times Im² by the exact shifted-Wick sum. The final relation
to the real part of the full conditional Laplace integral remains separate.

Agent-ID: codex-8c4d
-/

open MeasureTheory Real Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0CenteredIntegral

noncomputable section

open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.Q0PhaseWickBridge
open Grothe.UpperChaos.Q0AffineCancellation

/-- Translate an affine Gaussian tilt for any measurable scalar source. The
change of variables is stated for totalized integrals and retains Gaussian
normalization; no separate integrability hypothesis is silently introduced. -/
theorem integral_affine_scalar_tilt (F : ℂ → ℂ) (hF : Measurable F)
    (α a t : ℝ) (z : ℂ) (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    (∫ w : ℂ, F w * (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) *
      (Real.exp (-(t * Complex.normSq (z + (a : ℂ) * w))) : ℂ) ∂gaussC) =
      (Real.exp (-(α * t * Complex.normSq z / β)) : ℂ) *
        ∫ v : ℂ, F (v + μ) *
          (Real.exp (-(β - 1) * Complex.normSq v) : ℂ) ∂gaussC := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  let c : ℂ := (Real.exp (-(α * t * Complex.normSq z / β)) : ℂ)
  let G : ℂ → ℂ := fun w => F w * (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) *
    (Real.exp (-(t * Complex.normSq (z + (a : ℂ) * w))) : ℂ)
  let H : ℂ → ℂ := fun v => F (v + μ) *
    (Real.exp (-(β - 1) * Complex.normSq v) : ℂ)
  change (∫ w, G w ∂gaussC) = c * ∫ v, H v ∂gaussC
  have hG : Measurable G := by
    dsimp only [G]
    fun_prop
  have hH : Measurable H := by
    dsimp only [H]
    fun_prop
  have hpoint (v : ℂ) :
      (π⁻¹ * Real.exp (-Complex.normSq (v + μ))) • G (v + μ) =
        c * ((π⁻¹ * Real.exp (-Complex.normSq v)) • H v) := by
    have hleft : Real.exp (-Complex.normSq (v + μ)) *
        Real.exp (-(α - 1) * Complex.normSq (v + μ)) *
        Real.exp (-(t * Complex.normSq (z + (a : ℂ) * (v + μ)))) =
          Real.exp (-α * Complex.normSq (v + μ) -
            t * Complex.normSq (z + (a : ℂ) * (v + μ))) := by
      rw [← Real.exp_add, ← Real.exp_add]
      congr 1
      ring
    have hcenter := affine_gaussian_shift_exp_factor α a t z v hα ht
    change Real.exp (-α * Complex.normSq (v + μ) -
      t * Complex.normSq (z + (a : ℂ) * (v + μ))) =
        Real.exp (-(α * t * Complex.normSq z / β)) * Real.exp (-β * Complex.normSq v)
      at hcenter
    have hright : Real.exp (-β * Complex.normSq v) =
        Real.exp (-Complex.normSq v) * Real.exp (-(β - 1) * Complex.normSq v) := by
      rw [← Real.exp_add]
      congr 1
      ring
    calc
      (π⁻¹ * Real.exp (-Complex.normSq (v + μ))) • G (v + μ) =
          ((π⁻¹ * (Real.exp (-Complex.normSq (v + μ)) *
            Real.exp (-(α - 1) * Complex.normSq (v + μ)) *
            Real.exp (-(t * Complex.normSq (z + (a : ℂ) * (v + μ))))) : ℝ) : ℂ) *
              F (v + μ) := by
        dsimp only [G]
        simp only [Complex.real_smul, Complex.ofReal_mul]
        ring
      _ = c * ((π⁻¹ * Real.exp (-Complex.normSq v)) • H v) := by
        rw [hleft, hcenter, hright]
        dsimp only [c, H]
        simp only [Complex.real_smul, Complex.ofReal_mul]
        ring
  calc
    (∫ w, G w ∂gaussC) =
        ∫ w : ℂ, (π⁻¹ * Real.exp (-Complex.normSq w)) • G w :=
      integral_gaussC_eq_volume_complex G hG
    _ = ∫ v : ℂ, (π⁻¹ * Real.exp (-Complex.normSq (v + μ))) • G (v + μ) :=
      (integral_add_right_eq_self (μ := (volume : Measure ℂ))
        (fun w : ℂ => (π⁻¹ * Real.exp (-Complex.normSq w)) • G w) μ).symm
    _ = ∫ v : ℂ, c * ((π⁻¹ * Real.exp (-Complex.normSq v)) • H v) :=
      integral_congr_ae (Filter.Eventually.of_forall hpoint)
    _ = c * ∫ v : ℂ, (π⁻¹ * Real.exp (-Complex.normSq v)) • H v := by
      rw [integral_const_mul]
    _ = c * ∫ v, H v ∂gaussC := by
      rw [← integral_gaussC_eq_volume_complex H hH]

/-- The actual q0 phase source without the scalar affine prefactor. -/
def q0PhaseImSq (r : ℝ) (w : ℂ) : ℂ :=
  ((w.im ^ 2 : ℝ) : ℂ) * ev w (phaseInvariantSlice phaseTerms (r : ℂ))

theorem measurable_q0PhaseImSq (r : ℝ) : Measurable (q0PhaseImSq r) := by
  unfold q0PhaseImSq
  exact (by fun_prop : Measurable (fun w : ℂ => ((w.im ^ 2 : ℝ) : ℂ))).mul
    (continuous_ev _).measurable

/-- The actual q0 phase polynomial after the affine Gaussian tilt is exactly
its centered shifted-Wick sum. Its inverse Gaussian mass is already inside
`imSqMoment`; no additional β⁻¹ is inserted. -/
theorem q0_affine_phase_wick (r t : ℝ) (ht : 0 < t) :
    let P := phaseInvariantSlice phaseTerms (r : ℂ)
    (∫ w : ℂ, q0PhaseImSq r w *
      (Real.exp (-(q0Alpha - 1) * Complex.normSq w) : ℂ) *
      (Real.exp (-(t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * w))) : ℂ)
      ∂gaussC) =
      (Real.exp (-(q0Alpha * t * Complex.normSq (r : ℂ) / q0Rate r t)) : ℂ) *
        ∑ k ∈ P.support, P.coeff k * imSqMoment (q0Rate r t) (q0Shift r t) (k 0) (k 1) := by
  dsimp only
  have h := integral_affine_scalar_tilt (q0PhaseImSq r) (measurable_q0PhaseImSq r)
    q0Alpha (kappaAtReal r) t (r : ℂ) q0Alpha_pos ht
  change (∫ w : ℂ, q0PhaseImSq r w *
      (Real.exp (-(q0Alpha - 1) * Complex.normSq w) : ℂ) *
      (Real.exp (-(t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * w))) : ℂ)
      ∂gaussC) =
    (Real.exp (-(q0Alpha * t * Complex.normSq (r : ℂ) / q0Rate r t)) : ℂ) *
      ∫ v : ℂ, q0PhaseImSq r (v + q0Shift r t) *
        (Real.exp (-(q0Rate r t - 1) * Complex.normSq v) : ℂ) ∂gaussC at h
  rw [h]
  congr 1
  have hmoment := q0_centered_phase_wick r t ht
  simpa only [q0PhaseImSq, q0Shift_im, ev_phaseInvariantSlice, Sphase, Ssum] using hmoment

end
end Grothe.UpperChaos.Q0CenteredIntegral
