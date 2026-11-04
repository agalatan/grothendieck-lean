import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow249
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow250
import Grothe.UpperChaos.OriginalRow227TriangleForward2094

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow250

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2094 : OriginalRow227TriangleForward2094.entries.size = 3 := rfl

def entry2094 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2094.entries[i.val]'(by rw [size2094]; exact i.isLt)

theorem fields2094 (i : Fin 3) :
    (entry2094 i).IA = shift ∧ (entry2094 i).ID = S (249 + i.val + 1) ∧
      (entry2094 i).IC = S 250 ∧ (entry2094 i).Inext = T 249 (249 + i.val + 1) ∧
      (entry2094 i).Icur = T 249 (249 + i.val) ∧
      (entry2094 i).output = T 250 (249 + i.val) ∧
      (entry2094 i).charge = charge 249 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root250).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow250.block2110_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root250).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow250.block2110_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root250).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow249.block2109_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow250.block2110_value ⟨2, by decide⟩).symm, rfl⟩

theorem step2094 (i : Fin 3) :
    forwardStepOK (-768) (charge 249 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 250) (T 249 (249 + i.val + 1))
      (T 249 (249 + i.val)) (T 250 (249 + i.val))
      (OriginalRow227Roots.root_pos 250 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 249 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2094.entries OriginalRow227TriangleForward2094.checked
    ⟨i.val, by rw [size2094]; exact i.isLt⟩
  change (entry2094 i).check = true at h
  rcases fields2094 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 249 ≤ d) (hhi : d < 252) :
    forwardStepOK (-768) (charge 249 d) shift (S (d + 1)) (S 250)
      (T 249 (d + 1)) (T 249 d) (T 250 d)
      (OriginalRow227Roots.root_pos 250 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 249 (by decide)) = true := by
  have hi : d - 249 < 3 := by omega
  have heq : 249 + (d - 249) = d := by omega
  simpa only [heq] using step2094 ⟨d - 249, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow250.fields2094,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow250.step2094,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow250.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow250
