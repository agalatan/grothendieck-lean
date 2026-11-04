import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow233
import Grothe.UpperChaos.OriginalRow227TriangleForward2074
import Grothe.UpperChaos.OriginalRow227TriangleForward2075

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2074 : OriginalRow227TriangleForward2074.entries.size = 32 := rfl

def entry2074 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2074.entries[i.val]'(by rw [size2074]; exact i.isLt)

theorem fields2074 (i : Fin 32) :
    (entry2074 i).IA = shift ∧ (entry2074 i).ID = S (232 + i.val + 1) ∧
      (entry2074 i).IC = S 233 ∧ (entry2074 i).Inext = T 232 (232 + i.val + 1) ∧
      (entry2074 i).Icur = T 232 (232 + i.val) ∧
      (entry2074 i).output = T 233 (232 + i.val) ∧
      (entry2074 i).charge = charge 232 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2090_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2074 (i : Fin 32) :
    forwardStepOK (-768) (charge 232 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 233) (T 232 (232 + i.val + 1))
      (T 232 (232 + i.val)) (T 233 (232 + i.val))
      (OriginalRow227Roots.root_pos 233 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 232 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2074.entries OriginalRow227TriangleForward2074.checked
    ⟨i.val, by rw [size2074]; exact i.isLt⟩
  change (entry2074 i).check = true at h
  rcases fields2074 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2075 : OriginalRow227TriangleForward2075.entries.size = 5 := rfl

def entry2075 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2075.entries[i.val]'(by rw [size2075]; exact i.isLt)

theorem fields2075 (i : Fin 5) :
    (entry2075 i).IA = shift ∧ (entry2075 i).ID = S (264 + i.val + 1) ∧
      (entry2075 i).IC = S 233 ∧ (entry2075 i).Inext = T 232 (264 + i.val + 1) ∧
      (entry2075 i).Icur = T 232 (264 + i.val) ∧
      (entry2075 i).output = T 233 (264 + i.val) ∧
      (entry2075 i).charge = charge 232 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root233).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow233.block2091_value ⟨4, by decide⟩).symm, rfl⟩

theorem step2075 (i : Fin 5) :
    forwardStepOK (-768) (charge 232 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 233) (T 232 (264 + i.val + 1))
      (T 232 (264 + i.val)) (T 233 (264 + i.val))
      (OriginalRow227Roots.root_pos 233 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 232 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2075.entries OriginalRow227TriangleForward2075.checked
    ⟨i.val, by rw [size2075]; exact i.isLt⟩
  change (entry2075 i).check = true at h
  rcases fields2075 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 232 ≤ d) (hhi : d < 269) :
    forwardStepOK (-768) (charge 232 d) shift (S (d + 1)) (S 233)
      (T 232 (d + 1)) (T 232 d) (T 233 d)
      (OriginalRow227Roots.root_pos 233 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 232 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    have hi : d - 232 < 32 := by omega
    have heq : 232 + (d - 232) = d := by omega
    simpa only [heq] using step2074 ⟨d - 232, hi⟩
  ·
    have hi : d - 264 < 5 := by omega
    have heq : 264 + (d - 264) = d := by omega
    simpa only [heq] using step2075 ⟨d - 264, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233.fields2074,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233.step2074,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233.fields2075,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233.step2075,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow233
