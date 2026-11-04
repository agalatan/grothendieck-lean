import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow243
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow244
import Grothe.UpperChaos.OriginalRow227TriangleForward2088

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow244

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2088 : OriginalRow227TriangleForward2088.entries.size = 15 := rfl

def entry2088 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2088.entries[i.val]'(by rw [size2088]; exact i.isLt)

theorem fields2088 (i : Fin 15) :
    (entry2088 i).IA = shift ∧ (entry2088 i).ID = S (243 + i.val + 1) ∧
      (entry2088 i).IC = S 244 ∧ (entry2088 i).Inext = T 243 (243 + i.val + 1) ∧
      (entry2088 i).Icur = T 243 (243 + i.val) ∧
      (entry2088 i).output = T 244 (243 + i.val) ∧
      (entry2088 i).charge = charge 243 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root244).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow243.block2103_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow244.block2104_value ⟨14, by decide⟩).symm, rfl⟩

theorem step2088 (i : Fin 15) :
    forwardStepOK (-768) (charge 243 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 244) (T 243 (243 + i.val + 1))
      (T 243 (243 + i.val)) (T 244 (243 + i.val))
      (OriginalRow227Roots.root_pos 244 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 243 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2088.entries OriginalRow227TriangleForward2088.checked
    ⟨i.val, by rw [size2088]; exact i.isLt⟩
  change (entry2088 i).check = true at h
  rcases fields2088 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 243 ≤ d) (hhi : d < 258) :
    forwardStepOK (-768) (charge 243 d) shift (S (d + 1)) (S 244)
      (T 243 (d + 1)) (T 243 d) (T 244 d)
      (OriginalRow227Roots.root_pos 244 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 243 (by decide)) = true := by
  have hi : d - 243 < 15 := by omega
  have heq : 243 + (d - 243) = d := by omega
  simpa only [heq] using step2088 ⟨d - 243, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow244.fields2088,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow244.step2088,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow244.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow244
