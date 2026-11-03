import Grothe.UpperChaos.Q0SourceExceptionRegion
import Grothe.UpperChaos.Q0SourceExceptionDecay
import Mathlib.Data.Rat.BigOperators

/-! Discrete physical Gaussian mass of the exact exceptional source family.
The same-root panel normalization remains explicit. The source lower bound
thirteen supplies the Gaussian decay. Continuous measure is not substituted
for a discrete weight sum. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionMass

-- The concrete source index type contains the full panel list.
set_option maxRecDepth 8192

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0SourceExceptionWidth
open Grothe.UpperChaos.Q0SourceExceptionRegion

def indices : List (Fin sourcePanels.length) :=
  ((List.finRange sourcePanels.length).drop 146).take 129 ++
    ((List.finRange sourcePanels.length).drop 557).take 128 ++
    ((List.finRange sourcePanels.length).drop 964).take 124

private theorem mem_index_slice {n : ℕ} (start count : ℕ) (i : Fin n) :
    i ∈ ((List.finRange n).drop start).take count ↔
      start ≤ i.val ∧ i.val < start + count := by
  rw [mem_slice]
  constructor
  · rintro ⟨j, hl, hu, he⟩
    have hv : j.val = i.val := by
      have hh := congrArg Fin.val he
      simpa only [List.get_eq_getElem, List.getElem_finRange, Fin.val_cast] using hh
    omega
  · rintro ⟨hl, hu⟩
    refine ⟨⟨i.val, by simpa only [List.length_finRange] using i.isLt⟩, hl, hu, ?_⟩
    apply Fin.ext
    simp only [List.get_eq_getElem, List.getElem_finRange, Fin.val_cast]

theorem mem_indices (i : Fin sourcePanels.length) :
    i ∈ indices ↔ exceptionalPanel i.val := by
  simp only [indices, List.mem_append, mem_index_slice, exceptionalPanel]
  omega

theorem panels_eq_map : indices.map sourcePanels.get = exceptionPanels := by
  simp only [indices, exceptionPanels, List.map_append, List.map_take, List.map_drop,
    List.map_get_finRange]

private theorem sum_toFinset_le {α : Type*} [DecidableEq α]
    (xs : List α) (f : α → ℝ) (h : ∀ x ∈ xs, 0 ≤ f x) :
    (∑ x ∈ xs.toFinset, f x) ≤ (xs.map f).sum := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
    have ht : ∀ x ∈ xs, 0 ≤ f x := fun x hx => h x (by simp [hx])
    have ha : 0 ≤ f a := h a (by simp)
    by_cases hm : a ∈ xs.toFinset
    · simpa only [List.toFinset_cons, Finset.insert_eq_of_mem hm,
        List.map_cons, List.sum_cons] using (ih ht).trans (le_add_of_nonneg_left ha)
    · simpa only [List.toFinset_cons, Finset.sum_insert hm,
        List.map_cons, List.sum_cons] using _root_.add_le_add (le_refl (f a)) (ih ht)

theorem indexed_width_sum :
    (indices.map fun i => ((sourcePanels.get i).hi : ℝ) -
      ((sourcePanels.get i).lo : ℝ)).sum = (totalWidth : ℝ) := by
  have hr : (indices.map fun i => (sourcePanels.get i).hi -
      (sourcePanels.get i).lo).sum = totalWidth := by
    rw [← panels_width]
    unfold width panels
    rw [← panels_eq_map]
    simp only [List.map_map, Function.comp_def]
  have hc := congrArg (fun q : ℚ => (q : ℝ)) hr
  simpa only [Rat.cast_list_sum, List.map_map, Function.comp_def, Rat.cast_sub] using hc

noncomputable def panelMass (p : Fin sourcePanels.length) : ℝ :=
  ∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩ * Real.exp (-(sourceNode ⟨p, j⟩))

noncomputable def exceptionMass : ℝ := by
  classical
  exact ∑ p : Fin sourcePanels.length, if exceptionalPanel p.val then panelMass p else 0

/-- The identical mass written on the actual source-address domain used by
the conditional coefficient error. The Gaussian factor occurs exactly once. -/
theorem exceptionMass_eq_source : exceptionMass =
    ∑ a : Address, if exceptionalPanel a.1.val then
      sourceWeight a * Real.exp (-(sourceNode a)) else 0 := by
  classical
  unfold exceptionMass panelMass
  rw [Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro p _
  by_cases hp : exceptionalPanel p.val <;> simp [hp]

theorem exceptionMass_eq : exceptionMass = ∑ p ∈ indices.toFinset, panelMass p := by
  classical
  have hindices :
      Finset.univ.filter (fun p : Fin sourcePanels.length => exceptionalPanel p.val) =
        indices.toFinset := by
    apply Finset.ext
    intro p
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, List.mem_toFinset, mem_indices]
  unfold exceptionMass
  rw [← Finset.sum_filter, hindices]

/-- This is where normalization of the actual selected physical weights is
needed; it cannot be inferred from the continuous interval measure alone. -/
theorem unweighted_sum_le
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    (∑ p ∈ indices.toFinset, ∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) ≤
      (totalWidth : ℝ) := by
  calc
    _ = ∑ p ∈ indices.toFinset, (((sourcePanels.get p).hi : ℝ) -
        ((sourcePanels.get p).lo : ℝ)) := by
      apply Finset.sum_congr rfl
      intro p hp
      exact hpanel p ((mem_indices p).mp (List.mem_toFinset.mp hp))
    _ ≤ (indices.map fun p => ((sourcePanels.get p).hi : ℝ) -
        ((sourcePanels.get p).lo : ℝ)).sum := by
      apply sum_toFinset_le
      intro p _
      exact sub_nonneg.mpr (source_panel_lt p).le
    _ = (totalWidth : ℝ) := indexed_width_sum

theorem exceptionMass_le_of_density (C : ℝ) (hC : 0 ≤ C)
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ))
    (hdecay : ∀ a : Address, exceptionalPanel a.1.val →
      Real.exp (-(sourceNode a)) ≤ C) :
    exceptionMass ≤ (8 / 10^16 : ℝ) * C := by
  classical
  have hlocal (p : Fin sourcePanels.length) (hp : exceptionalPanel p.val) :
      panelMass p ≤ (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) * C := by
    calc
      panelMass p ≤ ∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩ * C := by
        apply Finset.sum_le_sum
        intro j _
        exact mul_le_mul_of_nonneg_left (hdecay ⟨p, j⟩ hp) (sourceWeight_pos ⟨p, j⟩).le
      _ = _ := by rw [Finset.sum_mul]
  rw [exceptionMass_eq]
  calc
    _ ≤ ∑ p ∈ indices.toFinset,
        (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) * C := by
      apply Finset.sum_le_sum
      intro p hp
      exact hlocal p ((mem_indices p).mp (List.mem_toFinset.mp hp))
    _ = (∑ p ∈ indices.toFinset,
        ∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) * C := by
      simp only [Finset.sum_mul]
    _ ≤ (totalWidth : ℝ) * C :=
      mul_le_mul_of_nonneg_right (unweighted_sum_le hpanel) hC
    _ ≤ (8 / 10^16 : ℝ) * C := by
      apply mul_le_mul_of_nonneg_right _ hC
      have hcast : (totalWidth : ℝ) ≤ ((8 / 10^16 : ℚ) : ℝ) :=
        Rat.cast_le.mpr Q0SourceExceptionWidthAll.total_width_lt.le
      simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using hcast

/-- Compatibility with callers supplying the earlier coarse density. -/
theorem exceptionMass_le
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ))
    (hdecay : ∀ a : Address, exceptionalPanel a.1.val →
      Real.exp (-(sourceNode a)) ≤ (1 / 128 : ℝ)) :
    exceptionMass ≤ (8 / 10^16 : ℝ) / 128 := by
  simpa only [div_eq_mul_inv, one_mul] using
    exceptionMass_le_of_density (1 / 128) (by norm_num) hpanel hdecay

/-- Actual source nodes lie above thirteen; no separate numerical density
premise is required. The physical-weight normalization is still explicit. -/
theorem exceptionMass_le_thirteen
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    exceptionMass ≤ (8 / 10^16 : ℝ) / 400000 := by
  simpa only [div_eq_mul_inv, one_mul] using
    exceptionMass_le_of_density (1 / 400000) (by norm_num) hpanel
      Q0SourceExceptionDecay.exceptional_decay

/-- The square-root allowance used by the Gaussian omission ledger. -/
theorem exceptionMass_le_norm_sq
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    exceptionMass ≤ (45 / 10^12 : ℝ) ^ 2 :=
  (exceptionMass_le_thirteen hpanel).trans (by norm_num)

end Grothe.UpperChaos.Q0SourceExceptionMass

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionMass.mem_indices,
      ``Grothe.UpperChaos.Q0SourceExceptionMass.indexed_width_sum,
      ``Grothe.UpperChaos.Q0SourceExceptionMass.exceptionMass_le,
      ``Grothe.UpperChaos.Q0SourceExceptionMass.exceptionMass_le_thirteen,
      ``Grothe.UpperChaos.Q0SourceExceptionMass.exceptionMass_le_norm_sq] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
