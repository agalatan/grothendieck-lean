import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero05

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings05

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero05.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero05.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (160 + i.val) ∧
      (entry i).IS = S (160 + i.val + 1) ∧
      (entry i).IU = T 0 (160 + i.val) ∧
      (entry i).next = T 0 (160 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root184).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root191).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (160 + i.val)) (S (160 + i.val + 1))
      (T 0 (160 + i.val)) (T 0 (160 + i.val + 1))
      (OriginalRow227Roots.root_pos (160 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero05.entries OriginalRow227TriangleZero05.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings05.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings05.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings05
