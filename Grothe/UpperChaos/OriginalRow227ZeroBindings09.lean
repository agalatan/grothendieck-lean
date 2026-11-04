import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero09

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings09

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero09.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero09.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (288 + i.val) ∧
      (entry i).IS = S (288 + i.val + 1) ∧
      (entry i).IU = T 0 (288 + i.val) ∧
      (entry i).next = T 0 (288 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root289).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root290).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root291).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root292).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root293).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root294).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root295).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root296).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root297).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root298).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root299).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root300).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root301).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root302).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root303).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root304).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root305).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root306).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root307).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root308).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root309).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root310).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root311).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root312).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root313).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root314).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root315).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root316).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root317).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root318).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root319).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings09.S_eq_root320).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (288 + i.val)) (S (288 + i.val + 1))
      (T 0 (288 + i.val)) (T 0 (288 + i.val + 1))
      (OriginalRow227Roots.root_pos (288 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero09.entries OriginalRow227TriangleZero09.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings09.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings09.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings09
