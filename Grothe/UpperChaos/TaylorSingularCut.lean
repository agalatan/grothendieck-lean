import Grothe.UpperChaos.ProductionSmallBall
import Grothe.UpperChaos.ComparisonPieces
import Mathlib.MeasureTheory.Function.LpSeminorm.Indicator

/-! Removing the phase singularity has a proved error in the original Gaussian
L² space, for every production Taylor source. Agent-ID: codex-2ca4. -/

open MeasureTheory

namespace Grothe.UpperChaos.TaylorSingularCut
noncomputable section

/-- The disk around the actual phase singularity. -/
def singularSet (r : ℝ) : Set (ℂ × ℂ) := {u | ‖basePhaseArg u‖ ≤ r}

lemma measurableSet_singularSet (r : ℝ) : MeasurableSet (singularSet r) :=
  measurableSet_le continuous_basePhaseArg.norm.measurable measurable_const

/-- The part of the Taylor source removed when excising the singular disk. -/
def source (r : ℝ) (j : ℕ) : ℂ × ℂ → ℂ := (singularSet r).indicator (hpow j)

lemma source_memLp (r : ℝ) (j : ℕ) : MemLp (source r j) 2 mu2 :=
  (chargeFn_hpow phiBound j).memLp.indicator (measurableSet_singularSet r)

lemma norm_hpow_le_one (j : ℕ) (u : ℂ × ℂ) : ‖hpow j u‖ ≤ 1 := by
  have hp : |phiT u| ≤ 1 := (phi_abs_lt_one u).le
  rw [hpow, norm_mul, norm_pow, norm_mul, Complex.norm_I, one_mul,
    Complex.norm_real, Real.norm_eq_abs]
  exact (mul_le_mul (pow_le_one₀ (abs_nonneg _) hp) (Grothe.Haag.norm_ph_le _)
    (norm_nonneg _) zero_le_one).trans_eq (one_mul 1)

/-- The exact production source has squared excision error at most `(100/9)r²`. -/
theorem norm_source_sq_le (r : ℝ) (hr : 0 ≤ r) (j : ℕ) :
    ‖(source_memLp r j).toLp (source r j)‖ ^ 2 ≤ (100 / 9 : ℝ) * r ^ 2 := by
  rw [norm_toLp_sq_eq_integral]
  have hI : Integrable ((singularSet r).indicator (fun _ => (1 : ℝ))) mu2 :=
    (integrable_const 1).indicator (measurableSet_singularSet r)
  calc
    _ ≤ ∫ u, (singularSet r).indicator (fun _ => (1 : ℝ)) u ∂mu2 := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _) hI
      exact Filter.Eventually.of_forall fun u => by
        by_cases hu : u ∈ singularSet r
        · simp only [source, Set.indicator_of_mem hu]
          nlinarith [norm_hpow_le_one j u, norm_nonneg (hpow j u)]
        · simp [source, hu]
    _ = mu2.real (singularSet r) := integral_indicator_one (measurableSet_singularSet r)
    _ ≤ _ := basePhaseArg_smallBall r hr

/-- The excision bound applies to the base source too (`j = 0`). -/
theorem norm_source_le (r : ℝ) (hr : 0 ≤ r) (j : ℕ) :
    ‖(source_memLp r j).toLp (source r j)‖ ≤ (10 / 3 : ℝ) * r := by
  have h := norm_source_sq_le r hr j
  have hpos : 0 ≤ (10 / 3 : ℝ) * r := mul_nonneg (by norm_num) hr
  nlinarith [norm_nonneg ((source_memLp r j).toLp (source r j))]

/-- A fixed singular cutoff has L² error strictly less than the allocated tolerance. -/
theorem norm_source_cutoff_lt (j : ℕ) :
    ‖(source_memLp (1 / 10 ^ 15) j).toLp (source (1 / 10 ^ 15) j)‖ < (5 / 10 ^ 15 : ℝ) :=
  (norm_source_le _ (by positivity) j).trans_lt (by norm_num)

/-- Every retained Hermite band inherits the same actual singular-cut error. -/
theorem norm_projOn_source_cutoff_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B ((source_memLp (1 / 10 ^ 15) j).toLp (source (1 / 10 ^ 15) j))‖ <
      (5 / 10 ^ 15 : ℝ) :=
  ((modeSpace B).norm_starProjection_apply_le _).trans_lt (norm_source_cutoff_lt j)

/-- Smoothing and then selecting a band cannot increase this contribution. -/
theorem norm_projOn_smooth_source_cutoff_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B (smoothOp ((source_memLp (1 / 10 ^ 15) j).toLp (source (1 / 10 ^ 15) j)))‖ <
      (5 / 10 ^ 15 : ℝ) :=
  ((modeSpace B).norm_starProjection_apply_le _).trans_lt
    ((norm_smoothOp_le _).trans_lt (norm_source_cutoff_lt j))

end
end Grothe.UpperChaos.TaylorSingularCut
