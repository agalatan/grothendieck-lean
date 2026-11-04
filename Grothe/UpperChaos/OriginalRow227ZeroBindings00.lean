import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero00

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings00

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero00.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero00.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (0 + i.val) ∧
      (entry i).IS = S (0 + i.val + 1) ∧
      (entry i).IU = T 0 (0 + i.val) ∧
      (entry i).next = T 0 (0 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root3).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root4).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root5).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root6).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root7).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root8).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root9).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root11).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root12).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root13).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root18).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root20).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root21).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root22).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root23).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root25).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root26).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root27).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root30).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root31).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings00.S_eq_root32).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (0 + i.val)) (S (0 + i.val + 1))
      (T 0 (0 + i.val)) (T 0 (0 + i.val + 1))
      (OriginalRow227Roots.root_pos (0 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero00.entries OriginalRow227TriangleZero00.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings00.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings00.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings00
