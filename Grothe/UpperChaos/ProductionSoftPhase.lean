import Grothe.UpperChaos.ProductionSmallBall
import Grothe.UpperChaos.ComparisonPieces
import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

/-! Softening the actual production phase has a linear Gaussian L² error.

The quadratic small-ball estimate controls the full error by layer cake,
including the phase singularity. Agent-ID: codex-b7f2.
-/

open MeasureTheory Set

namespace Grothe.UpperChaos
noncomputable section

/-- The phase regularized by a positive squared scale in the denominator. -/
def softPhase (η : ℝ) (z : ℂ) : ℂ :=
  z / (Real.sqrt (‖z‖ ^ 2 + η ^ 2) : ℂ)

/-- The softened phase of the actual production argument. -/
def softF0 (η : ℝ) (u : ℂ × ℂ) : ℂ := softPhase η (basePhaseArg u)

/-- The error between the actual base phase and its softening. -/
def softPhaseError (η : ℝ) (u : ℂ × ℂ) : ℂ := F0 u - softF0 η u

lemma measurable_softF0 (η : ℝ) : Measurable (softF0 η) := by
  unfold softF0 softPhase
  have h := continuous_basePhaseArg.measurable
  fun_prop

lemma measurable_softPhaseError (η : ℝ) : Measurable (softPhaseError η) :=
  measurable_F0.sub (measurable_softF0 η)

/-- The pointwise softening error is at most one, and its product with the
squared argument radius is at most `η²/2`. -/
theorem norm_phase_sub_softPhase_bounds (η : ℝ) (hη : 0 < η) (z : ℂ) :
    ‖Grothe.Haag.ph z - softPhase η z‖ ≤ 1 ∧
      ‖Grothe.Haag.ph z - softPhase η z‖ * ‖z‖ ^ 2 ≤ η ^ 2 / 2 := by
  by_cases hz : z = 0
  · simpa [hz, Grothe.Haag.ph, softPhase] using (show 0 ≤ η ^ 2 / 2 by positivity)
  have hR : 0 < ‖z‖ := norm_pos_iff.mpr hz
  have hB : 0 < Real.sqrt (‖z‖ ^ 2 + η ^ 2) := Real.sqrt_pos.mpr (by positivity)
  have hdef := sqrt_ratio_deficit_le (‖z‖ ^ 2) (η ^ 2)
    (sq_pos_of_pos hR) (sq_nonneg η)
  rw [Real.sqrt_sq (norm_nonneg z)] at hdef
  have hfactor : Grothe.Haag.ph z - softPhase η z =
      Grothe.Haag.ph z *
        ((1 - ‖z‖ / Real.sqrt (‖z‖ ^ 2 + η ^ 2) : ℝ) : ℂ) := by
    unfold Grothe.Haag.ph softPhase
    push_cast
    have hRc : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast hR.ne'
    have hBc : (Real.sqrt (‖z‖ ^ 2 + η ^ 2) : ℂ) ≠ 0 := by exact_mod_cast hB.ne'
    field_simp [hRc, hBc]
  have hunit : ‖Grothe.Haag.ph z‖ = 1 := by
    rw [Grothe.Haag.ph, norm_div, Complex.norm_real,
      Real.norm_of_nonneg (norm_nonneg z), div_self hR.ne']
  have he : ‖Grothe.Haag.ph z - softPhase η z‖ =
      1 - ‖z‖ / Real.sqrt (‖z‖ ^ 2 + η ^ 2) := by
    rw [hfactor, norm_mul, hunit, one_mul, Complex.norm_real,
      Real.norm_eq_abs, abs_of_nonneg hdef.1]
  rw [he]
  constructor
  · exact sub_le_self _ (div_nonneg hR.le hB.le)
  · have h := (le_div_iff₀ (show 0 < 2 * ‖z‖ ^ 2 by positivity)).mp hdef.2
    nlinarith

lemma norm_softPhaseError_bounds (η : ℝ) (hη : 0 < η) (u : ℂ × ℂ) :
    ‖softPhaseError η u‖ ≤ 1 ∧
      ‖softPhaseError η u‖ * ‖basePhaseArg u‖ ^ 2 ≤ η ^ 2 / 2 := by
  exact norm_phase_sub_softPhase_bounds η hη (basePhaseArg u)

lemma softPhaseError_memLp (η : ℝ) (hη : 0 < η) :
    MemLp (softPhaseError η) 2 mu2 :=
  MemLp.of_bound (measurable_softPhaseError η).aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun u => (norm_softPhaseError_bounds η hη u).1)

lemma integrable_softPhaseError_sq (η : ℝ) (hη : 0 < η) :
    Integrable (fun u => ‖softPhaseError η u‖ ^ 2) mu2 := by
  refine (integrable_const (1 : ℝ)).mono'
    ((measurable_softPhaseError η).norm.pow_const 2).aestronglyMeasurable
    (Filter.Eventually.of_forall fun u => ?_)
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  exact pow_le_one₀ (norm_nonneg _) (norm_softPhaseError_bounds η hη u).1

/-- The actual error's level sets are controlled by the production small-ball estimate. -/
theorem softPhaseError_tail (η : ℝ) (hη : 0 < η) (t : ℝ) (ht : 0 < t) :
    mu2.real {u : ℂ × ℂ | t ≤ ‖softPhaseError η u‖ ^ 2} ≤
      (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ)) := by
  let q : ℝ := Real.sqrt t
  let r : ℝ := Real.sqrt (η ^ 2 / (2 * q))
  have hq : 0 < q := Real.sqrt_pos.mpr ht
  have hq2 : q ^ 2 = t := Real.sq_sqrt ht.le
  have hfrac : 0 ≤ η ^ 2 / (2 * q) := by positivity
  have hr : 0 ≤ r := Real.sqrt_nonneg _
  have hr2 : r ^ 2 = η ^ 2 / (2 * q) := Real.sq_sqrt hfrac
  have hsub : {u : ℂ × ℂ | t ≤ ‖softPhaseError η u‖ ^ 2} ⊆
      {u : ℂ × ℂ | ‖basePhaseArg u‖ ≤ r} := by
    intro u hu
    have hδ : q ≤ ‖softPhaseError η u‖ := by
      change t ≤ ‖softPhaseError η u‖ ^ 2 at hu
      apply (sq_le_sq₀ hq.le (norm_nonneg _)).mp
      simpa only [hq2] using hu
    have hmul := mul_le_mul_of_nonneg_right hδ (sq_nonneg ‖basePhaseArg u‖)
    have hb := (norm_softPhaseError_bounds η hη u).2
    apply Real.le_sqrt_of_sq_le
    apply (le_div_iff₀ (show 0 < 2 * q by positivity)).2
    nlinarith
  calc
    _ ≤ mu2.real {u : ℂ × ℂ | ‖basePhaseArg u‖ ≤ r} := measureReal_mono hsub
    _ ≤ (100 / 9 : ℝ) * r ^ 2 := basePhaseArg_smallBall r hr
    _ = (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ)) := by
      rw [hr2, Real.rpow_neg ht.le, ← Real.sqrt_eq_rpow]
      dsimp [q]
      ring

/-- The entire squared softening error is at most `(100/9)η²`. -/
theorem integral_softPhaseError_sq_le (η : ℝ) (hη : 0 < η) :
    (∫ u, ‖softPhaseError η u‖ ^ 2 ∂mu2) ≤ (100 / 9 : ℝ) * η ^ 2 := by
  have hi := integrable_softPhaseError_sq η hη
  have hn : ∀ᵐ u ∂mu2, 0 ≤ ‖softPhaseError η u‖ ^ 2 :=
    Filter.Eventually.of_forall fun _ => sq_nonneg _
  have hb : ∀ᵐ u ∂mu2, ‖softPhaseError η u‖ ^ 2 ≤ 1 :=
    Filter.Eventually.of_forall fun u =>
      pow_le_one₀ (norm_nonneg _) (norm_softPhaseError_bounds η hη u).1
  rw [hi.integral_eq_integral_Ioc_meas_le hn hb]
  have hg : IntervalIntegrable
      (fun t : ℝ => (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ))) volume 0 1 :=
    (intervalIntegral.intervalIntegrable_rpow' (by norm_num : (-1 : ℝ) < -(1 / 2 : ℝ))).const_mul _
  calc
    _ ≤ ∫ t in Ioc (0 : ℝ) 1, (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ)) := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => measureReal_nonneg) hg.1
      filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
      exact softPhaseError_tail η hη t ht.1
    _ = (100 / 9 : ℝ) * η ^ 2 := by
      rw [← intervalIntegral.integral_of_le (by norm_num : (0 : ℝ) ≤ 1),
        intervalIntegral.integral_const_mul,
        integral_rpow (Or.inl (by norm_num : (-1 : ℝ) < -(1 / 2 : ℝ)))]
      norm_num
      ring

/-- Softening the actual production base phase costs at most `(10/3)η` in Gaussian L². -/
theorem norm_softPhaseError_le (η : ℝ) (hη : 0 < η) :
    ‖(softPhaseError_memLp η hη).toLp (softPhaseError η)‖ ≤ (10 / 3 : ℝ) * η := by
  have h : ‖(softPhaseError_memLp η hη).toLp (softPhaseError η)‖ ^ 2 ≤
      (100 / 9 : ℝ) * η ^ 2 := by
    rw [norm_toLp_sq_eq_integral]
    exact integral_softPhaseError_sq_le η hη
  apply (sq_le_sq₀ (norm_nonneg _) (by positivity : 0 ≤ (10 / 3 : ℝ) * η)).mp
  convert h using 1
  ring

/-- The fixed softening scale costs strictly less than the error reserve. -/
theorem norm_softPhaseError_cutoff_lt :
    ‖(softPhaseError_memLp (1 / 10 ^ 15) (by positivity)).toLp
      (softPhaseError (1 / 10 ^ 15))‖ < (5 / 10 ^ 15 : ℝ) :=
  (norm_softPhaseError_le _ (by positivity)).trans_lt (by norm_num)

/-- The actual Taylor source with only its base phase softened. -/
def softHpow (η : ℝ) (j : ℕ) (u : ℂ × ℂ) : ℂ :=
  (Complex.I * (phiT u : ℂ)) ^ j * softF0 η u

/-- The error in the actual Taylor source after softening its base phase. -/
def softTaylorError (η : ℝ) (j : ℕ) (u : ℂ × ℂ) : ℂ :=
  hpow j u - softHpow η j u

lemma softTaylorError_eq (η : ℝ) (j : ℕ) (u : ℂ × ℂ) :
    softTaylorError η j u =
      (Complex.I * (phiT u : ℂ)) ^ j * softPhaseError η u := by
  simp only [softTaylorError, hpow, softHpow, softPhaseError, mul_sub]

lemma measurable_softTaylorError (η : ℝ) (j : ℕ) : Measurable (softTaylorError η j) := by
  have hm := measurable_softPhaseError η
  have hp := continuous_phiT.measurable
  change Measurable (fun u => softTaylorError η j u)
  simp_rw [softTaylorError_eq]
  fun_prop

/-- The actual phase multiplier cannot increase the pointwise softening error. -/
theorem norm_softTaylorError_pointwise_le (η : ℝ) (j : ℕ) (u : ℂ × ℂ) :
    ‖softTaylorError η j u‖ ≤ ‖softPhaseError η u‖ := by
  rw [softTaylorError_eq, norm_mul, norm_pow, norm_mul, Complex.norm_I,
    one_mul, Complex.norm_real, Real.norm_eq_abs]
  simpa only [one_mul] using mul_le_mul_of_nonneg_right
    (pow_le_one₀ (abs_nonneg _) (phi_abs_lt_one u).le : |phiT u| ^ j ≤ 1)
    (norm_nonneg (softPhaseError η u))

lemma softTaylorError_memLp (η : ℝ) (hη : 0 < η) (j : ℕ) :
    MemLp (softTaylorError η j) 2 mu2 :=
  MemLp.of_bound (measurable_softTaylorError η j).aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun u =>
      (norm_softTaylorError_pointwise_le η j u).trans (norm_softPhaseError_bounds η hη u).1)

/-- The same full Gaussian L² error bound holds for every actual Taylor source. -/
theorem norm_softTaylorError_le (η : ℝ) (hη : 0 < η) (j : ℕ) :
    ‖(softTaylorError_memLp η hη j).toLp (softTaylorError η j)‖ ≤ (10 / 3 : ℝ) * η := by
  have h : ‖(softTaylorError_memLp η hη j).toLp (softTaylorError η j)‖ ^ 2 ≤
      (100 / 9 : ℝ) * η ^ 2 := by
    rw [norm_toLp_sq_eq_integral]
    refine le_trans ?_ (integral_softPhaseError_sq_le η hη)
    apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _)
      (integrable_softPhaseError_sq η hη)
    exact Filter.Eventually.of_forall fun u => by
      have hp := norm_softTaylorError_pointwise_le η j u
      have h1 := norm_nonneg (softTaylorError η j u)
      have h2 := norm_nonneg (softPhaseError η u)
      nlinarith
  apply (sq_le_sq₀ (norm_nonneg _) (by positivity : 0 ≤ (10 / 3 : ℝ) * η)).mp
  convert h using 1
  ring

/-- The fixed softening scale meets the reserve for every actual Taylor source. -/
theorem norm_softTaylorError_cutoff_lt (j : ℕ) :
    ‖(softTaylorError_memLp (1 / 10 ^ 15) (by positivity) j).toLp
      (softTaylorError (1 / 10 ^ 15) j)‖ < (5 / 10 ^ 15 : ℝ) :=
  (norm_softTaylorError_le _ (by positivity) j).trans_lt (by norm_num)

end
end Grothe.UpperChaos
