import Grothe.UpperChaos.Q0SourceExceptionGeometry
import Grothe.UpperChaos.Q0SourceExceptionWidthAll
import Grothe.UpperChaos.Q0SourceExceptionOrders
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

/-! The continuous union of the original exceptional source panels.
Lebesgue width is separate from the discrete Gauss weights and from Gaussian
probability. No analytic approximation estimate is assumed here.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionRegion

open MeasureTheory Set
open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0SourceExceptionWidth

/-- Every point of every listed closed interval, including panel endpoints. -/
def region : List Panel → Set ℝ
  | [] => ∅
  | p :: ps => Icc (p.lo : ℝ) (p.hi : ℝ) ∪ region ps

def width (ps : List Panel) : ℚ := (ps.map fun p => p.hi - p.lo).sum

theorem mem_region (ps : List Panel) (x : ℝ) :
    x ∈ region ps ↔ ∃ p ∈ ps, (p.lo : ℝ) ≤ x ∧ x ≤ (p.hi : ℝ) := by
  induction ps with
  | nil => simp [region]
  | cons p ps ih => simp [region, ih]

theorem region_measurable (ps : List Panel) : MeasurableSet (region ps) := by
  induction ps with
  | nil => exact MeasurableSet.empty
  | cons p ps ih => exact measurableSet_Icc.union ih

theorem width_nonneg (ps : List Panel) (h : ∀ p ∈ ps, p.lo ≤ p.hi) :
    0 ≤ width ps := by
  apply List.sum_nonneg
  intro x hx
  obtain ⟨p, hp, rfl⟩ := List.mem_map.mp hx
  exact sub_nonneg.mpr (h p hp)

/-- Subadditivity suffices; no disjointness or exact tiling assumption. -/
theorem volume_region_le (ps : List Panel) (h : ∀ p ∈ ps, p.lo ≤ p.hi) :
    volume (region ps) ≤ ENNReal.ofReal (width ps : ℝ) := by
  induction ps with
  | nil => simp [region, width]
  | cons p ps ih =>
    have hp : (0 : ℝ) ≤ (p.hi : ℝ) - (p.lo : ℝ) := by
      exact_mod_cast sub_nonneg.mpr (h p (by simp))
    have hps : ∀ q ∈ ps, q.lo ≤ q.hi := fun q hq => h q (by simp [hq])
    have hw : (0 : ℝ) ≤ (width ps : ℝ) := by
      exact_mod_cast width_nonneg ps hps
    calc
      volume (region (p :: ps)) ≤
          volume (Icc (p.lo : ℝ) (p.hi : ℝ)) + volume (region ps) :=
        measure_union_le _ _
      _ ≤ ENNReal.ofReal ((p.hi : ℝ) - (p.lo : ℝ)) +
          ENNReal.ofReal (width ps : ℝ) := by
        rw [Real.volume_Icc]
        exact add_le_add_left (ih hps) _
      _ = ENNReal.ofReal (width (p :: ps) : ℝ) := by
        rw [← ENNReal.ofReal_add hp hw]
        simp [width]

/-- The full source panels in the three chosen inclusive index ranges. -/
abbrev panels : List Panel := exceptionPanels

def exceptionalSet : Set ℝ := region panels

theorem mem_slice {α : Type*} (xs : List α) (start count : ℕ) (p : α) :
    p ∈ (xs.drop start).take count ↔
      ∃ i : Fin xs.length, start ≤ i.val ∧ i.val < start + count ∧ xs.get i = p := by
  constructor
  · intro hp
    obtain ⟨j, hj, he⟩ := List.mem_iff_getElem.mp hp
    have hb : j < min count (xs.length - start) := by
      simpa only [List.length_take, List.length_drop] using hj
    refine ⟨⟨start + j, by omega⟩, by omega, by omega, ?_⟩
    simpa only [List.get_eq_getElem, List.getElem_take, List.getElem_drop] using he
  · rintro ⟨i, hl, hu, he⟩
    have hj : i.val - start < ((xs.drop start).take count).length := by
      simp only [List.length_take, List.length_drop]
      have hi := i.isLt
      omega
    refine List.mem_iff_getElem.mpr ⟨i.val - start, hj, ?_⟩
    have hi : start + (i.val - start) = i.val := by omega
    simpa only [List.getElem_take, List.getElem_drop, hi, List.get_eq_getElem] using he

theorem mem_panels_iff (p : Panel) : p ∈ panels ↔
    ∃ i : Fin sourcePanels.length, exceptionalPanel i.val ∧ sourcePanels.get i = p := by
  simp only [panels, exceptionPanels, List.mem_append, mem_slice]
  constructor
  · rintro (⟨i, hl, hu, he⟩ | ⟨i, hl, hu, he⟩ | ⟨i, hl, hu, he⟩)
    · exact ⟨i, Or.inl ⟨hl, by omega⟩, he⟩
    · exact ⟨i, Or.inr (Or.inl ⟨hl, by omega⟩), he⟩
    · exact ⟨i, Or.inr (Or.inr ⟨hl, by omega⟩), he⟩
  · rintro ⟨i, hi, he⟩
    rcases hi with hi | hi | hi
    · exact Or.inl ⟨i, hi.1, by omega, he⟩
    · exact Or.inr (Or.inl ⟨i, hi.1, by omega, he⟩)
    · exact Or.inr (Or.inr ⟨i, hi.1, by omega, he⟩)

theorem panels_width : width panels = totalWidth := by
  simp only [width, panels, exceptionPanels, totalWidth, blockWidth,
    List.map_append, List.sum_append]

/-- The physical quadrature in an exceptional panel uses only orders 1–4. -/
theorem exceptional_panel_order (i : Fin sourcePanels.length)
    (hi : exceptionalPanel i.val) :
    1 ≤ (sourcePanels.get i).order ∧ (sourcePanels.get i).order ≤ 4 :=
  Q0SourceExceptionOrders.each_order _ ((mem_panels_iff _).mpr ⟨i, hi, rfl⟩)

theorem exceptionalSet_measurable : MeasurableSet exceptionalSet :=
  region_measurable panels

theorem exceptionalSet_subset : exceptionalSet ⊆ Ici (13 : ℝ) := by
  intro x hx
  obtain ⟨p, hp, hlo, _⟩ := (mem_region panels x).mp hx
  obtain ⟨i, hi, rfl⟩ := (mem_panels_iff p).mp hp
  have hl : (13 : ℚ) ≤ (sourcePanels.get i).lo := by
    rcases hi with hi | hi | hi
    · exact exception_starts.1.trans (panel_lower_mono ⟨146, by decide +kernel⟩ i hi.1)
    · exact exception_starts.2.1.trans (panel_lower_mono ⟨557, by decide +kernel⟩ i hi.1)
    · exact exception_starts.2.2.trans (panel_lower_mono ⟨964, by decide +kernel⟩ i hi.1)
  have hr : (13 : ℝ) ≤ ((sourcePanels.get i).lo : ℝ) := by exact_mod_cast hl
  exact hr.trans hlo

theorem exceptionalSet_volume_le :
    volume exceptionalSet ≤ ENNReal.ofReal (8 / 10^16 : ℝ) := by
  have hordered : ∀ p ∈ panels, p.lo ≤ p.hi := by
    intro p hp
    obtain ⟨i, _, rfl⟩ := (mem_panels_iff p).mp hp
    exact_mod_cast (source_panel_lt i).le
  have hw : (totalWidth : ℝ) ≤ (8 / 10^16 : ℝ) := by
    exact_mod_cast Q0SourceExceptionWidthAll.total_width_lt.le
  exact (volume_region_le panels hordered).trans
    (ENNReal.ofReal_le_ofReal (by simpa only [panels_width] using hw))

/-- All exceptional source nodes belong to this continuous set. -/
theorem sourceNode_mem_exceptionalSet (a : Address) (ha : exceptionalPanel a.1.val) :
    sourceNode a ∈ exceptionalSet := by
  apply (mem_region panels (sourceNode a)).mpr
  exact ⟨sourcePanels.get a.1, (mem_panels_iff _).mpr ⟨a.1, ha, rfl⟩,
    source_node_mem_panel a⟩

end Grothe.UpperChaos.Q0SourceExceptionRegion

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionRegion.exceptionalSet_measurable,
      ``Grothe.UpperChaos.Q0SourceExceptionRegion.exceptionalSet_subset,
      ``Grothe.UpperChaos.Q0SourceExceptionRegion.exceptionalSet_volume_le,
      ``Grothe.UpperChaos.Q0SourceExceptionRegion.sourceNode_mem_exceptionalSet] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
