import Grothe.HJM.OriginUnweightedLeftCheckData
import Mathlib.Data.List.GetD

/-!
# Certified Left 64-mode partition geometry

Agent-ID: codex-aa04. The only input is
`hAll`, obtained from the checked seven-cell blocks. Explicit
in-bounds facts ensure `getD` defaults do not discharge a finite check.
-/

open MeasureTheory Set Finset
open Grothe.HJM.OriginMoment Grothe.HJM.OriginPanel Grothe.HJM.OriginPanels
open Grothe.HJM.OriginUnweightedLeftChecks
open Grothe.HJM.OriginUnweightedLeftCells
open Grothe.HJM.OriginUnweightedLeftWitness
open Grothe.HJM.OriginUnweightedMeanPolynomial
open Grothe.LowerAnalytic.CapTab Real

namespace Grothe.HJM.OriginUnweightedLeftGeometry

noncomputable section

/-- The full block proof implies this guard; no numerical fact is introduced here. -/
def GeometryOK : Prop := (List.range 98).all geometryCheck = true

theorem geometry_of_combined (hCombined : (List.range 98).all combinedCheck = true) :
    GeometryOK := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp hCombined) i hi
  simp only [combinedCheck, Bool.and_eq_true] at h
  exact h.1

/-- The global table shape and endpoints are extracted from an actually
checked cell; this introduces no separate numerical assumption. -/
theorem checkedShape (hAll : GeometryOK) :
    edgeList.length = 99 ∧ parentList.length = 98 ∧
    correlationLower.length = 98 ∧ correlationUpper.length = 98 ∧
    JreLower.length = 98 ∧ JreUpper.length = 98 ∧
    JimLower.length = 98 ∧ JimUpper.length = 98 ∧
    edges 0 = 0 ∧ edges 98 = 8 ∧ covers 0 8 leftPanels = true := by
  have h0 : geometryCheck 0 = true :=
    (List.all_eq_true.mp hAll) 0 (by decide)
  simp only [geometryCheck, Bool.and_eq_true] at h0
  have hs : dataShape = true := h0.1
  simpa only [dataShape, decide_eq_true_eq] using hs

/-- Every local gate is a property of the exact generated tables. -/
theorem checkedCell (hAll : GeometryOK) (i : ℕ) (hi : i < 98) :
    i < 98 ∧ parentList.getD i 0 < leftPanels.length ∧
    edges i < edges (i + 1) ∧ (parent i).a ≤ edges i ∧
    edges (i + 1) ≤ (parent i).b ∧
    0 ≤ panelCenter edges i ∧ 0 < panelRadius edges i ∧
    panelCenter edges i ≤ 8 ∧
    variation (panelCenter edges i) (panelRadius edges i) ≤ 1 ∧
    entry correlationLower i ≤ entry correlationUpper i ∧
    entry JreLower i ≤ entry JreUpper i ∧
    entry JimLower i ≤ entry JimUpper i := by
  have h := (List.all_eq_true.mp hAll) i (List.mem_range.mpr hi)
  simp only [geometryCheck, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h.2

/-- Each accessed edge, parent index and certificate entry is in bounds. -/
theorem checkedLookupBounds (hAll : GeometryOK) (i : ℕ) (hi : i < 98) :
    i < edgeList.length ∧ i + 1 < edgeList.length ∧ i < parentList.length ∧
    i < correlationLower.length ∧ i < correlationUpper.length ∧
    i < JreLower.length ∧ i < JreUpper.length ∧
    i < JimLower.length ∧ i < JimUpper.length := by
  obtain ⟨he, hp, hcl, hcu, hrl, hru, hil, hiu, _, _, _⟩ := checkedShape hAll
  omega

/-- A valid rational entry is its actual list element, not the `getD` zero. -/
theorem checkedEntry_noDefault (xs : List ℤ) (hxs : xs.length = 98)
    (i : ℕ) (hi : i < 98) :
    ∃ h : i < xs.length, entry xs i = ((xs[i]'h : ℤ) : ℚ) / 10 ^ 18 := by
  have hidx : i < xs.length := by omega
  refine ⟨hidx, ?_⟩
  unfold entry
  rw [List.getD_eq_getElem xs 0 hidx]

/-- Both edge endpoints come from actual list entries, including the last
cell's edge at index 98. -/
theorem checkedEdges_noDefault (hAll : GeometryOK) (i : ℕ) (hi : i < 98) :
    (∃ h : i < edgeList.length, edges i = edgeList[i]'h) ∧
    (∃ h : i + 1 < edgeList.length, edges (i + 1) = edgeList[i + 1]'h) := by
  have hb := checkedLookupBounds hAll i hi
  constructor
  · refine ⟨hb.1, ?_⟩
    exact List.getD_eq_getElem edgeList 0 hb.1
  · refine ⟨hb.2.1, ?_⟩
    exact List.getD_eq_getElem edgeList 0 hb.2.1

/-- The parent index is in the parent list and points into the actual source
phase-panel list, so neither nested lookup can take its default branch. -/
theorem checkedParent_noDefault (hAll : GeometryOK) (i : ℕ) (hi : i < 98) :
    (∃ h : i < parentList.length, parentList.getD i 0 = parentList[i]'h) ∧
    (∃ j, ∃ h : j < leftPanels.length,
      parentList.getD i 0 = j ∧ parent i = leftPanels[j]'h) := by
  have hip := (checkedLookupBounds hAll i hi).2.2.1
  have hc := checkedCell hAll i hi
  have hpidx : parentList.getD i 0 < leftPanels.length := hc.2.1
  constructor
  · exact ⟨hip, List.getD_eq_getElem parentList 0 hip⟩
  · refine ⟨parentList.getD i 0, hpidx, rfl, ?_⟩
    exact List.getD_eq_getElem leftPanels left000 hpidx

/-- The derived 64-entry beta vector is built from the actual 120-entry
source witness; no missing alpha entry can be replaced by a default. -/
theorem checkedWitnessShape :
    alpha.length = 64 ∧ Grothe.HJM.OriginWitnessData.leftAlpha.length = 120 := by
  constructor
  · simp only [alpha, List.length_map, List.length_range]
  · rfl

theorem checkedWitness_noDefault (n : ℕ) (hn : n < 64) :
    (∃ h : n < alpha.length, alpha.getD n (0, 0) = alpha[n]'h) ∧
    (∃ h : n < Grothe.HJM.OriginWitnessData.leftAlpha.length,
      Grothe.HJM.OriginWitnessData.leftAlpha.getD n (0, 0) =
        Grothe.HJM.OriginWitnessData.leftAlpha[n]'h) := by
  have hBeta : n < alpha.length := by rw [checkedWitnessShape.1]; exact hn
  have hAlpha : n < Grothe.HJM.OriginWitnessData.leftAlpha.length := by
    rw [checkedWitnessShape.2]
    omega
  exact ⟨⟨hBeta, List.getD_eq_getElem alpha (0, 0) hBeta⟩,
    ⟨hAlpha, List.getD_eq_getElem Grothe.HJM.OriginWitnessData.leftAlpha (0, 0) hAlpha⟩⟩

/-- The checked beta entry is the specified rational rescaling of the
corresponding source alpha entry, without a lookup default. -/
theorem checkedBeta_eq_scaled_source (n : ℕ) (hn : n < 64) :
    alpha.getD n (0, 0) =
      (let a := Grothe.HJM.OriginWitnessData.leftAlpha.getD n (0, 0)
       let d : ℚ := (2 * (n : ℚ) + 1) ^ 2
       (a.1 / d, a.2 / d)) := by
  unfold alpha
  rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hn]
  rfl

/-- The three geometric inputs consumed by the exact signed-integral
partition theorem: strict cells, actual parent membership and containment,
and the Taylor-variation bound. -/
theorem checkedPartition (hAll : GeometryOK) :
    (∀ i < 98, edges i < edges (i + 1)) ∧
    (∀ i < 98, parent i ∈ leftPanels ∧ (parent i).a ≤ edges i ∧
      edges (i + 1) ≤ (parent i).b) ∧
    (∀ i < 98, variation (panelCenter edges i) (panelRadius edges i) ≤ 1) := by
  constructor
  · intro i hi
    exact (checkedCell hAll i hi).2.2.1
  constructor
  · intro i hi
    obtain ⟨_, hpidx, _, ha, hb, _, _, _, _, _, _, _⟩ := checkedCell hAll i hi
    refine ⟨?_, ha, hb⟩
    change leftPanels.getD (parentList.getD i 0) left000 ∈ leftPanels
    rw [List.getD_eq_getElem leftPanels left000 hpidx]
    exact List.getElem_mem hpidx
  · intro i hi
    obtain ⟨_, _, _, _, _, _, _, _, hvar, _, _, _⟩ := checkedCell hAll i hi
    exact hvar

/-- The accepted panel source and all 98 checked cells give the signed
Gaussian integral interval; lower/upper numeric endpoint aggregation remains
a separate obligation. -/
theorem checkedSignedMoment_partition (hAll : GeometryOK) :
    (((∑ i ∈ range 98, (signedBounds i).1 : ℚ)) : ℝ) ≤
      (∫ t in Ioi (0 : ℝ), signedApproxIntegrand polynomial
        Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag leftPanels t) ∧
    (∫ t in Ioi (0 : ℝ), signedApproxIntegrand polynomial
        Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag leftPanels t) ≤
      (((∑ i ∈ range 98, (signedBounds i).2 : ℚ)) : ℝ) := by
  obtain ⟨_, _, _, _, _, _, _, _, hfirst, hlast, hcover⟩ := checkedShape hAll
  obtain ⟨hstep, hparent, hvar⟩ := checkedPartition hAll
  have h := signedApprox_integral_partition polynomial Grothe.HJM.OriginData.leftReal
    Grothe.HJM.OriginData.leftImag hcover edges parent 98 40 (by decide)
    hfirst hlast hstep hparent hvar
  simpa only [signedBounds] using h

/-- Actual accepted source-panel real part on every checked subcell. -/
theorem checkedMeanReal_piece (hAll : GeometryOK) (i : ℕ) (hi : i < 98) :
    ∀ t ∈ Ioo (edges i : ℝ) (edges (i + 1) : ℝ),
      meanRealIntegrand Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag leftPanels t =
        (panelRadius edges i : ℝ)⁻¹ *
          pev (meanCellPolynomial Grothe.HJM.OriginData.leftReal (parent i)
            (panelCenter edges i) (panelRadius edges i))
          ((t - (panelCenter edges i : ℝ)) / (panelRadius edges i : ℝ)) * exp (-t ^ 2) := by
  intro t ht
  obtain ⟨_, _, _, _, _, _, hh, _, _, _, _, _⟩ := checkedCell hAll i hi
  obtain ⟨_, _, _, _, _, _, _, _, _, _, hcover⟩ := checkedShape hAll
  have hp := (checkedPartition hAll).2.1 i hi
  have hleft : panelCenter edges i - panelRadius edges i = edges i := by
    unfold panelCenter panelRadius
    ring
  have hright : panelCenter edges i + panelRadius edges i = edges (i + 1) := by
    unfold panelCenter panelRadius
    ring
  exact meanReal_on_subpanel Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag
    (p := parent i) (c := panelCenter edges i) (h := panelRadius edges i) hcover hp.1 hh
    (by simpa only [hleft] using hp.2.1) (by simpa only [hright] using hp.2.2)
    (by simpa only [hleft, hright] using ht)

/-- The same exact binding for the imaginary phase component. -/
theorem checkedMeanImag_piece (hAll : GeometryOK) (i : ℕ) (hi : i < 98) :
    ∀ t ∈ Ioo (edges i : ℝ) (edges (i + 1) : ℝ),
      meanImagIntegrand Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag leftPanels t =
        (panelRadius edges i : ℝ)⁻¹ *
          pev (meanCellPolynomial Grothe.HJM.OriginData.leftImag (parent i)
            (panelCenter edges i) (panelRadius edges i))
          ((t - (panelCenter edges i : ℝ)) / (panelRadius edges i : ℝ)) * exp (-t ^ 2) := by
  intro t ht
  obtain ⟨_, _, _, _, _, _, hh, _, _, _, _, _⟩ := checkedCell hAll i hi
  obtain ⟨_, _, _, _, _, _, _, _, _, _, hcover⟩ := checkedShape hAll
  have hp := (checkedPartition hAll).2.1 i hi
  have hleft : panelCenter edges i - panelRadius edges i = edges i := by
    unfold panelCenter panelRadius
    ring
  have hright : panelCenter edges i + panelRadius edges i = edges (i + 1) := by
    unfold panelCenter panelRadius
    ring
  exact meanImag_on_subpanel Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag
    (p := parent i) (c := panelCenter edges i) (h := panelRadius edges i) hcover hp.1 hh
    (by simpa only [hleft] using hp.2.1) (by simpa only [hright] using hp.2.2)
    (by simpa only [hleft, hright] using ht)

/-- The real zeroth moment over the complete checked compact interval.
The tail beyond eight and numerical endpoint sums are separate obligations. -/
theorem checkedMeanReal_partition (hAll : GeometryOK) :
    (((∑ i ∈ range 98, (meanBounds Grothe.HJM.OriginData.leftReal i).1 : ℚ)) : ℝ) ≤
      (∫ t in (0 : ℝ)..8, meanRealIntegrand Grothe.HJM.OriginData.leftReal
        Grothe.HJM.OriginData.leftImag leftPanels t) ∧
    (∫ t in (0 : ℝ)..8, meanRealIntegrand Grothe.HJM.OriginData.leftReal
      Grothe.HJM.OriginData.leftImag leftPanels t) ≤
      (((∑ i ∈ range 98, (meanBounds Grothe.HJM.OriginData.leftReal i).2 : ℚ)) : ℝ) := by
  obtain ⟨_, _, _, _, _, _, _, _, hfirst, hlast, _⟩ := checkedShape hAll
  obtain ⟨hstep, _, hvar⟩ := checkedPartition hAll
  have h := gaussian_integral_partition
    (f := meanRealIntegrand Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag leftPanels)
    edges (fun i => meanCellPolynomial Grothe.HJM.OriginData.leftReal (parent i)
      (panelCenter edges i) (panelRadius edges i)) 98 40 (by norm_num)
    (by simpa only [hfirst] using (show (0 : ℚ) ≤ 0 by norm_num)) hstep
    (by simpa only [hlast] using (show (8 : ℚ) ≤ 8 by norm_num)) hvar (checkedMeanReal_piece hAll)
  simpa only [meanBounds, hfirst, hlast, Rat.cast_zero, Rat.cast_ofNat] using h

/-- Imaginary zeroth moment on the same actual source-panel partition. -/
theorem checkedMeanImag_partition (hAll : GeometryOK) :
    (((∑ i ∈ range 98, (meanBounds Grothe.HJM.OriginData.leftImag i).1 : ℚ)) : ℝ) ≤
      (∫ t in (0 : ℝ)..8, meanImagIntegrand Grothe.HJM.OriginData.leftReal
        Grothe.HJM.OriginData.leftImag leftPanels t) ∧
    (∫ t in (0 : ℝ)..8, meanImagIntegrand Grothe.HJM.OriginData.leftReal
      Grothe.HJM.OriginData.leftImag leftPanels t) ≤
      (((∑ i ∈ range 98, (meanBounds Grothe.HJM.OriginData.leftImag i).2 : ℚ)) : ℝ) := by
  obtain ⟨_, _, _, _, _, _, _, _, hfirst, hlast, _⟩ := checkedShape hAll
  obtain ⟨hstep, _, hvar⟩ := checkedPartition hAll
  have h := gaussian_integral_partition
    (f := meanImagIntegrand Grothe.HJM.OriginData.leftReal Grothe.HJM.OriginData.leftImag leftPanels)
    edges (fun i => meanCellPolynomial Grothe.HJM.OriginData.leftImag (parent i)
      (panelCenter edges i) (panelRadius edges i)) 98 40 (by norm_num)
    (by simpa only [hfirst] using (show (0 : ℚ) ≤ 0 by norm_num)) hstep
    (by simpa only [hlast] using (show (8 : ℚ) ≤ 8 by norm_num)) hvar (checkedMeanImag_piece hAll)
  simpa only [meanBounds, hfirst, hlast, Rat.cast_zero, Rat.cast_ofNat] using h

end
end Grothe.HJM.OriginUnweightedLeftGeometry
