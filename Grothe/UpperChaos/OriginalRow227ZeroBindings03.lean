import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero03

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings03

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero03.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero03.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (96 + i.val) ∧
      (entry i).IS = S (96 + i.val + 1) ∧
      (entry i).IU = T 0 (96 + i.val) ∧
      (entry i).next = T 0 (96 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (96 + i.val)) (S (96 + i.val + 1))
      (T 0 (96 + i.val)) (T 0 (96 + i.val + 1))
      (OriginalRow227Roots.root_pos (96 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero03.entries OriginalRow227TriangleZero03.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings03.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings03.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings03
