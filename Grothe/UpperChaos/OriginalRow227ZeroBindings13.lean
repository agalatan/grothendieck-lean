import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero13

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings13

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero13.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero13.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (416 + i.val) ∧
      (entry i).IS = S (416 + i.val + 1) ∧
      (entry i).IU = T 0 (416 + i.val) ∧
      (entry i).next = T 0 (416 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root417).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root418).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root419).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root420).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root421).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root422).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root423).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root424).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root425).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root426).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root427).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root428).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root429).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root430).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root431).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root432).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root433).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root434).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root435).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root436).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root437).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root438).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root439).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root440).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root441).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root442).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root443).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root444).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root445).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root446).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root447).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings13.S_eq_root448).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (416 + i.val)) (S (416 + i.val + 1))
      (T 0 (416 + i.val)) (T 0 (416 + i.val + 1))
      (OriginalRow227Roots.root_pos (416 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero13.entries OriginalRow227TriangleZero13.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings13.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings13.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings13
