import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234
import Grothe.UpperChaos.OriginalRow227TriangleForward2076
import Grothe.UpperChaos.OriginalRow227TriangleForward2077

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2076 : OriginalRow227TriangleForward2076.entries.size = 32 := rfl

def entry2076 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2076.entries[i.val]'(by rw [size2076]; exact i.isLt)

theorem fields2076 (i : Fin 32) :
    (entry2076 i).IA = shift ∧ (entry2076 i).ID = S (233 + i.val + 1) ∧
      (entry2076 i).IC = S 234 ∧ (entry2076 i).Inext = T 233 (233 + i.val + 1) ∧
      (entry2076 i).Icur = T 233 (233 + i.val) ∧
      (entry2076 i).output = T 234 (233 + i.val) ∧
      (entry2076 i).charge = charge 233 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2076 (i : Fin 32) :
    forwardStepOK (-768) (charge 233 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 234) (T 233 (233 + i.val + 1))
      (T 233 (233 + i.val)) (T 234 (233 + i.val))
      (OriginalRow227Roots.root_pos 234 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 233 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2076.entries OriginalRow227TriangleForward2076.checked
    ⟨i.val, by rw [size2076]; exact i.isLt⟩
  change (entry2076 i).check = true at h
  rcases fields2076 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2077 : OriginalRow227TriangleForward2077.entries.size = 3 := rfl

def entry2077 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2077.entries[i.val]'(by rw [size2077]; exact i.isLt)

theorem fields2077 (i : Fin 3) :
    (entry2077 i).IA = shift ∧ (entry2077 i).ID = S (265 + i.val + 1) ∧
      (entry2077 i).IC = S 234 ∧ (entry2077 i).Inext = T 233 (265 + i.val + 1) ∧
      (entry2077 i).Icur = T 233 (265 + i.val) ∧
      (entry2077 i).output = T 234 (265 + i.val) ∧
      (entry2077 i).charge = charge 233 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root234).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨2, by decide⟩).symm, rfl⟩

theorem step2077 (i : Fin 3) :
    forwardStepOK (-768) (charge 233 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 234) (T 233 (265 + i.val + 1))
      (T 233 (265 + i.val)) (T 234 (265 + i.val))
      (OriginalRow227Roots.root_pos 234 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 233 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2077.entries OriginalRow227TriangleForward2077.checked
    ⟨i.val, by rw [size2077]; exact i.isLt⟩
  change (entry2077 i).check = true at h
  rcases fields2077 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 233 ≤ d) (hhi : d < 268) :
    forwardStepOK (-768) (charge 233 d) shift (S (d + 1)) (S 234)
      (T 233 (d + 1)) (T 233 d) (T 234 d)
      (OriginalRow227Roots.root_pos 234 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 233 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    have hi : d - 233 < 32 := by omega
    have heq : 233 + (d - 233) = d := by omega
    simpa only [heq] using step2076 ⟨d - 233, hi⟩
  ·
    have hi : d - 265 < 3 := by omega
    have heq : 265 + (d - 265) = d := by omega
    simpa only [heq] using step2077 ⟨d - 265, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234.fields2076,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234.step2076,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234.fields2077,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234.step2077,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow234
