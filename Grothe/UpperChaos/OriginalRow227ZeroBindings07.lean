import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero07

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings07

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero07.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero07.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (224 + i.val) ∧
      (entry i).IS = S (224 + i.val + 1) ∧
      (entry i).IU = T 0 (224 + i.val) ∧
      (entry i).next = T 0 (224 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root225).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root226).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root228).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root236).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root238).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root239).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root242).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root246).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root249).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root250).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root251).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root252).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root253).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root254).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root255).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings07.S_eq_root256).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (224 + i.val)) (S (224 + i.val + 1))
      (T 0 (224 + i.val)) (T 0 (224 + i.val + 1))
      (OriginalRow227Roots.root_pos (224 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero07.entries OriginalRow227TriangleZero07.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings07.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings07.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings07
