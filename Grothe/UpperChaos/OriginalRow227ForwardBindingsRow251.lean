import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow250
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow251
import Grothe.UpperChaos.OriginalRow227TriangleForward2095

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow251

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2095 : OriginalRow227TriangleForward2095.entries.size = 1 := rfl

def entry2095 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2095.entries[i.val]'(by rw [size2095]; exact i.isLt)

theorem fields2095 (i : Fin 1) :
    (entry2095 i).IA = shift ∧ (entry2095 i).ID = S (250 + i.val + 1) ∧
      (entry2095 i).IC = S 251 ∧ (entry2095 i).Inext = T 250 (250 + i.val + 1) ∧
      (entry2095 i).Icur = T 250 (250 + i.val) ∧
      (entry2095 i).output = T 251 (250 + i.val) ∧
      (entry2095 i).charge = charge 250 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root251).symm,
      (OriginalRow227TriangleBindingsRow250.block2110_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow250.block2110_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow251.block2111_value ⟨0, by decide⟩).symm, rfl⟩

theorem step2095 (i : Fin 1) :
    forwardStepOK (-768) (charge 250 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 251) (T 250 (250 + i.val + 1))
      (T 250 (250 + i.val)) (T 251 (250 + i.val))
      (OriginalRow227Roots.root_pos 251 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 250 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2095.entries OriginalRow227TriangleForward2095.checked
    ⟨i.val, by rw [size2095]; exact i.isLt⟩
  change (entry2095 i).check = true at h
  rcases fields2095 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 250 ≤ d) (hhi : d < 251) :
    forwardStepOK (-768) (charge 250 d) shift (S (d + 1)) (S 251)
      (T 250 (d + 1)) (T 250 d) (T 251 d)
      (OriginalRow227Roots.root_pos 251 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 250 (by decide)) = true := by
  have hi : d - 250 < 1 := by omega
  have heq : 250 + (d - 250) = d := by omega
  simpa only [heq] using step2095 ⟨d - 250, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow251.fields2095,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow251.step2095,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow251.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow251
