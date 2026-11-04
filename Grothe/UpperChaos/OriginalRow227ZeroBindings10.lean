import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero10

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings10

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero10.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero10.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (320 + i.val) ∧
      (entry i).IS = S (320 + i.val + 1) ∧
      (entry i).IU = T 0 (320 + i.val) ∧
      (entry i).next = T 0 (320 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root321).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root322).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root323).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root324).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root325).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root326).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root327).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root328).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root329).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root330).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root331).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root332).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root333).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root334).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root335).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root336).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root337).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root338).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root339).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root340).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root341).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root342).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root343).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root344).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root345).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root346).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root347).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root348).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root349).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root350).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root351).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings10.S_eq_root352).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (320 + i.val)) (S (320 + i.val + 1))
      (T 0 (320 + i.val)) (T 0 (320 + i.val + 1))
      (OriginalRow227Roots.root_pos (320 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero10.entries OriginalRow227TriangleZero10.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings10.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings10.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings10
