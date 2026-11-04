import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow239
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow240
import Grothe.UpperChaos.OriginalRow227TriangleForward2084

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow240

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2084 : OriginalRow227TriangleForward2084.entries.size = 23 := rfl

def entry2084 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2084.entries[i.val]'(by rw [size2084]; exact i.isLt)

theorem fields2084 (i : Fin 23) :
    (entry2084 i).IA = shift ∧ (entry2084 i).ID = S (239 + i.val + 1) ∧
      (entry2084 i).IC = S 240 ∧ (entry2084 i).Inext = T 239 (239 + i.val + 1) ∧
      (entry2084 i).Icur = T 239 (239 + i.val) ∧
      (entry2084 i).output = T 240 (239 + i.val) ∧
      (entry2084 i).charge = charge 239 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root240).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow239.block2099_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow240.block2100_value ⟨22, by decide⟩).symm, rfl⟩

theorem step2084 (i : Fin 23) :
    forwardStepOK (-768) (charge 239 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 240) (T 239 (239 + i.val + 1))
      (T 239 (239 + i.val)) (T 240 (239 + i.val))
      (OriginalRow227Roots.root_pos 240 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 239 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2084.entries OriginalRow227TriangleForward2084.checked
    ⟨i.val, by rw [size2084]; exact i.isLt⟩
  change (entry2084 i).check = true at h
  rcases fields2084 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 239 ≤ d) (hhi : d < 262) :
    forwardStepOK (-768) (charge 239 d) shift (S (d + 1)) (S 240)
      (T 239 (d + 1)) (T 239 d) (T 240 d)
      (OriginalRow227Roots.root_pos 240 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 239 (by decide)) = true := by
  have hi : d - 239 < 23 := by omega
  have heq : 239 + (d - 239) = d := by omega
  simpa only [heq] using step2084 ⟨d - 239, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow240.fields2084,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow240.step2084,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow240.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow240
