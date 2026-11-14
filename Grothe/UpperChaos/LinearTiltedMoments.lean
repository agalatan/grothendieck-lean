import Grothe.UpperChaos.ShiftedDampedMoments
import Mathlib.MeasureTheory.Group.Integral

/-!
# Mixed moments under a real linear Gaussian tilt

Complete the square once for an arbitrary measurable complex source, then
reuse the finite shifted-moment evaluator. These are identities of totalized
integrals, accompanied by integrability for every finite polynomial insertion.
Joint integrability across dependent source variables is still needed for Fubini.

Agent-ID: codex-2ca4.
-/

open MeasureTheory Real Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.LinearTiltedMoments

noncomputable section

/-- The translation for the source `2 * Re(a*z)`. -/
def mean (rate : ℝ) (a : ℂ) : ℂ := ((rate⁻¹ : ℝ) : ℂ) * conj a

/-- Translation cancels the linear source without changing the radial rate. -/
theorem complete_square {rate : ℝ} (hrate : 0 < rate) (a z : ℂ) :
    -rate * Complex.normSq (z + mean rate a) +
        2 * (a * (z + mean rate a)).re =
      -rate * Complex.normSq z + Complex.normSq a / rate := by
  simp only [mean, Complex.normSq_apply, Complex.add_re, Complex.add_im,
    Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im,
    Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
  field_simp [hrate.ne']
  ring

private theorem density_translation {rate : ℝ} (hrate : 0 < rate) (a z : ℂ) :
    (π⁻¹ * Real.exp (-Complex.normSq (z + mean rate a))) *
        Real.exp (-(rate - 1) * Complex.normSq (z + mean rate a) +
          2 * (a * (z + mean rate a)).re) =
      Real.exp (Complex.normSq a / rate) *
        (π⁻¹ * Real.exp (-Complex.normSq z) *
          Real.exp (-(rate - 1) * Complex.normSq z)) := by
  have hradial : Real.exp (-Complex.normSq z) *
      Real.exp (-(rate - 1) * Complex.normSq z) =
        Real.exp (-rate * Complex.normSq z) := by
    rw [← Real.exp_add]
    congr 1
    ring
  calc
    _ = π⁻¹ * Real.exp (-rate * Complex.normSq (z + mean rate a) +
        2 * (a * (z + mean rate a)).re) := by
      rw [mul_assoc, ← Real.exp_add]
      congr 2
      ring
    _ = π⁻¹ * (Real.exp (-rate * Complex.normSq z) *
        Real.exp (Complex.normSq a / rate)) := by
      rw [complete_square hrate, Real.exp_add]
    _ = _ := by
      rw [mul_assoc π⁻¹, hradial]
      ring

/-- A single translation formula for every measurable complex source.
The Gaussian normalization and the factor `exp(normSq a / rate)` are explicit. -/
theorem integral_linear_tilt (F : ℂ → ℂ) (hF : Measurable F)
    {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    (∫ z : ℂ, F z *
      (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ)
        ∂gaussC) =
      (Real.exp (Complex.normSq a / rate) : ℂ) *
        ∫ z : ℂ, F (z + mean rate a) *
          (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC := by
  let G : ℂ → ℂ := fun z => F z *
    (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ)
  let H : ℂ → ℂ := fun z => F (z + mean rate a) *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  let c : ℂ := (Real.exp (Complex.normSq a / rate) : ℂ)
  have hG : Measurable G := by dsimp only [G]; fun_prop
  have hH : Measurable H := by dsimp only [H]; fun_prop
  have hpoint (z : ℂ) :
      (π⁻¹ * Real.exp (-Complex.normSq (z + mean rate a))) • G (z + mean rate a) =
        c * ((π⁻¹ * Real.exp (-Complex.normSq z)) • H z) := by
    have h := congrArg (fun x : ℝ => (x : ℂ) * F (z + mean rate a))
      (density_translation hrate a z)
    dsimp only [G, H, c]
    simp only [Complex.real_smul, Complex.ofReal_mul] at h ⊢
    convert h using 1 <;> ring
  change (∫ z, G z ∂gaussC) = c * ∫ z, H z ∂gaussC
  calc
    _ = ∫ z : ℂ, (π⁻¹ * Real.exp (-Complex.normSq z)) • G z :=
      integral_gaussC_eq_volume_complex G hG
    _ = ∫ z : ℂ, (π⁻¹ * Real.exp (-Complex.normSq (z + mean rate a))) •
        G (z + mean rate a) :=
      (integral_add_right_eq_self (μ := (volume : Measure ℂ))
        (fun z : ℂ => (π⁻¹ * Real.exp (-Complex.normSq z)) • G z)
        (mean rate a)).symm
    _ = ∫ z : ℂ, c * ((π⁻¹ * Real.exp (-Complex.normSq z)) • H z) :=
      integral_congr_ae (Filter.Eventually.of_forall hpoint)
    _ = c * ∫ z : ℂ, (π⁻¹ * Real.exp (-Complex.normSq z)) • H z :=
      integral_const_mul c _
    _ = c * ∫ z, H z ∂gaussC := by
      rw [← integral_gaussC_eq_volume_complex H hH]

/-- Polynomial insertion becomes the existing finite shifted Wick sum. -/
theorem integral_mixed_moment (p q : ℕ) {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    (∫ z : ℂ, z ^ p * conj z ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ)
        ∂gaussC) =
      (Real.exp (Complex.normSq a / rate) : ℂ) *
        shiftedDampedMoment rate (mean rate a) p q := by
  rw [integral_linear_tilt (fun z : ℂ => z ^ p * conj z ^ q) (by fun_prop) hrate a,
    integral_shifted_moment_damped p q (mean rate a) hrate]

/-- Absorb an arbitrary linear tilt into half of the positive Gaussian rate. -/
theorem linear_tilt_le_half_rate {rate : ℝ} (hrate : 0 < rate) (a z : ℂ) :
    Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) ≤
      Real.exp (Complex.normSq a / (rate / 2)) *
        Real.exp (-((rate / 2) - 1) * Complex.normSq z) := by
  have hhalf : 0 < rate / 2 := half_pos hrate
  have hsquare := complete_square hhalf a (z - mean (rate / 2) a)
  rw [sub_add_cancel] at hsquare
  have hnonneg : 0 ≤ (rate / 2) * Complex.normSq (z - mean (rate / 2) a) :=
    mul_nonneg hhalf.le (Complex.normSq_nonneg _)
  rw [← Real.exp_add]
  apply Real.exp_le_exp.mpr
  nlinarith

/-- Mixed polynomial monomials with an arbitrary real linear tilt are genuinely
integrable. The majorant uses the already proved positive-rate damped moments. -/
theorem integrable_mixed_moment (p q : ℕ) {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    Integrable (fun z : ℂ => z ^ p * conj z ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ))
      gaussC := by
  have hmajorant := (integrable_monomial_damped p q (half_pos hrate)).norm.const_mul
    (Real.exp (Complex.normSq a / (rate / 2)))
  refine hmajorant.mono' (by fun_prop) (Filter.Eventually.of_forall fun z => ?_)
  have h := mul_le_mul_of_nonneg_left (linear_tilt_le_half_rate hrate a z)
    (norm_nonneg (z ^ p * conj z ^ q))
  simpa only [norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (Real.exp_pos _), mul_assoc, mul_left_comm] using h

/-- Every finite polynomial insertion is integrable under a positive-rate tilt. -/
theorem integrable_finite_mixed_polynomial {ι : Type*} (s : Finset ι)
    (c : ι → ℂ) (p q : ι → ℕ) {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    Integrable (fun z : ℂ => (∑ i ∈ s, c i * (z ^ p i * conj z ^ q i)) *
      (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ))
      gaussC := by
  classical
  have hi : Integrable (fun z : ℂ => ∑ i ∈ s, c i *
      (z ^ p i * conj z ^ q i *
        (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ)))
      gaussC :=
    integrable_finsetSum s fun i _ =>
      (integrable_mixed_moment (p i) (q i) hrate a).const_mul (c i)
  refine hi.congr (Filter.Eventually.of_forall fun z => ?_)
  simp only [Finset.sum_mul, mul_assoc]

/-- A finite polynomial insertion is evaluated by the same shifted Wick sums.
Linearity is used after translation, where every damped shifted monomial
already has an integrability proof. Joint-source integrability for a subsequent
Fubini step remains a separate obligation. -/
theorem integral_finite_mixed_polynomial {ι : Type*} (s : Finset ι)
    (c : ι → ℂ) (p q : ι → ℕ) {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    (∫ z : ℂ, (∑ i ∈ s, c i * (z ^ p i * conj z ^ q i)) *
      (Real.exp (-(rate - 1) * Complex.normSq z + 2 * (a * z).re) : ℂ)
        ∂gaussC) =
      (Real.exp (Complex.normSq a / rate) : ℂ) *
        ∑ i ∈ s, c i * shiftedDampedMoment rate (mean rate a) (p i) (q i) := by
  classical
  rw [integral_linear_tilt
    (fun z : ℂ => ∑ i ∈ s, c i * (z ^ p i * conj z ^ q i))
    (by fun_prop) hrate a]
  congr 1
  simp_rw [Finset.sum_mul, mul_assoc]
  rw [integral_finsetSum s fun i _ => by
    simpa only [mul_assoc] using
      (integrable_shifted_monomial_damped (p i) (q i) (mean rate a) hrate).const_mul (c i)]
  refine Finset.sum_congr rfl fun i hi => ?_
  rw [integral_const_mul]
  congr 1
  simpa only [mul_assoc] using
    integral_shifted_moment_damped (p i) (q i) (mean rate a) hrate

end
end Grothe.UpperChaos.LinearTiltedMoments
