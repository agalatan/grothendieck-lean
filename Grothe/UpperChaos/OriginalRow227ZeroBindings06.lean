import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero06

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings06

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero06.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero06.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (192 + i.val) ∧
      (entry i).IS = S (192 + i.val + 1) ∧
      (entry i).IU = T 0 (192 + i.val) ∧
      (entry i).next = T 0 (192 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root194).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root195).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root196).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root197).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root198).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root199).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root200).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root201).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root202).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root203).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root208).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root209).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root210).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root213).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root223).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings06.S_eq_root224).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (192 + i.val)) (S (192 + i.val + 1))
      (T 0 (192 + i.val)) (T 0 (192 + i.val + 1))
      (OriginalRow227Roots.root_pos (192 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero06.entries OriginalRow227TriangleZero06.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings06.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings06.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings06
