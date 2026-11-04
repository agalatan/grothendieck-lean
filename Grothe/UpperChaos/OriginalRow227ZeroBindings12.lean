import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero12

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings12

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero12.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero12.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (384 + i.val) ∧
      (entry i).IS = S (384 + i.val + 1) ∧
      (entry i).IU = T 0 (384 + i.val) ∧
      (entry i).next = T 0 (384 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root385).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root386).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root387).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root388).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root389).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root390).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root391).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root392).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root393).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root394).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root395).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root396).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root397).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root398).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root399).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root400).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root401).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root402).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root403).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root404).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root405).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root406).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root407).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root408).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root409).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root410).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root411).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root412).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root413).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root414).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root415).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings12.S_eq_root416).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (384 + i.val)) (S (384 + i.val + 1))
      (T 0 (384 + i.val)) (T 0 (384 + i.val + 1))
      (OriginalRow227Roots.root_pos (384 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero12.entries OriginalRow227TriangleZero12.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings12.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings12.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings12
