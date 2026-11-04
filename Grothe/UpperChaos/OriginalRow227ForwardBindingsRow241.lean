import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow240
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow241
import Grothe.UpperChaos.OriginalRow227TriangleForward2085

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow241

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2085 : OriginalRow227TriangleForward2085.entries.size = 21 := rfl

def entry2085 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2085.entries[i.val]'(by rw [size2085]; exact i.isLt)

theorem fields2085 (i : Fin 21) :
    (entry2085 i).IA = shift ∧ (entry2085 i).ID = S (240 + i.val + 1) ∧
      (entry2085 i).IC = S 241 ∧ (entry2085 i).Inext = T 240 (240 + i.val + 1) ∧
      (entry2085 i).Icur = T 240 (240 + i.val) ∧
      (entry2085 i).output = T 241 (240 + i.val) ∧
      (entry2085 i).charge = charge 240 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root241).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow241.block2101_value ⟨20, by decide⟩).symm, rfl⟩

theorem step2085 (i : Fin 21) :
    forwardStepOK (-768) (charge 240 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 241) (T 240 (240 + i.val + 1))
      (T 240 (240 + i.val)) (T 241 (240 + i.val))
      (OriginalRow227Roots.root_pos 241 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 240 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2085.entries OriginalRow227TriangleForward2085.checked
    ⟨i.val, by rw [size2085]; exact i.isLt⟩
  change (entry2085 i).check = true at h
  rcases fields2085 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 240 ≤ d) (hhi : d < 261) :
    forwardStepOK (-768) (charge 240 d) shift (S (d + 1)) (S 241)
      (T 240 (d + 1)) (T 240 d) (T 241 d)
      (OriginalRow227Roots.root_pos 241 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 240 (by decide)) = true := by
  have hi : d - 240 < 21 := by omega
  have heq : 240 + (d - 240) = d := by omega
  simpa only [heq] using step2085 ⟨d - 240, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow241.fields2085,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow241.step2085,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow241.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow241
