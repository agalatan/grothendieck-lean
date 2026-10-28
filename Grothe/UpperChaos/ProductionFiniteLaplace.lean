import Grothe.UpperChaos.ProductionSoftPhase
import Grothe.UpperChaos.SoftPhaseLaplaceFubini
import Grothe.UpperChaos.LeanCertAuxiliaryCutoff

/-! A finite auxiliary integral approximates every actual production Taylor
source. The infinite auxiliary tail is bounded uniformly, including at zeros
of the phase argument and radial profile. Agent-ID: codex-aa04. -/

open MeasureTheory Set

namespace Grothe.UpperChaos
noncomputable section

/-- The softened phase with the auxiliary integral stopped at `T`. -/
def finiteLaplacePhase (η T : ℝ) (z : ℂ) : ℂ :=
  (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t in (0 : ℝ)..T, softPhaseLaplaceKernel η z t

/-- The difference from the softened phase is precisely the omitted integral. -/
theorem softPhase_sub_finiteLaplacePhase (η T : ℝ) (hη : 0 < η) (hT : 0 ≤ T)
    (z : ℂ) :
    softPhase η z - finiteLaplacePhase η T z =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t : ℝ in Ioi T, softPhaseLaplaceKernel η z t := by
  have hi := integrableOn_softPhaseLaplaceKernel η z
  have hs := intervalIntegral.integral_interval_add_Ioi hi
    (hi.mono_set (Ioi_subset_Ioi hT))
  rw [softPhase_eq_laplace η hη, finiteLaplacePhase, ← hs]
  ring

/-- The finite auxiliary cutoff error is uniform in the full complex argument. -/
theorem norm_softPhase_sub_finiteLaplacePhase_le (η T : ℝ) (hη : 0 < η)
    (hT : 0 ≤ T) (z : ℂ) :
    ‖softPhase η z - finiteLaplacePhase η T z‖ ≤ Real.exp (-(η ^ 2 * T)) := by
  rw [softPhase_sub_finiteLaplacePhase η T hη hT, norm_mul, norm_inv,
    Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  calc
    _ ≤ (Real.sqrt Real.pi)⁻¹ *
        ∫ t : ℝ in Ioi T, ‖softPhaseLaplaceKernel η z t‖ :=
      mul_le_mul_of_nonneg_left (norm_integral_le_integral_norm _) (by positivity)
    _ ≤ (Real.sqrt Real.pi)⁻¹ *
        (Real.exp (-(η ^ 2 * T)) * Real.sqrt Real.pi) :=
      mul_le_mul_of_nonneg_left
        (integral_norm_softPhaseLaplaceKernel_tail_le η z T hT) (by positivity)
    _ = _ := by field_simp [ne_of_gt (Real.sqrt_pos.2 Real.pi_pos)]

lemma measurable_finiteLaplacePhase (η T : ℝ) : Measurable (finiteLaplacePhase η T) := by
  have hm : Measurable (fun p : ℂ × ℝ => softPhaseLaplaceKernel η p.1 p.2) :=
    measurable_softPhaseLaplaceKernel η
  unfold finiteLaplacePhase intervalIntegral
  exact measurable_const.mul
    (hm.stronglyMeasurable.integral_prod_right'.measurable.sub
      hm.stronglyMeasurable.integral_prod_right'.measurable)

/-- The truncated response is still disk-valued; a Hilbert-space projection
alone would not give this pointwise property. -/
theorem norm_finiteLaplacePhase_le_one (η T : ℝ) (hT : 0 ≤ T) (z : ℂ) :
    ‖finiteLaplacePhase η T z‖ ≤ 1 := by
  rw [finiteLaplacePhase, intervalIntegral.integral_of_le hT, norm_mul, norm_inv,
    Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  have hi := (integrableOn_softPhaseLaplaceKernel η z).norm
  calc
    _ ≤ (Real.sqrt Real.pi)⁻¹ * ∫ t : ℝ in Ioc 0 T, ‖softPhaseLaplaceKernel η z t‖ :=
      mul_le_mul_of_nonneg_left (norm_integral_le_integral_norm _) (by positivity)
    _ ≤ (Real.sqrt Real.pi)⁻¹ * ∫ t : ℝ in Ioi 0, ‖softPhaseLaplaceKernel η z t‖ :=
      mul_le_mul_of_nonneg_left
        (setIntegral_mono_set hi (Filter.Eventually.of_forall fun _ => norm_nonneg _)
          (Filter.Eventually.of_forall Ioc_subset_Ioi_self)) (by positivity)
    _ ≤ (Real.sqrt Real.pi)⁻¹ * Real.sqrt Real.pi :=
      mul_le_mul_of_nonneg_left (integral_norm_softPhaseLaplaceKernel_le η z) (by positivity)
    _ = 1 := inv_mul_cancel₀ (ne_of_gt (Real.sqrt_pos.2 Real.pi_pos))

/-- The finite response is exactly the finite outer integral used by a coefficient
quadrature. Integrability is proved from the original source, not assumed of the result. -/
theorem integral_mul_finiteLaplacePhase {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] {P f : Ω → ℂ} (η T : ℝ) (hT : 0 ≤ T)
    (hPm : Measurable P) (hf : Measurable f) (hP : Integrable P μ) :
    (∫ u, P u * finiteLaplacePhase η T (f u) ∂μ) = (Real.sqrt Real.pi : ℂ)⁻¹ *
      ∫ t in (0 : ℝ)..T, ∫ u, P u * softPhaseLaplaceKernel η (f u) t ∂μ := by
  have hprod : Integrable (fun p : Ω × ℝ =>
      P p.1 * softPhaseLaplaceKernel η (f p.1) p.2)
      (μ.prod (volume.restrict (Ioc 0 T))) :=
    (integrable_mul_softPhaseLaplaceKernel μ η hPm hf hP).mono_measure
      (Measure.prod_mono le_rfl (Measure.restrict_mono Ioc_subset_Ioi_self le_rfl))
  simp only [finiteLaplacePhase, intervalIntegral.integral_of_le hT]
  calc
    _ = (Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ u, (∫ t : ℝ in Ioc 0 T, P u * softPhaseLaplaceKernel η (f u) t) ∂μ := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      refine Filter.Eventually.of_forall fun u => ?_
      rw [integral_const_mul]
      ring
    _ = _ := congrArg (fun z : ℂ => (Real.sqrt Real.pi : ℂ)⁻¹ * z)
      (integral_integral_swap hprod)

/-- The approximation preserves the actual phase multiplier at every Taylor order. -/
def finiteLaplaceHpow (η T : ℝ) (j : ℕ) (u : ℂ × ℂ) : ℂ :=
  (Complex.I * (phiT u : ℂ)) ^ j * finiteLaplacePhase η T (basePhaseArg u)

/-- Only the auxiliary tail, before adding the already-proved softening error. -/
def finiteLaplaceTailError (η T : ℝ) (j : ℕ) (u : ℂ × ℂ) : ℂ :=
  softHpow η j u - finiteLaplaceHpow η T j u

lemma measurable_finiteLaplaceTailError (η T : ℝ) (j : ℕ) :
    Measurable (finiteLaplaceTailError η T j) := by
  have hp := continuous_phiT.measurable
  have hf := (measurable_finiteLaplacePhase η T).comp continuous_basePhaseArg.measurable
  have hs := measurable_softF0 η
  unfold finiteLaplaceTailError softHpow finiteLaplaceHpow
  fun_prop

theorem norm_finiteLaplaceTailError_pointwise_le (η T : ℝ) (hη : 0 < η)
    (hT : 0 ≤ T) (j : ℕ) (u : ℂ × ℂ) :
    ‖finiteLaplaceTailError η T j u‖ ≤ Real.exp (-(η ^ 2 * T)) := by
  have he : finiteLaplaceTailError η T j u =
      (Complex.I * (phiT u : ℂ)) ^ j *
        (softPhase η (basePhaseArg u) - finiteLaplacePhase η T (basePhaseArg u)) := by
    simp only [finiteLaplaceTailError, softHpow, finiteLaplaceHpow, softF0, mul_sub]
  rw [he, norm_mul, norm_pow, norm_mul, Complex.norm_I, one_mul,
    Complex.norm_real, Real.norm_eq_abs]
  calc
    _ ≤ 1 * ‖softPhase η (basePhaseArg u) - finiteLaplacePhase η T (basePhaseArg u)‖ :=
      mul_le_mul_of_nonneg_right
        (pow_le_one₀ (abs_nonneg _) (phi_abs_lt_one u).le) (norm_nonneg _)
    _ ≤ _ := by simpa using norm_softPhase_sub_finiteLaplacePhase_le η T hη hT _

lemma finiteLaplaceTailError_memLp (η T : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    MemLp (finiteLaplaceTailError η T j) 2 mu2 :=
  MemLp.of_bound (measurable_finiteLaplaceTailError η T j).aestronglyMeasurable
    (Real.exp (-(η ^ 2 * T)))
    (Filter.Eventually.of_forall fun u => norm_finiteLaplaceTailError_pointwise_le η T hη hT j u)

/-- Uniform pointwise control gives a full Gaussian L² bound, with no omitted modes. -/
theorem norm_finiteLaplaceTailError_le (η T : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    ‖(finiteLaplaceTailError_memLp η T hη hT j).toLp (finiteLaplaceTailError η T j)‖ ≤
      Real.exp (-(η ^ 2 * T)) := by
  apply (sq_le_sq₀ (norm_nonneg _) (Real.exp_pos _).le).mp
  rw [norm_toLp_sq_eq_integral]
  calc
    _ ≤ ∫ _u : ℂ × ℂ, (Real.exp (-(η ^ 2 * T))) ^ 2 ∂mu2 := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _)
        (integrable_const _)
      exact Filter.Eventually.of_forall fun u =>
        pow_le_pow_left₀ (norm_nonneg _) (norm_finiteLaplaceTailError_pointwise_le η T hη hT j u) 2
    _ = _ := by simp

/-- The whole error between the actual source and the finite auxiliary integral. -/
def finiteLaplaceError (η T : ℝ) (j : ℕ) (u : ℂ × ℂ) : ℂ :=
  hpow j u - finiteLaplaceHpow η T j u

lemma finiteLaplaceError_eq_add (η T : ℝ) (j : ℕ) :
    finiteLaplaceError η T j = softTaylorError η j + finiteLaplaceTailError η T j := by
  funext u
  simp only [finiteLaplaceError, softTaylorError, finiteLaplaceTailError, Pi.add_apply]
  abel

lemma finiteLaplaceError_memLp (η T : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    MemLp (finiteLaplaceError η T j) 2 mu2 := by
  rw [finiteLaplaceError_eq_add]
  exact (softTaylorError_memLp η hη j).add (finiteLaplaceTailError_memLp η T hη hT j)

/-- The full L² error is the sum of a linear softening cost and an exponential tail. -/
theorem norm_finiteLaplaceError_le (η T : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    ‖(finiteLaplaceError_memLp η T hη hT j).toLp (finiteLaplaceError η T j)‖ ≤
      (10 / 3 : ℝ) * η + Real.exp (-(η ^ 2 * T)) := by
  rw [finiteLaplaceError_eq_add, MemLp.toLp_add]
  exact (norm_add_le _ _).trans (add_le_add (norm_softTaylorError_le η hη j)
    (norm_finiteLaplaceTailError_le η T hη hT j))

/-- Production choices: softening `10⁻¹⁵`, with `η²T = 40`. -/
def finiteLaplaceEta : ℝ := 1 / 10 ^ 15

def finiteLaplaceCutoff : ℝ := 40 * 10 ^ 30

lemma finiteLaplaceEta_pos : 0 < finiteLaplaceEta := by norm_num [finiteLaplaceEta]

lemma finiteLaplaceCutoff_nonneg : 0 ≤ finiteLaplaceCutoff := by norm_num [finiteLaplaceCutoff]

/-- The fixed finite integral meets the entire softening-plus-truncation reserve. -/
theorem norm_finiteLaplaceError_cutoff_lt (j : ℕ) :
    ‖(finiteLaplaceError_memLp finiteLaplaceEta finiteLaplaceCutoff
      finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).toLp
      (finiteLaplaceError finiteLaplaceEta finiteLaplaceCutoff j)‖ < (5 / 10 ^ 15 : ℝ) := by
  have h := norm_finiteLaplaceError_le finiteLaplaceEta finiteLaplaceCutoff
    finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j
  have he : finiteLaplaceEta ^ 2 * finiteLaplaceCutoff = 40 := by
    norm_num [finiteLaplaceEta, finiteLaplaceCutoff]
  rw [he] at h
  exact h.trans_lt (by have := exp_neg_forty_le; norm_num [finiteLaplaceEta] at *; linarith)

/-- Every retained Hermite band inherits the same bound after production smoothing. -/
theorem norm_projOn_smooth_finiteLaplaceError_cutoff_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B (smoothOp ((finiteLaplaceError_memLp finiteLaplaceEta finiteLaplaceCutoff
      finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg j).toLp
      (finiteLaplaceError finiteLaplaceEta finiteLaplaceCutoff j)))‖ < (5 / 10 ^ 15 : ℝ) :=
  ((modeSpace B).norm_starProjection_apply_le _).trans_lt
    ((norm_smoothOp_le _).trans_lt (norm_finiteLaplaceError_cutoff_lt j))

end
end Grothe.UpperChaos
