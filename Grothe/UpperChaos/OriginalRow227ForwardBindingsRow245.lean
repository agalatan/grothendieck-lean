import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow244
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow245
import Grothe.UpperChaos.OriginalRow227TriangleForward2089

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow245

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2089 : OriginalRow227TriangleForward2089.entries.size = 13 := rfl

def entry2089 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2089.entries[i.val]'(by rw [size2089]; exact i.isLt)

theorem fields2089 (i : Fin 13) :
    (entry2089 i).IA = shift ∧ (entry2089 i).ID = S (244 + i.val + 1) ∧
      (entry2089 i).IC = S 245 ∧ (entry2089 i).Inext = T 244 (244 + i.val + 1) ∧
      (entry2089 i).Icur = T 244 (244 + i.val) ∧
      (entry2089 i).output = T 245 (244 + i.val) ∧
      (entry2089 i).charge = charge 244 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root245).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow245.block2105_value ⟨12, by decide⟩).symm, rfl⟩

theorem step2089 (i : Fin 13) :
    forwardStepOK (-768) (charge 244 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 245) (T 244 (244 + i.val + 1))
      (T 244 (244 + i.val)) (T 245 (244 + i.val))
      (OriginalRow227Roots.root_pos 245 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 244 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2089.entries OriginalRow227TriangleForward2089.checked
    ⟨i.val, by rw [size2089]; exact i.isLt⟩
  change (entry2089 i).check = true at h
  rcases fields2089 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 244 ≤ d) (hhi : d < 257) :
    forwardStepOK (-768) (charge 244 d) shift (S (d + 1)) (S 245)
      (T 244 (d + 1)) (T 244 d) (T 245 d)
      (OriginalRow227Roots.root_pos 245 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 244 (by decide)) = true := by
  have hi : d - 244 < 13 := by omega
  have heq : 244 + (d - 244) = d := by omega
  simpa only [heq] using step2089 ⟨d - 244, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow245.fields2089,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow245.step2089,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow245.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow245
