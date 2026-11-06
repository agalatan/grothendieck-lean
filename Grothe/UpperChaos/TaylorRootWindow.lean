import Grothe.UpperChaos.ZeroProfilePhaseLinearization
import Grothe.UpperChaos.Q0FiniteVectorError
import Grothe.UpperChaos.ComparisonPieces

/-!
# Root-window approximation of the Taylor sources

Multiplication by `(iφ)^j` is a contraction on each Gaussian slice. The signed linear
approximation of the base phase therefore approximates every actual Taylor source with the
same quadratic error. Bessel bounds the whole finite conditional Hermite vector at once,
without a factor for the number of modes. These estimates include the profile zeros.

Agent-ID: codex-2f3d. Refs #334, #41.
-/

namespace Grothe.UpperChaos.TaylorRootWindow

open MeasureTheory Grothe.LowerAnalytic ZeroProfilePhaseStability F0ConditionalNode
open scoped InnerProductSpace ComplexConjugate

noncomputable section

/-- The actual multiplier of the unscaled Taylor source on a radial slice. -/
def multiplier (j : ℕ) (s : ℝ) (w : ℂ) : ℂ :=
  (Complex.I * (phiT ((Real.sqrt s : ℂ), w) : ℂ)) ^ j

lemma measurable_multiplier (j : ℕ) (s : ℝ) : Measurable (multiplier j s) := by
  exact (measurable_const.mul (Complex.continuous_ofReal.measurable.comp
    (continuous_phiT.measurable.comp (measurable_const.prodMk measurable_id)))).pow_const j

lemma norm_multiplier_le_one (j : ℕ) (s : ℝ) (w : ℂ) :
    ‖multiplier j s w‖ ≤ 1 := by
  simp only [multiplier, norm_pow, norm_mul, Complex.norm_I, one_mul, Complex.norm_real,
    Real.norm_eq_abs]
  exact pow_le_one₀ (abs_nonneg _) (phi_abs_lt_one _).le

/-- The signed linear phase model, multiplied by the actual Taylor multiplier. -/
def model (j : ℕ) (s : ℝ) (w : ℂ) : ℂ := multiplier j s w * linearSlice s w

/-- The actual Taylor source minus its linear phase model. -/
def residual (j : ℕ) (s : ℝ) (w : ℂ) : ℂ :=
  hpow j ((Real.sqrt s : ℂ), w) - model j s w

lemma residual_eq (j : ℕ) (s : ℝ) (w : ℂ) :
    residual j s w = multiplier j s w * (phaseSlice s w - linearSlice s w) := by
  simp only [residual, model, multiplier, hpow, phaseSlice, mul_sub]

lemma measurable_residual (j : ℕ) (s : ℝ) : Measurable (residual j s) := by
  change Measurable (fun w ↦ residual j s w)
  simp_rw [residual_eq]
  apply (measurable_multiplier j s).mul
  apply (measurable_phaseSlice s).sub
  unfold linearSlice
  fun_prop

lemma norm_residual_le (j : ℕ) (s : ℝ) (w : ℂ) :
    ‖residual j s w‖ ≤ ‖phaseSlice s w - linearSlice s w‖ := by
  rw [residual_eq, norm_mul]
  simpa only [one_mul] using mul_le_mul_of_nonneg_right
    (norm_multiplier_le_one j s w) (norm_nonneg _)

lemma residual_memLp (j : ℕ) (s : ℝ) : MemLp (residual j s) 2 gaussC := by
  have hl : MemLp (linearSlice s) 2 gaussC :=
    MemLp.ae_eq (linearSliceLp_coe s) (Lp.memLp (linearSliceLp s))
  exact ((phaseSlice_memLp s).sub hl).of_le
    (measurable_residual j s).aestronglyMeasurable
    (Filter.Eventually.of_forall (norm_residual_le j s))

/-- The actual Taylor residual on one Gaussian slice, as an `L²` vector. -/
def residualLp (j : ℕ) (s : ℝ) : Lp ℂ 2 gaussC :=
  (residual_memLp j s).toLp (residual j s)

/-- Every Taylor power has the same quadratic root-window error as the base phase. -/
theorem norm_residualLp_le (j : ℕ) (s : ℝ) (hs : 0 < s) :
    ‖residualLp j s‖ ≤ 5 * signedProfileRatio s ^ 2 := by
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖residualLp j s w‖ ≤ ‖(phaseSliceLp s - linearSliceLp s) w‖ := by
    filter_upwards [(residual_memLp j s).coeFn_toLp,
      Lp.coeFn_sub (phaseSliceLp s) (linearSliceLp s),
      (phaseSlice_memLp s).coeFn_toLp, linearSliceLp_coe s] with w hr hd hp hl
    change ‖((residual_memLp j s).toLp _) w‖ ≤ _
    rw [hr, hd]
    change ‖residual j s w‖ ≤ ‖((phaseSlice_memLp s).toLp _) w - linearSliceLp s w‖
    rw [hp, hl]
    exact norm_residual_le j s w
  exact (Lp.norm_le_norm_of_ae_le hpoint).trans (norm_phaseSliceLp_sub_linear s hs)

/-- The coefficient of the true Taylor source on the conditional Gaussian slice. -/
def coefficient (j : ℕ) (s : ℝ) (i : ℕ × ℕ) : ℂ :=
  ∫ w, conj (hfun i w) * hpow j ((Real.sqrt s : ℂ), w) ∂gaussC

/-- The coefficient of the explicit signed linear phase model. -/
def modelCoefficient (j : ℕ) (s : ℝ) (i : ℕ × ℕ) : ℂ :=
  ∫ w, conj (hfun i w) * model j s w ∂gaussC

lemma source_memLp (j : ℕ) (s : ℝ) :
    MemLp (fun w ↦ hpow j ((Real.sqrt s : ℂ), w)) 2 gaussC := by
  apply (phaseSlice_memLp s).of_le
  · exact ((chargeFn_hpow phiBound j).meas.comp
      (measurable_const.prodMk measurable_id)).aestronglyMeasurable
  · filter_upwards [] with w
    change ‖multiplier j s w * phaseSlice s w‖ ≤ _
    rw [norm_mul]
    simpa only [one_mul] using mul_le_mul_of_nonneg_right
      (norm_multiplier_le_one j s w) (norm_nonneg _)

lemma model_memLp (j : ℕ) (s : ℝ) : MemLp (model j s) 2 gaussC := by
  have he : model j s = (fun w ↦ hpow j ((Real.sqrt s : ℂ), w)) - residual j s := by
    funext w
    simp only [Pi.sub_apply, residual, sub_sub_cancel]
  rw [he]
  exact (source_memLp j s).sub (residual_memLp j s)

lemma coefficient_sub_model_eq_inner (j : ℕ) (s : ℝ) (i : ℕ × ℕ) :
    coefficient j s i - modelCoefficient j s i = ⟪hvec i, residualLp j s⟫_ℂ := by
  rw [hvec, residualLp, inner_toLp]
  simp only [coefficient, modelCoefficient, residual, mul_sub]
  exact (integral_sub ((memLp_hfun i).star.integrable_mul (source_memLp j s))
    ((memLp_hfun i).star.integrable_mul (model_memLp j s))).symm

/-- The entire finite vector of conditional coefficient errors has a quadratic radius,
independently of the number of selected modes and with no nonzero-profile assumption. -/
theorem coefficient_error_sq_le (j : ℕ) (s : ℝ) (hs : 0 < s) (S : Finset (ℕ × ℕ)) :
    ∑ i ∈ S, ‖coefficient j s i - modelCoefficient j s i‖ ^ 2 ≤
      (5 * signedProfileRatio s ^ 2) ^ 2 := by
  exact Q0FiniteVectorError.finite_orthonormal_sample_error hvec orthonormal_hvec
    (residualLp j s) S (fun i ↦ coefficient j s i - modelCoefficient j s i)
    (5 * signedProfileRatio s ^ 2) (by positivity) (norm_residualLp_le j s hs)
    (fun i _ ↦ coefficient_sub_model_eq_inner j s i)

end

end Grothe.UpperChaos.TaylorRootWindow

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound,
    `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  for target in #[``Grothe.UpperChaos.TaylorRootWindow.norm_residualLp_le,
      ``Grothe.UpperChaos.TaylorRootWindow.coefficient_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
