import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero02

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings02

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero02.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero02.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (64 + i.val) ∧
      (entry i).IS = S (64 + i.val + 1) ∧
      (entry i).IU = T 0 (64 + i.val) ∧
      (entry i).next = T 0 (64 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (64 + i.val)) (S (64 + i.val + 1))
      (T 0 (64 + i.val)) (T 0 (64 + i.val + 1))
      (OriginalRow227Roots.root_pos (64 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero02.entries OriginalRow227TriangleZero02.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings02.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings02.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings02
