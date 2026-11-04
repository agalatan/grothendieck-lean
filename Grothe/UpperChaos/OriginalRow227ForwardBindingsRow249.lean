import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow248
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow249
import Grothe.UpperChaos.OriginalRow227TriangleForward2093

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow249

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2093 : OriginalRow227TriangleForward2093.entries.size = 5 := rfl

def entry2093 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2093.entries[i.val]'(by rw [size2093]; exact i.isLt)

theorem fields2093 (i : Fin 5) :
    (entry2093 i).IA = shift ∧ (entry2093 i).ID = S (248 + i.val + 1) ∧
      (entry2093 i).IC = S 249 ∧ (entry2093 i).Inext = T 248 (248 + i.val + 1) ∧
      (entry2093 i).Icur = T 248 (248 + i.val) ∧
      (entry2093 i).output = T 249 (248 + i.val) ∧
      (entry2093 i).charge = charge 248 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root249).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root249).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root249).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root249).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root249).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨4, by decide⟩).symm, rfl⟩

theorem step2093 (i : Fin 5) :
    forwardStepOK (-768) (charge 248 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 249) (T 248 (248 + i.val + 1))
      (T 248 (248 + i.val)) (T 249 (248 + i.val))
      (OriginalRow227Roots.root_pos 249 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 248 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2093.entries OriginalRow227TriangleForward2093.checked
    ⟨i.val, by rw [size2093]; exact i.isLt⟩
  change (entry2093 i).check = true at h
  rcases fields2093 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 248 ≤ d) (hhi : d < 253) :
    forwardStepOK (-768) (charge 248 d) shift (S (d + 1)) (S 249)
      (T 248 (d + 1)) (T 248 d) (T 249 d)
      (OriginalRow227Roots.root_pos 249 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 248 (by decide)) = true := by
  have hi : d - 248 < 5 := by omega
  have heq : 248 + (d - 248) = d := by omega
  simpa only [heq] using step2093 ⟨d - 248, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow249.fields2093,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow249.step2093,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow249.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow249
