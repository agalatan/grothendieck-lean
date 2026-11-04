import Grothe.Upper.CompositeComparisonMass
import Grothe.UpperChaos.TaylorCenterFunctions
import Grothe.UpperChaos.FirstSecondCapturedTail

/-! An actual seven-piece comparison for the frozen Taylor response. Three
low-band estimates and three whole-source real inner-product estimates are
explicit premises. The whole sources, rather than seven independently bounded
pieces, pay the quadratic cost. This is a separate conditional consumer; the
original eighteen-piece interfaces and endpoint are unchanged.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset
open scoped InnerProductSpace

namespace Grothe.UpperChaos.CompositeComparison
open Grothe.Upper GrotheKernel

noncomputable section

def rawSource : Fin 4 → Lp ℂ 2 mu2
  | 0 => roundingDifference
  | 1 => firstTaylorL2 - firstCenter
  | 2 => (1 / 2 : ℂ) • (secondTaylorL2 - secondCenter)
  | 3 => (1 / 6 : ℂ) • (thirdTaylorL2 - thirdCenter)

/-- The sources are those of the existing pointwise Taylor decomposition. -/
def smoothedSource (p : Fin 4) : Lp ℂ 2 mu2 :=
  srcL phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn p

theorem smoothedSource_eq (p : Fin 4) :
    smoothedSource p = smoothOp (rawSource p) := by
  fin_cases p
  · exact congrArg smoothOp taylorRounding_source_toLp
  · exact congrArg smoothOp toLp_taylorFirstSource
  · exact congrArg smoothOp toLp_taylorSecondSource
  · exact congrArg smoothOp toLp_taylorThirdSource

def taylor (g : Fin 3) : Lp ℂ 2 mu2 :=
  if g.val = 0 then firstTaylorL2 else
  if g.val = 1 then secondTaylorL2 else thirdTaylorL2

def center (g : Fin 3) : Lp ℂ 2 mu2 :=
  if g.val = 0 then firstCenter else
  if g.val = 1 then secondCenter else thirdCenter

def factorialQ (g : Fin 3) : ℚ :=
  if g.val = 0 then 1 else if g.val = 1 then 2 else 6

/-- These six premises concern fixed actual Gaussian vectors. In particular,
the whole-source enclosure is a real-part lower bound, with its original
factorial scaling visible, rather than an assumed final energy comparison. -/
structure Inputs : Prop where
  low : ∀ g : Fin 3,
    ‖bandProj (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup g)) (rawSource (CompositeComparisonData.highGroup g))‖ ≤
      ((CompositeComparisonData.lowBand (CompositeComparisonData.highGroup g)).error : ℝ)
  whole : ∀ g : Fin 3,
    (‖taylor g‖ ^ 2 + ‖center g‖ ^ 2 -
      ((factorialQ g : ℝ) * (CompositeComparisonData.wholeRadiusQ (CompositeComparisonData.highGroup g) : ℝ)) ^ 2) / 2 ≤
        Complex.re ⟪center g, taylor g⟫_ℂ

theorem rawSource_high_norm_le (h : Inputs) (g : Fin 3) :
    ‖rawSource (CompositeComparisonData.highGroup g)‖ ≤ (CompositeComparisonData.wholeRadiusQ (CompositeComparisonData.highGroup g) : ℝ) := by
  have he := h.whole g
  have hs := norm_sub_sq (𝕜 := ℂ) (taylor g) (center g)
  change ‖taylor g - center g‖ ^ 2 = ‖taylor g‖ ^ 2 -
    2 * Complex.re ⟪taylor g, center g⟫_ℂ + ‖center g‖ ^ 2 at hs
  have hsym : Complex.re ⟪taylor g, center g⟫_ℂ =
      Complex.re ⟪center g, taylor g⟫_ℂ :=
    inner_re_symm (𝕜 := ℂ) (taylor g) (center g)
  rw [hsym] at hs
  have hf : (0 : ℝ) ≤ (factorialQ g : ℝ) := by
    fin_cases g <;> norm_num [factorialQ]
  have hr : (0 : ℝ) ≤ (CompositeComparisonData.wholeRadiusQ (CompositeComparisonData.highGroup g) : ℝ) := by
    exact_mod_cast CompositeComparisonData.whole_nonneg (CompositeComparisonData.highGroup g)
  have hn : ‖taylor g - center g‖ ≤
      (factorialQ g : ℝ) * (CompositeComparisonData.wholeRadiusQ (CompositeComparisonData.highGroup g) : ℝ) := by
    apply (sq_le_sq₀ (norm_nonneg _) (mul_nonneg hf hr)).mp
    linarith only [he, hs]
  fin_cases g <;>
    norm_num [rawSource, taylor, center, factorialQ, CompositeComparisonData.highGroup,
      norm_smul, norm_div] at hn ⊢ <;> linarith

theorem rawSource_norm_le (h : Inputs) (p : Fin 4) :
    ‖rawSource p‖ ≤ (CompositeComparisonData.wholeRadiusQ p : ℝ) := by
  fin_cases p
  · simpa [rawSource, CompositeComparisonData.wholeRadiusQ, comparisonGroupRadiusQ] using
      norm_roundingDifference_le
  · exact rawSource_high_norm_le h 0
  · exact rawSource_high_norm_le h 1
  · exact rawSource_high_norm_le h 2

theorem whole_norm_le (h : Inputs) (p : Fin 4) :
    ‖smoothedSource p‖ ≤ (CompositeComparisonData.wholeRadiusQ p : ℝ) := by
  rw [smoothedSource_eq]
  exact (norm_smoothOp_le _).trans (rawSource_norm_le h p)

def rounding : Lp ℂ 2 mu2 := (memLp_GT phiBound).toLp GT
def response : Lp ℂ 2 mu2 :=
  (memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)

theorem source_zero (p : Fin 4) :
    ⟪hvec2 idx0, smoothedSource p⟫_ℂ = 0 :=
  inner_idx0_srcL phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn p

/-- The four entire smoothed residuals sum to the actual response difference. -/
theorem difference_sources : rounding - response = ∑ p, smoothedSource p := by
  classical
  have hd := difference_pieces phiBound chargeFn_frozenCorrectionFn
    chargeFn_firstCenterFn chargeFn_secondCenterFn chargeFn_thirdCenterFn
  rw [← Finset.sum_fiberwise Finset.univ pw
    (piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn)] at hd
  simpa only [sum_pieces_fiber, rounding, response, smoothedSource] using hd

private theorem projection_norm_le (b : ComparisonBand) (f : Lp ℂ 2 mu2) :
    ‖bandProj b f‖ ≤ ‖f‖ :=
  (modeSpace (bandModes b)).norm_starProjection_apply_le f

theorem low_high_split (g : Fin 3) :
    bandProj (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup g)) (smoothedSource (CompositeComparisonData.highGroup g)) +
      bandProj (CompositeComparisonData.highBand g) (smoothedSource (CompositeComparisonData.highGroup g)) =
        smoothedSource (CompositeComparisonData.highGroup g) := by
  classical
  apply eq_of_inner_hvec2
  intro i
  have hlo : i ∈ bandModes (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup g)) ↔
      0 < (bideg i).1 + (bideg i).2 ∧
        (bideg i).1 + (bideg i).2 ≤ CompositeComparisonData.cutoff g :=
    CompositeComparisonData.low_contains g _ _
  have hhi : i ∈ bandModes (CompositeComparisonData.highBand g) ↔
      CompositeComparisonData.cutoff g < (bideg i).1 + (bideg i).2 := CompositeComparisonData.high_contains g _ _
  simp only [inner_add_right, bandProj, inner_projOn]
  by_cases hz : (bideg i).1 + (bideg i).2 = 0
  · have hc : ⟪hvec2 i, smoothedSource (CompositeComparisonData.highGroup g)⟫_ℂ = 0 := by
      rw [bideg_eq_idx0 hz, source_zero]
    simp [hc]
  · by_cases hle : (bideg i).1 + (bideg i).2 ≤ CompositeComparisonData.cutoff g
    · have hl : i ∈ bandModes (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup g)) := hlo.mpr ⟨by omega, hle⟩
      have hh : i ∉ bandModes (CompositeComparisonData.highBand g) := fun hh => by
        have := hhi.mp hh
        omega
      simp [hl, hh]
    · have hl : i ∉ bandModes (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup g)) := fun hl => hle (hlo.mp hl).2
      have hh : i ∈ bandModes (CompositeComparisonData.highBand g) := hhi.mpr (by omega)
      simp [hl, hh]

theorem rounding_band_eq :
    bandProj (CompositeComparisonData.lowBand 0) (smoothedSource 0) = smoothedSource 0 := by
  classical
  apply eq_of_inner_hvec2
  intro i
  rw [bandProj, inner_projOn]
  by_cases hi : i ∈ bandModes (CompositeComparisonData.lowBand 0)
  · simp [hi]
  · have hz : (bideg i).1 + (bideg i).2 = 0 := by
      simpa [bandModes, CompositeComparisonData.lowBand, CompositeComparisonData.lowIndex, CompositeComparisonData.oldBand,
        comparisonBands, ComparisonBand.contains] using hi
    have hc : ⟪hvec2 i, smoothedSource 0⟫_ℂ = 0 := by
      rw [bideg_eq_idx0 hz, source_zero]
    simp [hc]

def component (j : CompositeComparisonData.PieceIndex) : Lp ℂ 2 mu2 :=
  bandProj (CompositeComparisonData.band j) (smoothedSource (CompositeComparisonData.source j))

/-- A low piece and its complementary tail recover each Taylor source. -/
theorem difference_components : rounding - response = ∑ j, component j := by
  have h0 := rounding_band_eq
  have h1 := low_high_split 0
  have h2 := low_high_split 1
  have h3 := low_high_split 2
  calc
    _ = smoothedSource 0 + smoothedSource 1 + smoothedSource 2 + smoothedSource 3 := by
      rw [difference_sources, Fin.sum_univ_four]
    _ = component 0 + (component 1 + component 2) +
        (component 3 + component 4) + (component 5 + component 6) := by
      change _ = bandProj (CompositeComparisonData.lowBand 0) (smoothedSource 0) +
        (bandProj (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup 0))
          (smoothedSource (CompositeComparisonData.highGroup 0)) +
          bandProj (CompositeComparisonData.highBand 0)
            (smoothedSource (CompositeComparisonData.highGroup 0))) +
        (bandProj (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup 1))
          (smoothedSource (CompositeComparisonData.highGroup 1)) +
          bandProj (CompositeComparisonData.highBand 1)
            (smoothedSource (CompositeComparisonData.highGroup 1))) +
        (bandProj (CompositeComparisonData.lowBand (CompositeComparisonData.highGroup 2))
          (smoothedSource (CompositeComparisonData.highGroup 2)) +
          bandProj (CompositeComparisonData.highBand 2)
            (smoothedSource (CompositeComparisonData.highGroup 2)))
      rw [h0, h1, h2, h3]
      rfl
    _ = ∑ j, component j := by
      simp only [Fin.sum_univ_succ, Finset.univ_eq_empty, Finset.sum_empty, add_zero]
      abel

theorem component_norm_le (h : Inputs) (j : CompositeComparisonData.PieceIndex) :
    ‖component j‖ ≤ (CompositeComparisonData.errorQ j : ℝ) := by
  fin_cases j
  · exact (projection_norm_le _ _).trans (whole_norm_le h 0)
  · change ‖bandProj (CompositeComparisonData.lowBand 1) (smoothedSource 1)‖ ≤ _
    rw [smoothedSource_eq]
    exact (norm_bandProj_smoothOp_le _ _).trans (h.low 0)
  · exact (projection_norm_le _ _).trans (whole_norm_le h 1)
  · change ‖bandProj (CompositeComparisonData.lowBand 2) (smoothedSource 2)‖ ≤ _
    rw [smoothedSource_eq]
    exact (norm_bandProj_smoothOp_le _ _).trans (h.low 1)
  · exact (projection_norm_le _ _).trans (whole_norm_le h 2)
  · change ‖bandProj (CompositeComparisonData.lowBand 3) (smoothedSource 3)‖ ≤ _
    rw [smoothedSource_eq]
    exact (norm_bandProj_smoothOp_le _ _).trans (h.low 2)
  · exact (projection_norm_le _ _).trans (whole_norm_le h 3)

/-- The quadratic cost is charged once using the four WHOLE sources. -/
theorem quadratic_le (h : Inputs) :
    ∑ p ∈ headIdx 501, ‖energyBlock rounding p - energyBlock response p‖ ^ 2 ≤
      (∑ g : Fin 4, (CompositeComparisonData.wholeRadiusQ g : ℝ)) ^ 2 := by
  have hn : ‖rounding - response‖ ≤ ∑ g : Fin 4, (CompositeComparisonData.wholeRadiusQ g : ℝ) := by
    rw [difference_sources]
    exact (norm_sum_le _ _).trans (sum_le_sum fun g _ => whole_norm_le h g)
  simp_rw [← energyBlock_sub, norm_energyBlock_sq]
  exact (energy_sum_le_norm_sq _ _).trans
    (pow_le_pow_left₀ (norm_nonneg _) hn 2)

/-- Actual selected-head comparison under the six Gaussian premises and the
full table tolerance. Neither the original tighter comparison budget nor its
eighteen-piece hypotheses are assumed. -/
theorem weighted_energy_comparison (h : Inputs)
    (hclose : ∑ p ∈ headIdx 501,
      |energy response p - (energyTable p : ℝ)| ≤ (CompositeComparisonData.energyErrorQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      comparisonWeight p * |energy rounding p - energy response p| ≤
        (CompositeComparisonData.comparisonCapQ : ℝ) := by
  classical
  have hm := CompositeComparisonData.actual_piece_mass hclose
  have hquad := quadratic_le h
  generalize hS : headIdx 501 = S at hquad ⊢
  let A : CompositeComparisonData.PieceIndex → ℝ := fun j => (CompositeComparisonData.radiusQ j : ℝ)
  let e : CompositeComparisonData.PieceIndex → ℝ := fun j => (CompositeComparisonData.errorQ j : ℝ)
  let q : ℝ := (∑ g : Fin 4, (CompositeComparisonData.wholeRadiusQ g : ℝ)) ^ 2
  have hz (j : CompositeComparisonData.PieceIndex) (p : ℕ × ℕ)
      (hp : (CompositeComparisonData.band j).contains p.1 p.2 = false) : energyBlock (component j) p = 0 := by
    have he : ‖energyBlock (component j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (energy_bandProj_eq_zero _ _ p hp)
    apply norm_eq_zero.mp
    nlinarith [norm_nonneg (energyBlock (component j) p)]
  have hc := BandComparison.weighted_compare S (univ : Finset CompositeComparisonData.PieceIndex)
    comparisonWeight (energyBlock response) (energyBlock rounding)
    (fun j => energyBlock (component j)) (fun j => bandIndices (CompositeComparisonData.band j)) A e q
    (fun p _ => comparisonWeight_bounds p)
    (fun p _ => by rw [← energyBlock_sub, difference_components, energyBlock_sum])
    (fun j _ p hp hpb => hz j p (by simpa [bandIndices, hS, hp] using hpb))
    (fun j _ => by
      change (0 : ℝ) ≤ (CompositeComparisonData.radiusQ j : ℝ)
      exact_mod_cast (CompositeComparisonData.radii_nonneg j).1)
    (fun j _ => by
      change (0 : ℝ) ≤ (CompositeComparisonData.errorQ j : ℝ)
      exact_mod_cast (CompositeComparisonData.radii_nonneg j).2)
    (fun j _ => by
      have hi : S ∩ bandIndices (CompositeComparisonData.band j) =
          bandIndices (CompositeComparisonData.band j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hm j)
    (fun j _ => by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _) (component_norm_le h j) 2)) hquad
  simp_rw [norm_energyBlock_sq] at hc
  refine hc.trans ?_
  have hb := CompositeComparisonData.comparison_budget
  dsimp [A, e, q]
  exact_mod_cast hb

end
end Grothe.UpperChaos.CompositeComparison
