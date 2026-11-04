import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow246
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow247
import Grothe.UpperChaos.OriginalRow227TriangleForward2091

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow247

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2091 : OriginalRow227TriangleForward2091.entries.size = 9 := rfl

def entry2091 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2091.entries[i.val]'(by rw [size2091]; exact i.isLt)

theorem fields2091 (i : Fin 9) :
    (entry2091 i).IA = shift ∧ (entry2091 i).ID = S (246 + i.val + 1) ∧
      (entry2091 i).IC = S 247 ∧ (entry2091 i).Inext = T 246 (246 + i.val + 1) ∧
      (entry2091 i).Icur = T 246 (246 + i.val) ∧
      (entry2091 i).output = T 247 (246 + i.val) ∧
      (entry2091 i).charge = charge 246 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root247).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow246.block2106_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow247.block2107_value ⟨8, by decide⟩).symm, rfl⟩

theorem step2091 (i : Fin 9) :
    forwardStepOK (-768) (charge 246 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 247) (T 246 (246 + i.val + 1))
      (T 246 (246 + i.val)) (T 247 (246 + i.val))
      (OriginalRow227Roots.root_pos 247 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 246 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2091.entries OriginalRow227TriangleForward2091.checked
    ⟨i.val, by rw [size2091]; exact i.isLt⟩
  change (entry2091 i).check = true at h
  rcases fields2091 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 246 ≤ d) (hhi : d < 255) :
    forwardStepOK (-768) (charge 246 d) shift (S (d + 1)) (S 247)
      (T 246 (d + 1)) (T 246 d) (T 247 d)
      (OriginalRow227Roots.root_pos 247 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 246 (by decide)) = true := by
  have hi : d - 246 < 9 := by omega
  have heq : 246 + (d - 246) = d := by omega
  simpa only [heq] using step2091 ⟨d - 246, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow247.fields2091,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow247.step2091,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow247.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow247
