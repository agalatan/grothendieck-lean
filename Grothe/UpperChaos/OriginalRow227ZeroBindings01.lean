import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero01

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings01

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero01.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero01.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (32 + i.val) ∧
      (entry i).IS = S (32 + i.val + 1) ∧
      (entry i).IU = T 0 (32 + i.val) ∧
      (entry i).next = T 0 (32 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root37).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root38).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (32 + i.val)) (S (32 + i.val + 1))
      (T 0 (32 + i.val)) (T 0 (32 + i.val + 1))
      (OriginalRow227Roots.root_pos (32 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero01.entries OriginalRow227TriangleZero01.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings01.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings01.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings01
