import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero15

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings15

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero15.entries.size = 21 := rfl

def entry (i : Fin 21) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero15.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 21) :
    (entry i).IA = shift ∧ (entry i).IR = R (480 + i.val) ∧
      (entry i).IS = S (480 + i.val + 1) ∧
      (entry i).IU = T 0 (480 + i.val) ∧
      (entry i).next = T 0 (480 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root481).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root482).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root483).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root484).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root485).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root486).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root487).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root488).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root489).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root490).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root491).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root492).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root493).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root494).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root495).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root496).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root497).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root498).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root499).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root500).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings15.S_eq_root501).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨21, by decide⟩).symm⟩

theorem step (i : Fin 21) :
    zeroStepOK (-768) shift (R (480 + i.val)) (S (480 + i.val + 1))
      (T 0 (480 + i.val)) (T 0 (480 + i.val + 1))
      (OriginalRow227Roots.root_pos (480 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero15.entries OriginalRow227TriangleZero15.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings15.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings15.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings15
