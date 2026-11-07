import Grothe.UpperQuad.GaussianShiftIntegral
import Grothe.UpperQuad.PolynomialHermiteNorm

/-!
# Integrable domination of the fixed-phase Gaussian kernel

Finite Mehler bounds control the shifted polynomial, while the production phase bound is
uniform in the Gaussian variable. On bounded parameter sets their product grows at most as
`exp(normSq w / 2)`, which is integrable for the normalized complex Gaussian.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open MeasureTheory Complex MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.UpperChaos.HermiteTranslation

noncomputable section

local notation "ε" => (Grothe.Upper.phaseEpsQ : ℝ)

private theorem coordinate_sq_sum_le {z : ℂ} {R : ℝ} (hz : ‖z‖ ≤ R) :
    z.re ^ 2 + z.im ^ 2 ≤ R ^ 2 := by
  have h := pow_le_pow_left₀ (norm_nonneg z) hz 2
  rw [← Complex.normSq_eq_norm_sq] at h
  simpa only [Complex.normSq_apply, pow_two] using h

/-- The small Mehler parameter leaves half the Gaussian decay for later factors. -/
theorem shifted_mehlerExp_re_le {A : ℂ} {R : ℝ} (hA : ‖A‖ ≤ R) (w : ℂ) :
    (Mehler.mehlerExp (1 / 7)
      ((w.re : ℂ) - A + I * (w.im : ℂ))
      ((w.re : ℂ) - A - I * (w.im : ℂ))).re ≤ normSq w / 2 + R ^ 2 := by
  have hm := FinitePolynomialMehler.mehlerExp_pair_re (1 / 7)
    (by norm_num) (by norm_num) 1 ((w.re : ℂ) - A) (w.im : ℂ)
  norm_num only [Complex.ofReal_one, one_mul, Complex.sub_re, Complex.ofReal_re,
    Complex.sub_im, Complex.ofReal_im, sub_zero, zero_sub, neg_sq, zero_pow,
    add_zero] at hm
  rw [hm, Complex.normSq_apply]
  have hA2 := coordinate_sq_sum_le hA
  nlinarith [sq_nonneg (w.re + A.re), sq_nonneg w.im, sq_nonneg A.re,
    sq_nonneg A.im]

/-- Any fixed polynomial has a uniform Gaussian envelope under bounded complex shifts. -/
theorem exists_polynomial_shift_majorant (P : CPoly) (R : ℝ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ A : ℂ, ‖A‖ ≤ R → ∀ w : ℂ,
      ‖eval ![(w.re : ℂ) - A + I * (w.im : ℂ),
        (w.re : ℂ) - A - I * (w.im : ℂ)] P‖ ≤ C * Real.exp (normSq w / 4) := by
  let B : ℝ := ‖PolynomialHermite.polynomialLp P‖ ^ 2 *
    (((1 / 7 : ℝ) ^ P.totalDegree)⁻¹ * (1 - (1 / 7 : ℝ) ^ 2)⁻¹)
  have hB : 0 ≤ B := by dsimp [B]; positivity
  refine ⟨Real.sqrt B * Real.exp (R ^ 2 / 2), by positivity, ?_⟩
  intro A hA w
  have hm := PolynomialHermite.norm_eval_sq_le P (le_refl P.totalDegree)
    (1 / 7) (by norm_num) (by norm_num)
    ((w.re : ℂ) - A + I * (w.im : ℂ)) ((w.re : ℂ) - A - I * (w.im : ℂ))
  have hs : ‖eval ![(w.re : ℂ) - A + I * (w.im : ℂ),
      (w.re : ℂ) - A - I * (w.im : ℂ)] P‖ ^ 2 ≤
      B * Real.exp (normSq w / 2 + R ^ 2) := by
    calc
      _ ≤ B * Real.exp (Mehler.mehlerExp (1 / 7)
          ((w.re : ℂ) - A + I * (w.im : ℂ))
          ((w.re : ℂ) - A - I * (w.im : ℂ))).re := by
        simpa only [B, mul_assoc] using hm
      _ ≤ _ := mul_le_mul_of_nonneg_left
        (Real.exp_le_exp.mpr (shifted_mehlerExp_re_le hA w)) hB
  have h := Real.le_sqrt_of_sq_le hs
  rw [Real.sqrt_mul hB, ← Real.exp_half] at h
  calc
    _ ≤ Real.sqrt B * Real.exp ((normSq w / 2 + R ^ 2) / 2) := h
    _ = (Real.sqrt B * Real.exp (R ^ 2 / 2)) * Real.exp (normSq w / 4) := by
      rw [mul_assoc, ← Real.exp_add]
      congr 2
      ring

/-- The entire Gaussian correction consumes only another quarter of the Gaussian decay. -/
theorem norm_translation_exponential_le {A : ℂ} {R : ℝ} (hA : ‖A‖ ≤ R) (w : ℂ) :
    ‖Complex.exp (-A ^ 2 + 2 * A * (w.re : ℂ))‖ ≤
      Real.exp (5 * R ^ 2) * Real.exp (normSq w / 4) := by
  rw [Complex.norm_exp, ← Real.exp_add]
  apply Real.exp_le_exp.mpr
  have hA2 := coordinate_sq_sum_le hA
  norm_num only [Complex.add_re, Complex.neg_re, Complex.mul_re, Complex.mul_im,
    Complex.ofReal_re, Complex.ofReal_im, Complex.re_ofNat, Complex.im_ofNat,
    pow_two, Complex.normSq_apply]
  nlinarith [sq_nonneg (w.re / 2 - 2 * A.re), sq_nonneg A.re, sq_nonneg A.im,
    sq_nonneg w.im]

/-- The continued phase power is uniformly bounded on every bounded parameter set. -/
theorem exists_phase_shift_majorant (j : ℕ) (hj : 0 < j) (R : ℝ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ r A : ℂ, ‖r‖ ≤ R → ‖A‖ ≤ R → ∀ w : ℂ,
      ‖(I * PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - A)) ^ j‖ ≤ C := by
  let B : ℝ := ((1 / 2 : ℝ) ^ (35 * j))⁻¹ * ((1 - (1 / 2 : ℝ)) ^ 2)⁻¹ *
    Real.exp (16 * ((j : ℝ) * ε) * R ^ 2)
  have hε : 0 ≤ ε := by norm_num [Grothe.Upper.phaseEpsQ]
  refine ⟨Real.sqrt B, Real.sqrt_nonneg _, ?_⟩
  intro r A hr hA w
  have hr2 := coordinate_sq_sum_le hr
  have hA2 := coordinate_sq_sum_le hA
  have hsum : r.im ^ 2 + A.im ^ 2 ≤ 2 * R ^ 2 := by
    nlinarith [sq_nonneg r.re, sq_nonneg A.re]
  have he : 4 * ((j : ℝ) * ε) / (1 - (1 / 2 : ℝ)) *
      (r.im ^ 2 + A.im ^ 2) ≤ 16 * ((j : ℝ) * ε) * R ^ 2 := by
    calc
      _ ≤ (4 * ((j : ℝ) * ε) / (1 - (1 / 2 : ℝ))) * (2 * R ^ 2) :=
        mul_le_mul_of_nonneg_left hsum (by positivity)
      _ = _ := by ring
  have h := PhasePolynomialComplex.norm_phaseComplex_pow_sq_le j hj w.im
    (τ := 1 / 2) (by norm_num) (by norm_num) r ((w.re : ℂ) - A)
  simp only [Complex.sub_im, Complex.ofReal_im, zero_sub, neg_sq] at h
  have hs : ‖PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - A) ^ j‖ ^ 2 ≤ B :=
    h.trans (mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr he) (by positivity))
  simpa only [norm_pow, norm_mul, Complex.norm_I, one_mul] using
    Real.le_sqrt_of_sq_le hs

/-- One integrable Gaussian envelope works uniformly on bounded sets of both parameters. -/
theorem exists_fixedPhaseIntegrand_majorant (j : ℕ) (hj : 0 < j) (i : ℕ × ℕ) (R : ℝ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ r A : ℂ, ‖r‖ ≤ R → ‖A‖ ≤ R → ∀ w : ℂ,
      ‖fixedPhaseIntegrand j r A i w‖ ≤ C * Real.exp (normSq w / 2) := by
  obtain ⟨Cp, hCp, hp⟩ := exists_polynomial_shift_majorant
    (conjP (normalizedPolynomial i)) R
  obtain ⟨Cf, hCf, hf⟩ := exists_phase_shift_majorant j hj R
  refine ⟨Cp * Cf * Real.exp (5 * R ^ 2), by positivity, ?_⟩
  intro r A hr hA w
  have hpoly := hp A hA w
  have hphase := hf r A hr hA w
  have hgauss := norm_translation_exponential_le hA w
  have hph := Haag.norm_ph_le w
  simp only [fixedPhaseIntegrand, norm_mul]
  calc
    _ ≤ ((1 * (Cp * Real.exp (normSq w / 4))) * Cf) *
        (Real.exp (5 * R ^ 2) * Real.exp (normSq w / 4)) := by
      exact mul_le_mul
        (mul_le_mul (mul_le_mul hph hpoly (norm_nonneg _) (by norm_num)) hphase
          (norm_nonneg _) (by positivity)) hgauss (norm_nonneg _) (by positivity)
    _ = (Cp * Cf * Real.exp (5 * R ^ 2)) * Real.exp (normSq w / 2) := by
      rw [show normSq w / 2 = normSq w / 4 + normSq w / 4 by ring, Real.exp_add]
      ring

/-- Every positive-power fixed-phase kernel is genuinely Gaussian-integrable. -/
theorem integrable_fixedPhaseIntegrand (j : ℕ) (hj : 0 < j) (r A : ℂ) (i : ℕ × ℕ) :
    Integrable (fixedPhaseIntegrand j r A i) gaussC := by
  obtain ⟨C, _, hC⟩ := exists_fixedPhaseIntegrand_majorant j hj i (max ‖r‖ ‖A‖)
  have hmajorant := (GaussianGrowth.integrable_exp_normSq (1 / 2) (by norm_num)).const_mul C
  refine hmajorant.mono' (measurable_fixedPhaseIntegrand j r A i).aestronglyMeasurable ?_
  filter_upwards [] with w
  simpa only [one_div, div_eq_mul_inv, mul_comm, one_mul] using
    hC r A (le_max_left _ _) (le_max_right _ _) w

end

end Grothe.UpperQuad.GaussianShift
