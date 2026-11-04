import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow229
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow230
import Grothe.UpperChaos.OriginalRow227TriangleForward2068
import Grothe.UpperChaos.OriginalRow227TriangleForward2069

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2068 : OriginalRow227TriangleForward2068.entries.size = 32 := rfl

def entry2068 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2068.entries[i.val]'(by rw [size2068]; exact i.isLt)

theorem fields2068 (i : Fin 32) :
    (entry2068 i).IA = shift ∧ (entry2068 i).ID = S (229 + i.val + 1) ∧
      (entry2068 i).IC = S 230 ∧ (entry2068 i).Inext = T 229 (229 + i.val + 1) ∧
      (entry2068 i).Icur = T 229 (229 + i.val) ∧
      (entry2068 i).output = T 230 (229 + i.val) ∧
      (entry2068 i).charge = charge 229 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2082_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2084_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2068 (i : Fin 32) :
    forwardStepOK (-768) (charge 229 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 230) (T 229 (229 + i.val + 1))
      (T 229 (229 + i.val)) (T 230 (229 + i.val))
      (OriginalRow227Roots.root_pos 230 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 229 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2068.entries OriginalRow227TriangleForward2068.checked
    ⟨i.val, by rw [size2068]; exact i.isLt⟩
  change (entry2068 i).check = true at h
  rcases fields2068 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2069 : OriginalRow227TriangleForward2069.entries.size = 11 := rfl

def entry2069 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2069.entries[i.val]'(by rw [size2069]; exact i.isLt)

theorem fields2069 (i : Fin 11) :
    (entry2069 i).IA = shift ∧ (entry2069 i).ID = S (261 + i.val + 1) ∧
      (entry2069 i).IC = S 230 ∧ (entry2069 i).Inext = T 229 (261 + i.val + 1) ∧
      (entry2069 i).Icur = T 229 (261 + i.val) ∧
      (entry2069 i).output = T 230 (261 + i.val) ∧
      (entry2069 i).charge = charge 229 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings07.S_eq_root230).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow229.block2083_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow230.block2085_value ⟨10, by decide⟩).symm, rfl⟩

theorem step2069 (i : Fin 11) :
    forwardStepOK (-768) (charge 229 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 230) (T 229 (261 + i.val + 1))
      (T 229 (261 + i.val)) (T 230 (261 + i.val))
      (OriginalRow227Roots.root_pos 230 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 229 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2069.entries OriginalRow227TriangleForward2069.checked
    ⟨i.val, by rw [size2069]; exact i.isLt⟩
  change (entry2069 i).check = true at h
  rcases fields2069 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 229 ≤ d) (hhi : d < 272) :
    forwardStepOK (-768) (charge 229 d) shift (S (d + 1)) (S 230)
      (T 229 (d + 1)) (T 229 d) (T 230 d)
      (OriginalRow227Roots.root_pos 230 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 229 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    have hi : d - 229 < 32 := by omega
    have heq : 229 + (d - 229) = d := by omega
    simpa only [heq] using step2068 ⟨d - 229, hi⟩
  ·
    have hi : d - 261 < 11 := by omega
    have heq : 261 + (d - 261) = d := by omega
    simpa only [heq] using step2069 ⟨d - 261, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230.fields2068,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230.step2068,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230.fields2069,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230.step2069,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow230
