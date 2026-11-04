import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleZero04

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ZeroBindings04

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem entries_size : OriginalRow227TriangleZero04.entries.size = 32 := rfl

def entry (i : Fin 32) : ZeroEntry (-768) :=
  OriginalRow227TriangleZero04.entries[i.val]'(by rw [entries_size]; exact i.isLt)

theorem fields (i : Fin 32) :
    (entry i).IA = shift ∧ (entry i).IR = R (128 + i.val) ∧
      (entry i).IS = S (128 + i.val + 1) ∧
      (entry i).IU = T 0 (128 + i.val) ∧
      (entry i).next = T 0 (128 + i.val + 1) := by
  fin_cases i
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨1, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨2, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨3, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨4, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨5, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨6, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨7, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨8, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨9, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨10, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨11, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨12, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨13, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨14, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨15, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨16, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨17, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨18, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨19, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨20, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨21, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨22, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨23, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨24, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨25, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨26, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨27, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨28, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨29, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨30, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨31, by decide⟩).symm⟩
  · exact ⟨rfl, rfl, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨0, by decide⟩).symm⟩

theorem step (i : Fin 32) :
    zeroStepOK (-768) shift (R (128 + i.val)) (S (128 + i.val + 1))
      (T 0 (128 + i.val)) (T 0 (128 + i.val + 1))
      (OriginalRow227Roots.root_pos (128 + i.val + 1) (by omega)
        (by have hi := i.isLt; omega)) = true := by
  have h := blockCheck_get ZeroEntry.check OriginalRow227TriangleZero04.entries OriginalRow227TriangleZero04.checked
    ⟨i.val, by rw [entries_size]; exact i.isLt⟩
  change (entry i).check = true at h
  rcases fields i with ⟨hA, hR, hS, hU, hN⟩
  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings04.fields,
      ``Grothe.UpperChaos.OriginalRow227ZeroBindings04.step] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ZeroBindings04
