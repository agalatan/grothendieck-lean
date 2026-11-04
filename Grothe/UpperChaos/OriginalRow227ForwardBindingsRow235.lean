import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow234
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow235
import Grothe.UpperChaos.OriginalRow227TriangleForward2078
import Grothe.UpperChaos.OriginalRow227TriangleForward2079

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2078 : OriginalRow227TriangleForward2078.entries.size = 32 := rfl

def entry2078 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2078.entries[i.val]'(by rw [size2078]; exact i.isLt)

theorem fields2078 (i : Fin 32) :
    (entry2078 i).IA = shift ∧ (entry2078 i).ID = S (234 + i.val + 1) ∧
      (entry2078 i).IC = S 235 ∧ (entry2078 i).Inext = T 234 (234 + i.val + 1) ∧
      (entry2078 i).Icur = T 234 (234 + i.val) ∧
      (entry2078 i).output = T 235 (234 + i.val) ∧
      (entry2078 i).charge = charge 234 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2092_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2094_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2078 (i : Fin 32) :
    forwardStepOK (-768) (charge 234 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 235) (T 234 (234 + i.val + 1))
      (T 234 (234 + i.val)) (T 235 (234 + i.val))
      (OriginalRow227Roots.root_pos 235 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 234 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2078.entries OriginalRow227TriangleForward2078.checked
    ⟨i.val, by rw [size2078]; exact i.isLt⟩
  change (entry2078 i).check = true at h
  rcases fields2078 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2079 : OriginalRow227TriangleForward2079.entries.size = 1 := rfl

def entry2079 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2079.entries[i.val]'(by rw [size2079]; exact i.isLt)

theorem fields2079 (i : Fin 1) :
    (entry2079 i).IA = shift ∧ (entry2079 i).ID = S (266 + i.val + 1) ∧
      (entry2079 i).IC = S 235 ∧ (entry2079 i).Inext = T 234 (266 + i.val + 1) ∧
      (entry2079 i).Icur = T 234 (266 + i.val) ∧
      (entry2079 i).output = T 235 (266 + i.val) ∧
      (entry2079 i).charge = charge 234 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root235).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow234.block2093_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow235.block2095_value ⟨0, by decide⟩).symm, rfl⟩

theorem step2079 (i : Fin 1) :
    forwardStepOK (-768) (charge 234 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 235) (T 234 (266 + i.val + 1))
      (T 234 (266 + i.val)) (T 235 (266 + i.val))
      (OriginalRow227Roots.root_pos 235 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 234 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2079.entries OriginalRow227TriangleForward2079.checked
    ⟨i.val, by rw [size2079]; exact i.isLt⟩
  change (entry2079 i).check = true at h
  rcases fields2079 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 234 ≤ d) (hhi : d < 267) :
    forwardStepOK (-768) (charge 234 d) shift (S (d + 1)) (S 235)
      (T 234 (d + 1)) (T 234 d) (T 235 d)
      (OriginalRow227Roots.root_pos 235 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 234 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    have hi : d - 234 < 32 := by omega
    have heq : 234 + (d - 234) = d := by omega
    simpa only [heq] using step2078 ⟨d - 234, hi⟩
  ·
    have hi : d - 266 < 1 := by omega
    have heq : 266 + (d - 266) = d := by omega
    simpa only [heq] using step2079 ⟨d - 266, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235.fields2078,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235.step2078,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235.fields2079,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235.step2079,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow235
