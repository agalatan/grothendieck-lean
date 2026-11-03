import Grothe.UpperChaos.ProductionPhaseModel
import Grothe.UpperChaos.ZeroProfilePhaseLinearization
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Gaussian L2 error propagation for the actual conditional production rounding.
The actual phase bound, measurable bounded phase model, and saved-model L2
discrepancy stay explicit. Agent-ID: codex-8c4d. -/

open MeasureTheory Grothe.LowerAnalytic
namespace Grothe.UpperChaos.ProductionPhaseL2Error
open ZeroProfilePhaseStability
noncomputable section

def slicePhase (s : ℝ) (w : ℂ) : ℝ := phiT ((Real.sqrt s : ℂ), w)
def roundingSlice (s : ℝ) (w : ℂ) : ℂ := Tround ((Real.sqrt s : ℂ), w)
def modelSlice (s : ℝ) (p : ℂ → ℝ) (w : ℂ) : ℂ := linearSlice s w * P3 (p w)
def phaseDifference (s : ℝ) (p : ℂ → ℝ) (w : ℂ) : ℂ :=
  ((slicePhase s w - p w : ℝ) : ℂ)

theorem measurable_slicePhase (s : ℝ) : Measurable (slicePhase s) :=
  continuous_phiT.measurable.comp (measurable_const.prodMk measurable_id)

theorem roundingSlice_memLp (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1) :
    MemLp (roundingSlice s) 2 gaussC := by
  apply MemLp.of_bound
    (measurable_Tround.comp (measurable_const.prodMk measurable_id)).aestronglyMeasurable 1
  exact Filter.Eventually.of_forall fun w =>
    norm_mul_P3_le_one (F0ConditionalNode.norm_phaseSlice_le_one s w) (hphase w)

theorem modelSlice_memLp (s : ℝ) (p : ℂ → ℝ) (hp : Measurable p)
    (hpb : ∀ w, |p w| ≤ 1) : MemLp (modelSlice s p) 2 gaussC := by
  have hlinear : MemLp (linearSlice s) 2 gaussC :=
    MemLp.ae_eq (linearSliceLp_coe s) (Lp.memLp (linearSliceLp s))
  have hm : Measurable (modelSlice s p) := by
    have hl : Measurable (linearSlice s) := by unfold linearSlice; fun_prop
    exact hl.mul (continuous_P3.measurable.comp hp)
  apply hlinear.of_le hm.aestronglyMeasurable
  filter_upwards [] with w
  change ‖linearSlice s w * P3 (p w)‖ ≤ ‖linearSlice s w‖
  rw [norm_mul]
  simpa only [mul_one] using
    mul_le_mul_of_nonneg_left (norm_P3_le_one_of_abs (hpb w)) (norm_nonneg _)

theorem phaseDifference_memLp (s : ℝ) (p : ℂ → ℝ) (hp : Measurable p)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (hpb : ∀ w, |p w| ≤ 1) :
    MemLp (phaseDifference s p) 2 gaussC := by
  have hm : Measurable (phaseDifference s p) :=
    Complex.continuous_ofReal.measurable.comp ((measurable_slicePhase s).sub hp)
  apply MemLp.of_bound hm.aestronglyMeasurable 2
  filter_upwards [] with w
  change ‖((slicePhase s w - p w : ℝ) : ℂ)‖ ≤ 2
  rw [Complex.norm_real, Real.norm_eq_abs]
  exact (abs_sub (slicePhase s w) (p w)).trans (by linarith [hphase w, hpb w])

def roundingSliceLp (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1) : Lp ℂ 2 gaussC :=
  (roundingSlice_memLp s hphase).toLp (roundingSlice s)

def modelSliceLp (s : ℝ) (p : ℂ → ℝ) (hp : Measurable p)
    (hpb : ∀ w, |p w| ≤ 1) : Lp ℂ 2 gaussC :=
  (modelSlice_memLp s p hp hpb).toLp (modelSlice s p)

def phaseDifferenceLp (s : ℝ) (p : ℂ → ℝ) (hp : Measurable p)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (hpb : ∀ w, |p w| ≤ 1) : Lp ℂ 2 gaussC :=
  (phaseDifference_memLp s p hp hphase hpb).toLp (phaseDifference s p)

private def normRepresentative (f : Lp ℂ 2 gaussC) : Lp ℝ 2 gaussC :=
  ((Lp.memLp f).norm).toLp (fun w => ‖f w‖)

private theorem normRepresentative_coe (f : Lp ℂ 2 gaussC) :
    ∀ᵐ w ∂gaussC, normRepresentative f w = ‖f w‖ := (Lp.memLp f).norm.coeFn_toLp

private theorem norm_normRepresentative (f : Lp ℂ 2 gaussC) :
    ‖normRepresentative f‖ = ‖f‖ := by
  rw [normRepresentative, Lp.norm_toLp, Lp.norm_def,
    eLpNorm_norm f (Lp.aestronglyMeasurable f)]

/-- The whole Gaussian vector pays the base remainder once. The phase error
is the actual L2 difference of explicit phase functions, not an assumed
coefficient accuracy statement. -/
theorem norm_roundingSliceLp_sub_model (s : ℝ) (hs : 0 < s) (p : ℂ → ℝ)
    (hp : Measurable p) (hphase : ∀ w, |slicePhase s w| ≤ 1)
    (hpb : ∀ w, |p w| ≤ 1) :
    ‖roundingSliceLp s hphase - modelSliceLp s p hp hpb‖ ≤
      5 * signedProfileRatio s ^ 2 + (5 / 2 : ℝ) * ‖phaseDifferenceLp s p hp hphase hpb‖ := by
  let f := roundingSliceLp s hphase
  let g := modelSliceLp s p hp hpb
  let base : Lp ℂ 2 gaussC := F0ConditionalNode.phaseSliceLp s - linearSliceLp s
  let e := phaseDifferenceLp s p hp hphase hpb
  let B := normRepresentative base
  let E := normRepresentative e
  let majorant : Lp ℝ 2 gaussC := B + (5 / 2 : ℝ) • E
  have hpoint : ∀ᵐ w ∂gaussC, ‖(f - g) w‖ ≤ ‖majorant w‖ := by
    filter_upwards [Lp.coeFn_sub f g,
      Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (linearSliceLp s),
      (roundingSlice_memLp s hphase).coeFn_toLp,
      (modelSlice_memLp s p hp hpb).coeFn_toLp,
      (phaseDifference_memLp s p hp hphase hpb).coeFn_toLp,
      (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp, linearSliceLp_coe s,
      normRepresentative_coe base, normRepresentative_coe e,
      Lp.coeFn_add B ((5 / 2 : ℝ) • E), Lp.coeFn_smul (5 / 2 : ℝ) E]
      with w hsub hbase hsrc hmodel herr hphasecoe hlinear hB hE hsum hsmul
    simp only [Pi.sub_apply] at hsub hbase
    simp only [Pi.add_apply] at hsum
    simp only [Pi.smul_apply] at hsmul
    have hb : base w = F0ConditionalNode.phaseSlice s w - linearSlice s w := by
      change (F0ConditionalNode.phaseSliceLp s - linearSliceLp s) w = _
      rw [hbase]
      change ((F0ConditionalNode.phaseSlice_memLp s).toLp _) w - linearSliceLp s w = _
      rw [hphasecoe, hlinear]
    have he : ‖e w‖ = |slicePhase s w - p w| := by
      change ‖((phaseDifference_memLp s p hp hphase hpb).toLp _) w‖ = _
      rw [herr]
      change ‖((slicePhase s w - p w : ℝ) : ℂ)‖ = _
      rw [Complex.norm_real, Real.norm_eq_abs]
    have hmajor : majorant w =
        ‖F0ConditionalNode.phaseSlice s w - linearSlice s w‖ +
          (5 / 2 : ℝ) * |slicePhase s w - p w| := by
      change (B + (5 / 2 : ℝ) • E) w = _
      rw [hsum, hsmul, hB, hE, hb, he, smul_eq_mul]
    have hnonneg : 0 ≤ majorant w := by rw [hmajor]; positivity
    rw [hsub]
    change ‖((roundingSlice_memLp s hphase).toLp _) w -
      ((modelSlice_memLp s p hp hpb).toLp _) w‖ ≤ _
    rw [hsrc, hmodel, Real.norm_eq_abs, abs_of_nonneg hnonneg, hmajor]
    exact PhasePolynomialStability.norm_base_mul_P3_sub
      (F0ConditionalNode.norm_phaseSlice_le_one s w) (hphase w) (hpb w)
  calc
    _ ≤ ‖majorant‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ ≤ ‖B‖ + ‖(5 / 2 : ℝ) • E‖ := norm_add_le _ _
    _ = ‖base‖ + (5 / 2 : ℝ) * ‖e‖ := by
      rw [norm_smul, norm_normRepresentative, norm_normRepresentative]
      norm_num
    _ ≤ _ := add_le_add (norm_phaseSliceLp_sub_linear s hs) le_rfl

/-- The actual saved-model L2 discrepancy is retained with coefficient one. -/
theorem norm_roundingSliceLp_sub_saved (s : ℝ) (hs : 0 < s) (p : ℂ → ℝ)
    (hp : Measurable p) (hphase : ∀ w, |slicePhase s w| ≤ 1)
    (hpb : ∀ w, |p w| ≤ 1) (saved : Lp ℂ 2 gaussC) :
    ‖roundingSliceLp s hphase - saved‖ ≤
      (5 * signedProfileRatio s ^ 2 +
        (5 / 2 : ℝ) * ‖phaseDifferenceLp s p hp hphase hpb‖) +
          ‖modelSliceLp s p hp hpb - saved‖ := by
  calc
    _ ≤ ‖roundingSliceLp s hphase - modelSliceLp s p hp hpb‖ +
        ‖modelSliceLp s p hp hpb - saved‖ := by
      simpa only [dist_eq_norm] using dist_triangle (roundingSliceLp s hphase)
        (modelSliceLp s p hp hpb) saved
    _ ≤ _ := add_le_add (norm_roundingSliceLp_sub_model s hs p hp hphase hpb) le_rfl

end
open Lean Elab Command
run_cmd do
  for target in #[``roundingSlice_memLp, ``modelSlice_memLp, ``phaseDifference_memLp,
      ``norm_roundingSliceLp_sub_model, ``norm_roundingSliceLp_sub_saved] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseL2Error
