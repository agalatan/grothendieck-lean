import Grothe.UpperChaos.FiniteScalarData
import Grothe.UpperChaos.Q0GaussOrdinalEquiv
import Grothe.UpperChaos.Q0GaussPhysicalAll
import Mathlib.Algebra.BigOperators.Fin
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Agent-ID: codex-8c4d. Exact finite source extraction; UNCOMPILED.
Original input arrays, rows, endpoints and mask are unchanged. No analytic bound. -/
set_option warningAsError true

namespace Grothe.UpperChaos.ScalarOriginalBindingDraft
open Q0GaussAddressScan Q0GaussOrdinalEquiv TwoBlockSoundnessDraft TwoBlockIntegerCheckerDraft

theorem upperAt_fin (p : Fin sourcePanels.length) :
    upperAt p.val = originalUpper p := by
  simp [upperAt, originalUpper, List.get_eq_getElem, p.isLt]

theorem massRow_panel (i : Fin 21577) :
    (massRow i).panel = (toAddress i).1.val := by
  have hm : ((massRow i).index, (massRow i).panel, (massRow i).rule,
      (massRow i).nodeLower, (massRow i).weightUpper) ∈
      Q0NodeMassAll.rows.map
        (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)) :=
    List.mem_map.mpr ⟨massRow i, massRow_mem i, rfl⟩
  rw [← Q0GaussPhysicalAll.projection] at hm
  obtain ⟨p, hp, heq⟩ := List.mem_map.mp hm
  simp only [Prod.mk.injEq] at heq
  obtain ⟨hindex, hpanel, _, _, _⟩ := heq
  have hchosen : Q0GaussNodeMass.rowAt i = p := by
    apply (Q0GaussOrdinal.unique_row i.val i.isLt).unique
    · exact Q0GaussNodeMass.rowAt_spec i
    · exact ⟨hp, hindex.trans (massRow_index i)⟩
  rw [← hchosen] at hpanel
  exact hpanel.symm.trans (toAddress_spec i).1

theorem original_term (i : Fin 21577) :
    (maskNat (toAddress i) : ℤ) * (row (toAddress i)).termUpper *
      (originalUpper (toAddress i).1 : ℤ)^251 = rowTerm (massRow i) := by
  simp [rowTerm, maskNat, row, from_to, massRow_panel, upperAt_fin]

theorem sum_get_of_length {α : Type*} (xs : List α) (n : ℕ)
    (h : xs.length = n) (f : α → ℤ) :
    (∑ i : Fin n, f (xs.get ⟨i.val, by omega⟩)) = (xs.map f).sum := by
  subst n
  calc
    _ = (List.ofFn (fun i : Fin xs.length => f (xs.get i))).sum :=
      (Fin.sum_ofFn _).symm
    _ = (xs.map f).sum := by
      congr 1
      simpa only [Function.comp_def, List.get_eq_getElem, List.ofFn_getElem] using
        (List.map_ofFn (f := fun i : Fin xs.length => xs[i.val]) (g := f)).symm

theorem scalarNumerator_eq_ledger :
    scalarNumerator originalUpper = (Q0NodeMassAll.rows.map rowTerm).sum := by
  classical
  unfold scalarNumerator
  rw [← ordinalEquiv.sum_comp]
  change (∑ i : Fin 21577,
    (maskNat (toAddress i) : ℤ) * (row (toAddress i)).termUpper *
      (originalUpper (toAddress i).1 : ℤ)^251) = _
  simp_rw [original_term]
  exact sum_get_of_length Q0NodeMassAll.rows 21577 Q0NodeMassAll.count rowTerm

end Grothe.UpperChaos.ScalarOriginalBindingDraft

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.ScalarOriginalBindingDraft.upperAt_fin,
      ``Grothe.UpperChaos.ScalarOriginalBindingDraft.massRow_panel,
      ``Grothe.UpperChaos.ScalarOriginalBindingDraft.original_term,
      ``Grothe.UpperChaos.ScalarOriginalBindingDraft.sum_get_of_length,
      ``Grothe.UpperChaos.ScalarOriginalBindingDraft.scalarNumerator_eq_ledger] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
