import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow228
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229
import Grothe.UpperChaos.OriginalRow227TriangleForward2066
import Grothe.UpperChaos.OriginalRow227TriangleForward2067

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2066 : OriginalRow227TriangleForward2066.entries.size = 32 := rfl

def entry2066 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2066.entries[i.val]'(by rw [size2066]; exact i.isLt)

theorem fields2066 (i : Fin 32) :
    (entry2066 i).IA = shift ∧ (entry2066 i).ID = S (228 + i.val + 1) ∧
      (entry2066 i).IC = S 229 ∧ (entry2066 i).Inext = T 228 (228 + i.val + 1) ∧
      (entry2066 i).Icur = T 228 (228 + i.val) ∧
      (entry2066 i).output = T 229 (228 + i.val) ∧
      (entry2066 i).charge = charge 228 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2080_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2066 (i : Fin 32) :
    forwardStepOK (-768) (charge 228 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 229) (T 228 (228 + i.val + 1))
      (T 228 (228 + i.val)) (T 229 (228 + i.val))
      (OriginalRow227Roots.root_pos 229 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 228 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2066.entries OriginalRow227TriangleForward2066.checked
    ⟨i.val, by rw [size2066]; exact i.isLt⟩
  change (entry2066 i).check = true at h
  rcases fields2066 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2067 : OriginalRow227TriangleForward2067.entries.size = 13 := rfl

def entry2067 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2067.entries[i.val]'(by rw [size2067]; exact i.isLt)

theorem fields2067 (i : Fin 13) :
    (entry2067 i).IA = shift ∧ (entry2067 i).ID = S (260 + i.val + 1) ∧
      (entry2067 i).IC = S 229 ∧ (entry2067 i).Inext = T 228 (260 + i.val + 1) ∧
      (entry2067 i).Icur = T 228 (260 + i.val) ∧
      (entry2067 i).output = T 229 (260 + i.val) ∧
      (entry2067 i).charge = charge 228 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings07.S_eq_root229).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow228.block2081_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨12, by decide⟩).symm, rfl⟩

theorem step2067 (i : Fin 13) :
    forwardStepOK (-768) (charge 228 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 229) (T 228 (260 + i.val + 1))
      (T 228 (260 + i.val)) (T 229 (260 + i.val))
      (OriginalRow227Roots.root_pos 229 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 228 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2067.entries OriginalRow227TriangleForward2067.checked
    ⟨i.val, by rw [size2067]; exact i.isLt⟩
  change (entry2067 i).check = true at h
  rcases fields2067 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 228 ≤ d) (hhi : d < 273) :
    forwardStepOK (-768) (charge 228 d) shift (S (d + 1)) (S 229)
      (T 228 (d + 1)) (T 228 d) (T 229 d)
      (OriginalRow227Roots.root_pos 229 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 228 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    have hi : d - 228 < 32 := by omega
    have heq : 228 + (d - 228) = d := by omega
    simpa only [heq] using step2066 ⟨d - 228, hi⟩
  ·
    have hi : d - 260 < 13 := by omega
    have heq : 260 + (d - 260) = d := by omega
    simpa only [heq] using step2067 ⟨d - 260, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229.fields2066,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229.step2066,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229.fields2067,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229.step2067,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow229
