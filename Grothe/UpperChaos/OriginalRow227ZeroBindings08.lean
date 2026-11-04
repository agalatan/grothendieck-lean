import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero08

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings08

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero08.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero08.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (256 + i.val) ∧
      (entry i).IS = S (256 + i.val + 1) ∧
      (entry i).IU = T 0 (256 + i.val) ∧
      (entry i).next = T 0 (256 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root257).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root258).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root259).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root260).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root261).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root262).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root263).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root264).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root265).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root266).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root267).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root268).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root269).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root270).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root271).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root272).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root273).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root274).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root275).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root276).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root277).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root278).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root279).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root280).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root281).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root282).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root283).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root284).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root285).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root286).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root287).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings08.S_eq_root288).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (256 + i.val)) (S (256 + i.val + 1))
      (T 0 (256 + i.val)) (T 0 (256 + i.val + 1))
      (OriginalRow227Roots.root_pos (256 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero08.entries OriginalRow227TriangleZero08.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings08.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings08.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings08
