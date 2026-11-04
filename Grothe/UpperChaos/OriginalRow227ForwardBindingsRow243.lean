import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow242
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow243
import Grothe.UpperChaos.OriginalRow227TriangleForward2087

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow243

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2087 : OriginalRow227TriangleForward2087.entries.size = 17 := rfl

def entry2087 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2087.entries[i.val]'(by rw [size2087]; exact i.isLt)

theorem fields2087 (i : Fin 17) :
    (entry2087 i).IA = shift ∧ (entry2087 i).ID = S (242 + i.val + 1) ∧
      (entry2087 i).IC = S 243 ∧ (entry2087 i).Inext = T 242 (242 + i.val + 1) ∧
      (entry2087 i).Icur = T 242 (242 + i.val) ∧
      (entry2087 i).output = T 243 (242 + i.val) ∧
      (entry2087 i).charge = charge 242 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root243).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow242.block2102_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨16, by decide⟩).symm, rfl⟩

theorem step2087 (i : Fin 17) :
    forwardStepOK (-768) (charge 242 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 243) (T 242 (242 + i.val + 1))
      (T 242 (242 + i.val)) (T 243 (242 + i.val))
      (OriginalRow227Roots.root_pos 243 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 242 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2087.entries OriginalRow227TriangleForward2087.checked
    ⟨i.val, by rw [size2087]; exact i.isLt⟩
  change (entry2087 i).check = true at h
  rcases fields2087 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 242 ≤ d) (hhi : d < 259) :
    forwardStepOK (-768) (charge 242 d) shift (S (d + 1)) (S 243)
      (T 242 (d + 1)) (T 242 d) (T 243 d)
      (OriginalRow227Roots.root_pos 243 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 242 (by decide)) = true := by
  have hi : d - 242 < 17 := by omega
  have heq : 242 + (d - 242) = d := by omega
  simpa only [heq] using step2087 ⟨d - 242, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow243.fields2087,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow243.step2087,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow243.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow243
