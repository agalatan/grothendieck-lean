import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero14

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings14

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero14.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero14.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (448 + i.val) ∧
      (entry i).IS = S (448 + i.val + 1) ∧
      (entry i).IU = T 0 (448 + i.val) ∧
      (entry i).next = T 0 (448 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root449).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root450).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root451).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root452).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root453).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root454).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root455).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root456).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root457).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root458).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root459).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root460).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root461).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root462).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root463).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root464).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root465).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root466).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root467).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root468).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root469).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root470).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root471).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root472).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root473).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root474).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root475).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root476).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root477).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root478).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root479).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings14.S_eq_root480).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (448 + i.val)) (S (448 + i.val + 1))
      (T 0 (448 + i.val)) (T 0 (448 + i.val + 1))
      (OriginalRow227Roots.root_pos (448 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero14.entries OriginalRow227TriangleZero14.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings14.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings14.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings14
