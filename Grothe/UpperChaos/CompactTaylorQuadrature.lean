import Grothe.UpperChaos.ProductionCompactLaplace
import Grothe.UpperChaos.TaylorQuadrature
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts

/-!
# Finite rectangular quadrature of the actual Taylor sources

The compact source is the existing radial and auxiliary truncation. Its Hermite
pairing is exactly the integral of the production regular Wick evaluator on a
finite rectangle. The already proved compact-source error therefore controls
the difference from the original Gaussian coefficient, including all omitted
domains. The interior numerical enclosure is a separate proof obligation.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos
noncomputable section

/-- The retained source region restricts only the first Gaussian coordinate. -/
theorem compactTaylorRegion_eq (L : ℝ) :
    (TaylorRadialTail.cutoffSet L)ᶜ = {z : ℂ | ‖z‖ ^ 2 ≤ L} ×ˢ univ := by
  ext u
  simp [TaylorRadialTail.cutoffSet, not_lt]

/-- Squared-radius Gaussian integration with a finite radial cutoff. -/
theorem integral_gaussC_norm_sq_cut_complex (f : ℝ → ℂ) (hf : Measurable f) (L : ℝ) :
    (∫ z in {z : ℂ | ‖z‖ ^ 2 ≤ L}, f (‖z‖ ^ 2) ∂gaussC) =
      ∫ s in Ioc (0 : ℝ) L, (Real.exp (-s) : ℂ) * f s := by
  have hm : MeasurableSet {z : ℂ | ‖z‖ ^ 2 ≤ L} :=
    (isClosed_le (continuous_norm.pow 2) continuous_const).measurableSet
  rw [← integral_indicator hm]
  have he : ({z : ℂ | ‖z‖ ^ 2 ≤ L}.indicator (fun z => f (‖z‖ ^ 2))) =
      fun z => (Iic L).indicator f (‖z‖ ^ 2) := by
    funext z
    by_cases hz : ‖z‖ ^ 2 ≤ L <;> simp [hz]
  rw [he, integral_gaussC_norm_sq_complex ((Iic L).indicator f)
    (hf.indicator measurableSet_Iic)]
  calc
    _ = ∫ s in Ioi (0 : ℝ),
        (Iic L).indicator (fun s => (Real.exp (-s) : ℂ) * f s) s := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro s _hs
      by_cases hs : s ≤ L <;> simp [hs]
    _ = _ := by
      rw [setIntegral_indicator measurableSet_Iic]
      rfl

/-- The conditional Wick integral on the retained first-coordinate disk. -/
theorem integral_taylorConditionalWick_compact_eq_radial (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (t L : ℝ) (ht : 0 < t) :
    (∫ z in {z : ℂ | ‖z‖ ^ 2 ≤ L}, taylorConditionalWick j N a t z ∂gaussC) =
      ∫ s in Ioc (0 : ℝ) L, (Real.exp (-s) : ℂ) *
        taylorConditionalWick j N a t (Real.sqrt s : ℂ) := by
  have hm := (measurable_taylorConditionalWick j N a t ht).comp
    (Complex.measurable_ofReal.comp Real.continuous_sqrt.measurable)
  calc
    _ = ∫ z in {z : ℂ | ‖z‖ ^ 2 ≤ L},
        taylorConditionalWick j N a t (Real.sqrt (‖z‖ ^ 2) : ℂ) ∂gaussC := by
      apply integral_congr_ae
      filter_upwards [] with z
      rw [Real.sqrt_sq (norm_nonneg z)]
      exact taylorConditionalWick_eq_norm j N a t ht z
    _ = _ := integral_gaussC_norm_sq_cut_complex _ hm L

/-- Absolute Fubini evaluates the second Gaussian coordinate after radial truncation. -/
theorem integral_taylorInnerSource_compact_kernel (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) (t L : ℝ) (ht : 0 < t) :
    (∫ u in (TaylorRadialTail.cutoffSet L)ᶜ,
      taylorInnerSource j (gradedHermiteFn N a) u *
        Haag.phaseLaplaceKernel (basePhaseArgument u) t ∂mu2) =
      ∫ z in {z : ℂ | ‖z‖ ^ 2 ≤ L}, taylorConditionalWick j N a t z ∂gaussC := by
  let hc : ChargeFn (gradedHermiteFn N a) :=
    ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
      gradedHermiteFn_rot2 N a⟩
  have hi := (integrable_taylorInnerSource_kernel phiBound hc j t ht).restrict
    (s := (TaylorRadialTail.cutoffSet L)ᶜ)
  rw [compactTaylorRegion_eq, mu2, ← Measure.restrict_prod_eq_prod_univ] at hi ⊢
  rw [integral_prod _ hi]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun z =>
    integral_taylorInnerSource_conditional j N a t z ht

/-- The actual compact source pairing is a finite auxiliary/radial Wick integral. -/
theorem integral_gradedHermite_compactLaplace_eq_wick (η T L : ℝ)
    (hT : 0 ≤ T) (hL : 0 ≤ L) (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    (∫ u, conj (gradedHermiteFn N a u) * compactLaplaceHpow η T L j u ∂mu2) =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t in (0 : ℝ)..T,
        (Real.exp (-(η ^ 2 * t)) : ℂ) * ∫ s in (0 : ℝ)..L,
          (Real.exp (-s) : ℂ) * taylorConditionalWick j N a t (Real.sqrt s : ℂ) := by
  let hc : ChargeFn (gradedHermiteFn N a) :=
    ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
      gradedHermiteFn_rot2 N a⟩
  have hS := (TaylorRadialTail.measurableSet_cutoffSet L).compl
  have he : (∫ u, conj (gradedHermiteFn N a u) * compactLaplaceHpow η T L j u ∂mu2) =
      ∫ u in (TaylorRadialTail.cutoffSet L)ᶜ,
        taylorInnerSource j (gradedHermiteFn N a) u *
          finiteLaplacePhase η T (basePhaseArgument u) ∂mu2 := by
    rw [← integral_indicator hS]
    apply integral_congr_ae
    refine Filter.Eventually.of_forall fun u => ?_
    by_cases hu : u ∈ TaylorRadialTail.cutoffSet L
    · simp [compactLaplaceHpow, hu]
    · simp [compactLaplaceHpow, hu, finiteLaplaceHpow, taylorInnerSource,
        taylorPhasePower, basePhaseArg, basePhaseArgument, mul_assoc]
  rw [he, integral_mul_finiteLaplacePhase (mu2.restrict (TaylorRadialTail.cutoffSet L)ᶜ)
    η T hT (measurable_taylorInnerSource hc j) measurable_basePhaseArgument
    (integrable_taylorInnerSource phiBound hc j).restrict]
  congr 1
  apply intervalIntegral.integral_congr_Ioo_of_le hT
  intro t ht
  dsimp only
  have hs : (∫ u in (TaylorRadialTail.cutoffSet L)ᶜ,
      taylorInnerSource j (gradedHermiteFn N a) u *
        softPhaseLaplaceKernel η (basePhaseArgument u) t ∂mu2) =
      (Real.exp (-(η ^ 2 * t)) : ℂ) *
        ∫ u in (TaylorRadialTail.cutoffSet L)ᶜ,
          taylorInnerSource j (gradedHermiteFn N a) u *
            Haag.phaseLaplaceKernel (basePhaseArgument u) t ∂mu2 := by
    rw [← integral_const_mul]
    apply setIntegral_congr_fun hS
    intro u _hu
    unfold softPhaseLaplaceKernel
    ring
  rw [hs, integral_taylorInnerSource_compact_kernel j N a t L ht.1,
    integral_taylorConditionalWick_compact_eq_radial j N a t L ht.1,
    intervalIntegral.integral_of_le hL]

/-- The square change of variables on a finite interval needs no endpoint regularity. -/
theorem integral_auxiliary_square_interval (f : ℝ → ℂ) (U : ℝ) (hU : 0 ≤ U) :
    (∫ t in (0 : ℝ)..U ^ 2, f t) =
      ∫ u in (0 : ℝ)..U, (2 * u : ℂ) * f (u ^ 2) := by
  have h := intervalIntegral.integral_deriv_smul_comp_of_deriv_nonneg
    (f := fun u : ℝ => u ^ 2) (f' := fun u : ℝ => 2 * u) (g := f)
    (a := 0) (b := U) (by fun_prop)
    (by intro u _hu; simpa using (hasDerivAt_pow 2 u))
    (by
      intro u hu
      have hu0 : 0 < u := by simpa [min_eq_left hU] using hu.1
      exact mul_nonneg (by norm_num) hu0.le)
  simpa only [Function.comp_apply, zero_pow (by decide : (2 : ℕ) ≠ 0),
    Complex.real_smul, Complex.ofReal_mul, Complex.ofReal_ofNat] using h.symm

/-- The complete finite rectangle, in the regular auxiliary and squared-radius variables. -/
def compactTaylorQuadratureValue (η T L : ℝ) (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) : ℂ :=
  (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ u in (0 : ℝ)..Real.sqrt T,
    ∫ s in (0 : ℝ)..L, taylorQuadratureKernel η j N a u s

/-- The production rectangle has rational endpoints in both integration variables. -/
theorem compactTaylorQuadratureValue_eq_dyadic (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80 j N a =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ u in (0 : ℝ)..(2 ^ 53 : ℝ),
        ∫ s in (0 : ℝ)..80, taylorQuadratureKernel finiteLaplaceEta j N a u s := by
  rw [compactTaylorQuadratureValue, sqrt_finiteLaplaceCutoff, finiteLaplaceEndpoint]

/-- The finite-rectangle evaluator is exactly the compact production coefficient. -/
theorem integral_gradedHermite_compactLaplace_eq_quadrature (η T L : ℝ)
    (hT : 0 ≤ T) (hL : 0 ≤ L) (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    (∫ u, conj (gradedHermiteFn N a u) * compactLaplaceHpow η T L j u ∂mu2) =
      compactTaylorQuadratureValue η T L j N a := by
  rw [integral_gradedHermite_compactLaplace_eq_wick η T L hT hL j N a]
  unfold compactTaylorQuadratureValue
  congr 1
  have hs := integral_auxiliary_square_interval
    (fun t => (Real.exp (-(η ^ 2 * t)) : ℂ) * ∫ s in (0 : ℝ)..L,
      (Real.exp (-s) : ℂ) * taylorConditionalWick j N a t (Real.sqrt s : ℂ))
    (Real.sqrt T) (Real.sqrt_nonneg T)
  rw [Real.sq_sqrt hT] at hs
  rw [hs]
  apply intervalIntegral.integral_congr_Ioo_of_le (Real.sqrt_nonneg T)
  intro u hu
  dsimp only
  rw [← intervalIntegral.integral_const_mul, ← intervalIntegral.integral_const_mul]
  apply intervalIntegral.integral_congr_Ioo_of_le hL
  intro s _hs
  dsimp only
  rw [taylorQuadratureKernel, taylorRegularWick_eq j N a u hu.1]
  ring

lemma compactLaplaceHpow_memLp (η T L : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    MemLp (compactLaplaceHpow η T L j) 2 mu2 := by
  have he : compactLaplaceHpow η T L j = hpow j - compactLaplaceError η T L j := by
    funext u
    simp only [compactLaplaceError, Pi.sub_apply]
    abel
  rw [he]
  exact (chargeFn_hpow phiBound j).memLp.sub (compactLaplaceError_memLp η T L hη hT j)

theorem toLp_compactLaplaceError (η T L : ℝ) (hη : 0 < η) (hT : 0 ≤ T) (j : ℕ) :
    (compactLaplaceError_memLp η T L hη hT j).toLp (compactLaplaceError η T L j) =
      (chargeFn_hpow phiBound j).memLp.toLp (hpow j) -
        (compactLaplaceHpow_memLp η T L hη hT j).toLp (compactLaplaceHpow η T L j) :=
  MemLp.toLp_sub (chargeFn_hpow phiBound j).memLp (compactLaplaceHpow_memLp η T L hη hT j)

/-- The finite evaluator lives in the same Gaussian Hilbert-space pairing as the endpoint. -/
theorem inner_gradedHermite_compactLaplace_eq_quadrature (η T L : ℝ)
    (hη : 0 < η) (hT : 0 ≤ T) (hL : 0 ≤ L) (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a,
      (compactLaplaceHpow_memLp η T L hη hT j).toLp (compactLaplaceHpow η T L j)⟫_ℂ =
        compactTaylorQuadratureValue η T L j N a := by
  rw [← toLp_gradedHermiteFn N a,
    inner_toLp2 (memLp_gradedHermiteFn N a) (compactLaplaceHpow_memLp η T L hη hT j)]
  exact integral_gradedHermite_compactLaplace_eq_quadrature η T L hT hL j N a

/-- All softening and omitted-domain errors are included in the production coefficient reserve. -/
theorem norm_inner_hpow_sub_compactQuadrature_cutoff_le (j N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) :
    ‖⟪gradedHermite N a, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80 j N a‖ ≤
        ‖gradedHermite N a‖ * (5 / 10 ^ 15 : ℝ) := by
  rw [← inner_gradedHermite_compactLaplace_eq_quadrature finiteLaplaceEta
    finiteLaplaceCutoff 80 finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg (by norm_num) j N a,
    ← inner_sub_right, ← toLp_compactLaplaceError _ _ _ finiteLaplaceEta_pos
      finiteLaplaceCutoff_nonneg j]
  exact (norm_inner_le_norm _ _).trans
    (mul_le_mul_of_nonneg_left (norm_compactLaplaceError_cutoff_lt j).le (norm_nonneg _))

end
end Grothe.UpperChaos
