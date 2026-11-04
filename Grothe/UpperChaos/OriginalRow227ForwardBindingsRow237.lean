import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow236
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow237
import Grothe.UpperChaos.OriginalRow227TriangleForward2081

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow237

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2081 : OriginalRow227TriangleForward2081.entries.size = 29 := rfl

def entry2081 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2081.entries[i.val]'(by rw [size2081]; exact i.isLt)

theorem fields2081 (i : Fin 29) :
    (entry2081 i).IA = shift ∧ (entry2081 i).ID = S (236 + i.val + 1) ∧
      (entry2081 i).IC = S 237 ∧ (entry2081 i).Inext = T 236 (236 + i.val + 1) ∧
      (entry2081 i).Icur = T 236 (236 + i.val) ∧
      (entry2081 i).output = T 237 (236 + i.val) ∧
      (entry2081 i).charge = charge 236 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root237).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow236.block2096_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow237.block2097_value ⟨28, by decide⟩).symm, rfl⟩

theorem step2081 (i : Fin 29) :
    forwardStepOK (-768) (charge 236 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 237) (T 236 (236 + i.val + 1))
      (T 236 (236 + i.val)) (T 237 (236 + i.val))
      (OriginalRow227Roots.root_pos 237 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 236 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2081.entries OriginalRow227TriangleForward2081.checked
    ⟨i.val, by rw [size2081]; exact i.isLt⟩
  change (entry2081 i).check = true at h
  rcases fields2081 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 236 ≤ d) (hhi : d < 265) :
    forwardStepOK (-768) (charge 236 d) shift (S (d + 1)) (S 237)
      (T 236 (d + 1)) (T 236 d) (T 237 d)
      (OriginalRow227Roots.root_pos 237 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 236 (by decide)) = true := by
  have hi : d - 236 < 29 := by omega
  have heq : 236 + (d - 236) = d := by omega
  simpa only [heq] using step2081 ⟨d - 236, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow237.fields2081,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow237.step2081,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow237.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow237
