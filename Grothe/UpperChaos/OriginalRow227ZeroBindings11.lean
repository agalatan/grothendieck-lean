import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero11

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings11

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero11.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero11.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (352 + i.val) ∧
      (entry i).IS = S (352 + i.val + 1) ∧
      (entry i).IU = T 0 (352 + i.val) ∧
      (entry i).next = T 0 (352 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root353).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root354).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root355).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root356).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root357).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root358).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root359).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root360).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root361).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root362).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root363).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root364).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root365).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root366).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root367).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root368).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root369).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root370).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root371).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root372).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root373).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root374).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root375).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root376).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root377).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root378).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root379).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root380).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root381).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root382).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root383).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings11.S_eq_root384).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (352 + i.val)) (S (352 + i.val + 1))
      (T 0 (352 + i.val)) (T 0 (352 + i.val + 1))
      (OriginalRow227Roots.root_pos (352 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero11.entries OriginalRow227TriangleZero11.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings11.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings11.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings11
