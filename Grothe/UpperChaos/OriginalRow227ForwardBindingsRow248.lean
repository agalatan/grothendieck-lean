import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow247
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow248
import Grothe.UpperChaos.OriginalRow227TriangleForward2092

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow248

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2092 : OriginalRow227TriangleForward2092.entries.size = 7 := rfl

def entry2092 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2092.entries[i.val]'(by rw [size2092]; exact i.isLt)

theorem fields2092 (i : Fin 7) :
    (entry2092 i).IA = shift ∧ (entry2092 i).ID = S (247 + i.val + 1) ∧
      (entry2092 i).IC = S 248 ∧ (entry2092 i).Inext = T 247 (247 + i.val + 1) ∧
      (entry2092 i).Icur = T 247 (247 + i.val) ∧
      (entry2092 i).output = T 248 (247 + i.val) ∧
      (entry2092 i).charge = charge 247 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root248).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow248.block2108_value ⟨6, by decide⟩).symm, rfl⟩

theorem step2092 (i : Fin 7) :
    forwardStepOK (-768) (charge 247 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 248) (T 247 (247 + i.val + 1))
      (T 247 (247 + i.val)) (T 248 (247 + i.val))
      (OriginalRow227Roots.root_pos 248 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 247 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2092.entries OriginalRow227TriangleForward2092.checked
    ⟨i.val, by rw [size2092]; exact i.isLt⟩
  change (entry2092 i).check = true at h
  rcases fields2092 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 247 ≤ d) (hhi : d < 254) :
    forwardStepOK (-768) (charge 247 d) shift (S (d + 1)) (S 248)
      (T 247 (d + 1)) (T 247 d) (T 248 d)
      (OriginalRow227Roots.root_pos 248 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 247 (by decide)) = true := by
  have hi : d - 247 < 7 := by omega
  have heq : 247 + (d - 247) = d := by omega
  simpa only [heq] using step2092 ⟨d - 247, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow248.fields2092,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow248.step2092,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow248.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow248
