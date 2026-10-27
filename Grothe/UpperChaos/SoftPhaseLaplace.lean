import Grothe.Haagerup.PhaseLaplace

/-!
# Finite softened phase as existing Laplace kernels

The log-grid mixture is a finite linear combination of the existing phase
Laplace kernels. Integral interchange explicitly requires integrability of
each term; no numerical approximation or tail bound is asserted.

Agent-ID: codex-cf82.
-/
open MeasureTheory

namespace Grothe.UpperChaos

noncomputable section

/-- The square-root factor converts the existing Laplace kernel into a Gaussian exponential. -/
theorem sqrt_mul_phaseLaplaceKernel (t : ℝ) (z : ℂ) (ht : 0 < t) :
    ((Real.sqrt t : ℝ) : ℂ) * Grothe.Haag.phaseLaplaceKernel z t =
      ((Real.exp (-(‖z‖ ^ 2 * t)) : ℝ) : ℂ) * z := by
  have hcancel : Real.sqrt t * t ^ (-(1 / 2 : ℝ)) = 1 := by
    rw [Real.rpow_neg ht.le, ← Real.sqrt_eq_rpow]
    exact mul_inv_cancel₀ (Real.sqrt_pos.mpr ht).ne'
  unfold Grothe.Haag.phaseLaplaceKernel
  calc
    _ = ((Real.sqrt t * (t ^ (-(1 / 2 : ℝ)) *
          Real.exp (-(‖z‖ ^ 2 * t))) : ℝ) : ℂ) * z := by push_cast; ring
    _ = _ := by rw [← mul_assoc, hcancel, one_mul]

/-- The finite Gaussian mixture used by the numerical experiment. -/
def finiteSoftPhase {ι : Type*} (S : Finset ι) (η h norm : ℝ)
    (t : ι → ℝ) (z : ℂ) : ℂ :=
  ∑ i ∈ S, ((h * Real.sqrt (t i) * Real.exp (-(η ^ 2 * t i)) /
    (Real.sqrt Real.pi * norm) : ℝ) : ℂ) *
      ((Real.exp (-(‖z‖ ^ 2 * t i)) : ℝ) : ℂ) * z

/-- The exact scalar multiplier for one log-grid term after conversion to a Laplace kernel. -/
def finiteSoftLaplaceWeight (η h norm t : ℝ) : ℝ :=
  h * t * Real.exp (-(η ^ 2 * t)) / (Real.sqrt Real.pi * norm)

/-- Every positive-scale mixture term is the existing phase kernel times its exact weight. -/
theorem finiteSoftPhase_eq_laplace {ι : Type*} (S : Finset ι) (η h norm : ℝ)
    (t : ι → ℝ) (ht : ∀ i ∈ S, 0 < t i) (z : ℂ) :
    finiteSoftPhase S η h norm t z =
      ∑ i ∈ S, (finiteSoftLaplaceWeight η h norm (t i) : ℂ) *
        Grothe.Haag.phaseLaplaceKernel z (t i) := by
  unfold finiteSoftPhase finiteSoftLaplaceWeight
  apply Finset.sum_congr rfl
  intro i hi
  have hs := sqrt_mul_phaseLaplaceKernel (t i) z (ht i hi)
  have hroot : Real.sqrt (t i) * Real.sqrt (t i) = t i :=
    Real.mul_self_sqrt (ht i hi).le
  have hweight : (h * Real.sqrt (t i) * Real.exp (-(η ^ 2 * t i)) /
      (Real.sqrt Real.pi * norm)) * Real.sqrt (t i) =
      h * t i * Real.exp (-(η ^ 2 * t i)) / (Real.sqrt Real.pi * norm) := by
    calc
      _ = h * (Real.sqrt (t i) * Real.sqrt (t i)) * Real.exp (-(η ^ 2 * t i)) /
          (Real.sqrt Real.pi * norm) := by ring
      _ = _ := by rw [hroot]
  calc
    _ = ((h * Real.sqrt (t i) * Real.exp (-(η ^ 2 * t i)) /
          (Real.sqrt Real.pi * norm) : ℝ) : ℂ) *
        (((Real.sqrt (t i) : ℝ) : ℂ) * Grothe.Haag.phaseLaplaceKernel z (t i)) := by
          rw [hs]; ring
    _ = _ := by
      rw [← mul_assoc, ← Complex.ofReal_mul, hweight]

/-- The logarithmic grid uses precisely the exponential weight in the numerical generator. -/
theorem finiteSoftPhase_logGrid (S : Finset ℤ) (η h norm : ℝ) (z : ℂ) :
    finiteSoftPhase S η h norm (fun i => Real.exp ((i : ℝ) * h)) z =
      ∑ i ∈ S, ((h * Real.exp ((i : ℝ) * h / 2) *
          Real.exp (-(η ^ 2 * Real.exp ((i : ℝ) * h))) /
          (Real.sqrt Real.pi * norm) : ℝ) : ℂ) *
        ((Real.exp (-(‖z‖ ^ 2 * Real.exp ((i : ℝ) * h))) : ℝ) : ℂ) * z := by
  unfold finiteSoftPhase
  apply Finset.sum_congr rfl
  intro i hi
  rw [← Real.exp_half]

/-- Interchanging the finite sum and an integral requires integrability of each existing kernel term. -/
theorem integral_mul_finiteSoftPhase {ι Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (S : Finset ι) (η h norm : ℝ) (t : ι → ℝ)
    (ht : ∀ i ∈ S, 0 < t i) (f z : Ω → ℂ)
    (hint : ∀ i ∈ S, Integrable (fun x => f x * Grothe.Haag.phaseLaplaceKernel (z x) (t i)) μ) :
    (∫ x, f x * finiteSoftPhase S η h norm t (z x) ∂μ) =
      ∑ i ∈ S, (finiteSoftLaplaceWeight η h norm (t i) : ℂ) *
        ∫ x, f x * Grothe.Haag.phaseLaplaceKernel (z x) (t i) ∂μ := by
  have hfun : (fun x => f x * finiteSoftPhase S η h norm t (z x)) =
      fun x => ∑ i ∈ S, (finiteSoftLaplaceWeight η h norm (t i) : ℂ) *
        (f x * Grothe.Haag.phaseLaplaceKernel (z x) (t i)) := by
    funext x
    rw [finiteSoftPhase_eq_laplace S η h norm t ht]
    simp only [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    ring
  rw [hfun, integral_finsetSum _ (fun i hi => (hint i hi).const_mul _)]
  simp_rw [integral_const_mul]

end
end Grothe.UpperChaos
