import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231
import Grothe.UpperChaos.OriginalRow227TriangleForward2070
import Grothe.UpperChaos.OriginalRow227TriangleForward2071

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2070 : OriginalRow227TriangleForward2070.entries.size = 32 := rfl

def entry2070 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2070.entries[i.val]'(by rw [size2070]; exact i.isLt)

theorem fields2070 (i : Fin 32) :
    (entry2070 i).IA = shift ∧ (entry2070 i).ID = S (230 + i.val + 1) ∧
      (entry2070 i).IC = S 231 ∧ (entry2070 i).Inext = T 230 (230 + i.val + 1) ∧
      (entry2070 i).Icur = T 230 (230 + i.val) ∧
      (entry2070 i).output = T 231 (230 + i.val) ∧
      (entry2070 i).charge = charge 230 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2070 (i : Fin 32) :
    forwardStepOK (-768) (charge 230 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 231) (T 230 (230 + i.val + 1))
      (T 230 (230 + i.val)) (T 231 (230 + i.val))
      (OriginalRow227Roots.root_pos 231 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 230 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2070.entries OriginalRow227TriangleForward2070.checked
    ⟨i.val, by rw [size2070]; exact i.isLt⟩
  change (entry2070 i).check = true at h
  rcases fields2070 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2071 : OriginalRow227TriangleForward2071.entries.size = 9 := rfl

def entry2071 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2071.entries[i.val]'(by rw [size2071]; exact i.isLt)

theorem fields2071 (i : Fin 9) :
    (entry2071 i).IA = shift ∧ (entry2071 i).ID = S (262 + i.val + 1) ∧
      (entry2071 i).IC = S 231 ∧ (entry2071 i).Inext = T 230 (262 + i.val + 1) ∧
      (entry2071 i).Icur = T 230 (262 + i.val) ∧
      (entry2071 i).output = T 231 (262 + i.val) ∧
      (entry2071 i).charge = charge 230 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root231).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨8, by decide⟩).symm, rfl⟩

theorem step2071 (i : Fin 9) :
    forwardStepOK (-768) (charge 230 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 231) (T 230 (262 + i.val + 1))
      (T 230 (262 + i.val)) (T 231 (262 + i.val))
      (OriginalRow227Roots.root_pos 231 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 230 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2071.entries OriginalRow227TriangleForward2071.checked
    ⟨i.val, by rw [size2071]; exact i.isLt⟩
  change (entry2071 i).check = true at h
  rcases fields2071 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 230 ≤ d) (hhi : d < 271) :
    forwardStepOK (-768) (charge 230 d) shift (S (d + 1)) (S 231)
      (T 230 (d + 1)) (T 230 d) (T 231 d)
      (OriginalRow227Roots.root_pos 231 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 230 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    have hi : d - 230 < 32 := by omega
    have heq : 230 + (d - 230) = d := by omega
    simpa only [heq] using step2070 ⟨d - 230, hi⟩
  ·
    have hi : d - 262 < 9 := by omega
    have heq : 262 + (d - 262) = d := by omega
    simpa only [heq] using step2071 ⟨d - 262, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231.fields2070,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231.step2070,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231.fields2071,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231.step2071,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow231
