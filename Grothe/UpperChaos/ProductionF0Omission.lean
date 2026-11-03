import Grothe.UpperChaos.ProductionF0Head
import Grothe.UpperChaos.TaylorRadialIntegral
import Grothe.UpperChaos.ExponentialTail
import Grothe.Upper.CompositeComparisonData
import Lean.Util.CollectAxioms

/-! Continuous omission of actual F₀ on exceptional radial panels.
This Gaussian L² cost is paid once before coefficientwise estimates. It is
separate from finite exceptional-node arithmetic and from the far tail.
The measurable region, its radius bound and its width remain explicit.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Set Grothe.LowerAnalytic

namespace Grothe.UpperChaos.FixedChaosSmoothing.F0Omission
noncomputable section

def radialSet (S : Set ℝ) : Set ℂ := {z | ‖z‖ ^ 2 ∈ S}
def sourceSet (S : Set ℝ) : Set (ℂ × ℂ) := radialSet S ×ˢ univ
def source (S : Set ℝ) : ℂ × ℂ → ℂ := (sourceSet S).indicator F0
def massQ : ℚ := (8 / 10 ^ 16) / 400000

theorem measurableSet_radialSet {S : Set ℝ} (hS : MeasurableSet S) :
    MeasurableSet (radialSet S) :=
  hS.preimage (continuous_norm.pow 2).measurable

theorem measurableSet_sourceSet {S : Set ℝ} (hS : MeasurableSet S) :
    MeasurableSet (sourceSet S) :=
  (measurableSet_radialSet hS).prod MeasurableSet.univ

theorem memLp_source {S : Set ℝ} (hS : MeasurableSet S) :
    MemLp (source S) 2 mu2 :=
  memLp_baseF0.indicator (measurableSet_sourceSet hS)

/-- The omitted and regular sources partition the actual phase exactly. -/
theorem base_sub_regular {S : Set ℝ} (hS : MeasurableSet S) :
    memLp_baseF0.toLp F0 - (memLp_source hS.compl).toLp (source Sᶜ) =
      (memLp_source hS).toLp (source S) := by
  rw [← MemLp.toLp_sub]
  apply MemLp.toLp_congr
  filter_upwards [] with u
  by_cases hu : ‖u.1‖ ^ 2 ∈ S <;>
    simp [source, sourceSet, radialSet, hu]

/-- Continuous Gaussian probability, without any quadrature weight. -/
theorem measure_radialSet {S : Set ℝ} (hS : MeasurableSet S)
    (hpos : S ⊆ Ioi (0 : ℝ)) :
    gaussC.real (radialSet S) = ∫ s in S, Real.exp (-s) := by
  apply Complex.ofReal_injective
  calc
    _ = ∫ z : ℂ, (radialSet S).indicator (fun _ => (1 : ℂ)) z ∂gaussC := by
      simp [integral_indicator_const, measurableSet_radialSet hS]
    _ = ∫ z : ℂ, S.indicator (fun _ => (1 : ℂ)) (‖z‖ ^ 2) ∂gaussC := by
      apply integral_congr_ae
      filter_upwards [] with z
      by_cases hz : ‖z‖ ^ 2 ∈ S <;> simp [radialSet, hz]
    _ = ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) *
        S.indicator (fun _ => (1 : ℂ)) s :=
      integral_gaussC_norm_sq_complex _ (measurable_const.indicator hS)
    _ = ∫ s in Ioi (0 : ℝ), S.indicator (fun s => (Real.exp (-s) : ℂ)) s := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro s hs
      by_cases hm : s ∈ S <;> simp [hm]
    _ = ∫ s in S, (Real.exp (-s) : ℂ) := by
      rw [setIntegral_indicator hS, inter_eq_right.mpr hpos]
    _ = _ := (integral_complex_ofReal (f := fun s => Real.exp (-s))
      (μ := volume.restrict S))

theorem density_le_of_thirteen {s : ℝ} (hs : 13 ≤ s) :
    Real.exp (-s) ≤ (1 / 400000 : ℝ) := by
  have he : (27 / 10 : ℝ) < Real.exp 1 := by linarith [Real.exp_one_gt_d9]
  have hp : (400000 : ℝ) < Real.exp 13 := by
    calc
      _ < (27 / 10 : ℝ) ^ 13 := by norm_num
      _ < (Real.exp 1) ^ 13 := by gcongr
      _ = _ := by rw [← Real.exp_nat_mul]; norm_num
  have hn : Real.exp (-13) < (1 / 400000 : ℝ) := by
    simpa only [Real.exp_neg, one_div] using
      one_div_lt_one_div_of_lt (by norm_num : (0 : ℝ) < 400000) hp
  exact (Real.exp_le_exp.mpr (neg_le_neg hs)).trans hn.le

/-- Thin panels beyond squared radius 13 have small continuous mass. -/
theorem measure_sourceSet_le {S : Set ℝ} (hS : MeasurableSet S)
    (h13 : S ⊆ Ici (13 : ℝ))
    (hwidth : volume S ≤ ENNReal.ofReal (8 / 10 ^ 16 : ℝ)) :
    mu2.real (sourceSet S) ≤ (massQ : ℝ) := by
  have hpos : S ⊆ Ioi (0 : ℝ) := fun s hs => by
    have hs13 : (13 : ℝ) ≤ s := h13 hs
    change 0 < s
    linarith
  have hfinite : volume S ≠ ⊤ :=
    ne_of_lt (hwidth.trans_lt ENNReal.ofReal_lt_top)
  have harea : volume.real S ≤ (8 / 10 ^ 16 : ℝ) := by
    exact (ENNReal.toReal_mono ENNReal.ofReal_ne_top hwidth).trans_eq
      (ENNReal.toReal_ofReal (by positivity))
  have hc : IntegrableOn (fun _s : ℝ => (1 / 400000 : ℝ)) S :=
    integrableOn_const hfinite
  have hi : (∫ s in S, Real.exp (-s)) ≤ volume.real S * (1 / 400000 : ℝ) := by
    calc
      _ ≤ ∫ _s : ℝ in S, (1 / 400000 : ℝ) := by
        apply integral_mono_of_nonneg
          (Filter.Eventually.of_forall fun s => (Real.exp_pos (-s)).le) hc
        filter_upwards [ae_restrict_mem hS] with s hs
        exact density_le_of_thirteen (h13 hs)
      _ = _ := by rw [setIntegral_const, smul_eq_mul]
  have hm : mu2.real (sourceSet S) = gaussC.real (radialSet S) := by
    simp [sourceSet, mu2, measureReal_prod_prod]
  rw [hm, measure_radialSet hS hpos]
  calc
    _ ≤ (8 / 10 ^ 16 : ℝ) * (1 / 400000 : ℝ) :=
      hi.trans (mul_le_mul_of_nonneg_right harea (by positivity))
    _ = (massQ : ℝ) := by norm_num [massQ]

/-- The actual phase is bounded by one on every measurable omitted region. -/
theorem norm_source_sq_le_mass {S : Set ℝ} (hS : MeasurableSet S) :
    ‖(memLp_source hS).toLp (source S)‖ ^ 2 ≤ mu2.real (sourceSet S) := by
    rw [norm_toLp_sq_eq_integral]
    have hI : Integrable ((sourceSet S).indicator (fun _ => (1 : ℝ))) mu2 :=
      (integrable_const 1).indicator (measurableSet_sourceSet hS)
    calc
      _ ≤ ∫ u, (sourceSet S).indicator (fun _ => (1 : ℝ)) u ∂mu2 := by
        apply integral_mono_of_nonneg
          (Filter.Eventually.of_forall fun _ => sq_nonneg _) hI
        filter_upwards [] with u
        by_cases hu : u ∈ sourceSet S
        · simp only [source, Set.indicator_of_mem hu]
          have hF : ‖F0 u‖ ≤ 1 := Grothe.Haag.norm_ph_le _
          nlinarith [hF, norm_nonneg (F0 u)]
        · simp [source, hu]
      _ = _ := integral_indicator_one (measurableSet_sourceSet hS)
/-- The omitted actual phase costs at most 45e-12 for the whole vector,
independently of the number of retained Hermite coefficients. -/
theorem norm_source_le {S : Set ℝ} (hS : MeasurableSet S)
    (h13 : S ⊆ Ici (13 : ℝ))
    (hwidth : volume S ≤ ENNReal.ofReal (8 / 10 ^ 16 : ℝ)) :
    ‖(memLp_source hS).toLp (source S)‖ ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) := by
  have hm := measure_sourceSet_le hS h13 hwidth
  have hn : (massQ : ℝ) ≤ (Upper.CompositeComparisonData.massNormQ : ℝ) ^ 2 := by
    norm_num [massQ, Upper.CompositeComparisonData.massNormQ]
  have hp : (0 : ℝ) ≤ (Upper.CompositeComparisonData.massNormQ : ℝ) := by
    norm_num [Upper.CompositeComparisonData.massNormQ]
  exact (sq_le_sq₀ (norm_nonneg _) hp).mp
    ((norm_source_sq_le_mass hS).trans (hm.trans hn))

/-- The continuous source beyond a squared-radius cutoff has exact mass. -/
theorem measure_sourceSet_tail (L : ℝ) (hL : 0 ≤ L) :
    mu2.real (sourceSet (Ioi L)) = Real.exp (-L) := by
  have hm : mu2.real (sourceSet (Ioi L)) = gaussC.real (radialSet (Ioi L)) := by
    simp [sourceSet, mu2, measureReal_prod_prod]
  rw [hm, measure_radialSet measurableSet_Ioi (Ioi_subset_Ioi hL)]
  simpa using (ExponentialTail.exp_moment_tail 0 L (a := 1) (by norm_num))

theorem exp_neg_hundred_le : Real.exp (-100) ≤ (1 / 10 ^ 40 : ℝ) := by
  have he : (27 / 10 : ℝ) < Real.exp 1 := by linarith [Real.exp_one_gt_d9]
  have hp : (10 ^ 40 : ℝ) < Real.exp 100 := by
    calc
      _ < (27 / 10 : ℝ) ^ 100 := by norm_num
      _ < (Real.exp 1) ^ 100 := by gcongr
      _ = _ := by rw [← Real.exp_nat_mul]; norm_num
  have hn : Real.exp (-100) < (1 / 10 ^ 40 : ℝ) := by
    simpa only [Real.exp_neg, one_div] using
      one_div_lt_one_div_of_lt (by positivity : (0 : ℝ) < 10 ^ 40) hp
  exact hn.le

/-- The exact Gaussian far-tail mass fits the squared reserve together
with the full three-gap mass allowance. No Taylor or Hardy tail is used. -/
theorem continuous_mass_budget :
    (2 / 10 ^ 21 : ℝ) + Real.exp (-100) ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) ^ 2 := by
  calc
    _ ≤ (2 / 10 ^ 21 : ℝ) + 1 / 10 ^ 40 :=
      add_le_add le_rfl exp_neg_hundred_le
    _ ≤ _ := by norm_num [Upper.CompositeComparisonData.massNormQ]

/-- One union indicator counts the thin root regions and s>100 once.
Their combined squared mass still fits the same 45e-12 norm reserve. -/
theorem norm_source_union_tail_le {S : Set ℝ} (hS : MeasurableSet S)
    (h13 : S ⊆ Ici (13 : ℝ))
    (hwidth : volume S ≤ ENNReal.ofReal (8 / 10 ^ 16 : ℝ)) :
    ‖(memLp_source (hS.union measurableSet_Ioi)).toLp (source (S ∪ Ioi 100))‖ ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) := by
  have hset : sourceSet (S ∪ Ioi (100 : ℝ)) = sourceSet S ∪ sourceSet (Ioi 100) := by
    ext u
    simp [sourceSet, radialSet]
  have hm : mu2.real (sourceSet (S ∪ Ioi (100 : ℝ))) ≤
      (massQ : ℝ) + Real.exp (-100) := by
    rw [hset]
    apply (measureReal_union_le _ _).trans
    refine add_le_add (measure_sourceSet_le hS h13 hwidth) ?_
    exact (measure_sourceSet_tail 100 (by norm_num)).le
  have hc : (massQ : ℝ) + Real.exp (-100) ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) ^ 2 := by
    have hv : (massQ : ℝ) = (2 / 10 ^ 21 : ℝ) := by norm_num [massQ]
    rw [hv]
    exact continuous_mass_budget
  apply (sq_le_sq₀ (norm_nonneg _) (by
    norm_num [Upper.CompositeComparisonData.massNormQ])).mp
  exact (norm_source_sq_le_mass (hS.union measurableSet_Ioi)).trans (hm.trans hc)

/-- The actual regular source is projected before numerical approximation. -/
def regularHead {S : Set ℝ} (hS : MeasurableSet S) : Lp ℂ 2 mu2 :=
  projOn productionDegreeHead ((memLp_source hS.compl).toLp (source Sᶜ))

theorem norm_head_sub_regular_le {S : Set ℝ} (hS : MeasurableSet S)
    (h13 : S ⊆ Ici (13 : ℝ))
    (hwidth : volume S ≤ ENNReal.ofReal (8 / 10 ^ 16 : ℝ)) :
    ‖productionF0Head - regularHead hS‖ ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) := by
  rw [productionF0Head, regularHead, ← map_sub, base_sub_regular hS]
  exact ((modeSpace productionDegreeHead).norm_starProjection_apply_le _).trans
    (norm_source_le hS h13 hwidth)

/-- Attach continuous omission to an actual regular-source approximant.
Finite node, primary-contraction and floating errors belong in hregular. -/
theorem head_approx_error_le {S : Set ℝ} (hS : MeasurableSet S)
    (h13 : S ⊆ Ici (13 : ℝ))
    (hwidth : volume S ≤ ENNReal.ofReal (8 / 10 ^ 16 : ℝ))
    (a0 : ℕ → ℕ → ℕ → ℚ) {δ : ℝ}
    (hregular : ‖regularHead hS - gradedHermite 251 a0‖ ≤ δ) :
    ‖productionF0Head - gradedHermite 251 a0‖ ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) + δ := by
  have he : productionF0Head - gradedHermite 251 a0 =
      (productionF0Head - regularHead hS) + (regularHead hS - gradedHermite 251 a0) := by
    abel
  rw [he]
  exact (norm_add_le _ _).trans
    (add_le_add (norm_head_sub_regular_le hS h13 hwidth) hregular)

/-- All three root gaps are supplied explicitly, rather than inferred from
the quadrature panel list. Their geometric/source bindings remain inputs. -/
def threeRootGaps (gaps : Fin 3 → Set ℝ) : Set ℝ := ⋃ j, gaps j

theorem measurableSet_threeRootGaps {gaps : Fin 3 → Set ℝ}
    (hg : ∀ j, MeasurableSet (gaps j)) : MeasurableSet (threeRootGaps gaps) :=
  MeasurableSet.iUnion hg

/-- The retained source is the exact complement of all three gaps AND s>100. -/
def completeRegularHead {gaps : Fin 3 → Set ℝ}
    (hg : ∀ j, MeasurableSet (gaps j)) : Lp ℂ 2 mu2 :=
  regularHead (S := threeRootGaps gaps ∪ Ioi (100 : ℝ))
    ((measurableSet_threeRootGaps hg).union measurableSet_Ioi)

theorem complete_head_approx_error_le {gaps : Fin 3 → Set ℝ}
    (hg : ∀ j, MeasurableSet (gaps j))
    (h13 : ∀ j, gaps j ⊆ Ici (13 : ℝ))
    (hwidth : volume (threeRootGaps gaps) ≤ ENNReal.ofReal (8 / 10 ^ 16 : ℝ))
    (a0 : ℕ → ℕ → ℕ → ℚ) {δ : ℝ}
    (hregular : ‖completeRegularHead hg - gradedHermite 251 a0‖ ≤ δ) :
    ‖productionF0Head - gradedHermite 251 a0‖ ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) + δ := by
  have hm := measurableSet_threeRootGaps hg
  have hr : threeRootGaps gaps ⊆ Ici (13 : ℝ) := by
    intro s hs
    obtain ⟨j, hj⟩ := Set.mem_iUnion.mp hs
    exact h13 j hj
  have hn : ‖productionF0Head - completeRegularHead hg‖ ≤
      (Upper.CompositeComparisonData.massNormQ : ℝ) := by
    rw [completeRegularHead, productionF0Head, regularHead,
      ← map_sub, base_sub_regular (hm.union measurableSet_Ioi)]
    exact ((modeSpace productionDegreeHead).norm_starProjection_apply_le _).trans
      (norm_source_union_tail_le hm hr hwidth)
  have he : productionF0Head - gradedHermite 251 a0 =
      (productionF0Head - completeRegularHead hg) +
        (completeRegularHead hg - gradedHermite 251 a0) := by abel
  rw [he]
  exact (norm_add_le _ _).trans (add_le_add hn hregular)

end
end Grothe.UpperChaos.FixedChaosSmoothing.F0Omission

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.F0Omission.measure_radialSet,
      ``Grothe.UpperChaos.FixedChaosSmoothing.F0Omission.continuous_mass_budget,
      ``Grothe.UpperChaos.FixedChaosSmoothing.F0Omission.norm_source_le,
      ``Grothe.UpperChaos.FixedChaosSmoothing.F0Omission.norm_source_union_tail_le,
      ``Grothe.UpperChaos.FixedChaosSmoothing.F0Omission.complete_head_approx_error_le] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected continuous F0 omission axioms: {unexpected}"
