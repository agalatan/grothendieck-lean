import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow231
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow232
import Grothe.UpperChaos.OriginalRow227TriangleForward2072
import Grothe.UpperChaos.OriginalRow227TriangleForward2073

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2072 : OriginalRow227TriangleForward2072.entries.size = 32 := rfl

def entry2072 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2072.entries[i.val]'(by rw [size2072]; exact i.isLt)

theorem fields2072 (i : Fin 32) :
    (entry2072 i).IA = shift ∧ (entry2072 i).ID = S (231 + i.val + 1) ∧
      (entry2072 i).IC = S 232 ∧ (entry2072 i).Inext = T 231 (231 + i.val + 1) ∧
      (entry2072 i).Icur = T 231 (231 + i.val) ∧
      (entry2072 i).output = T 232 (231 + i.val) ∧
      (entry2072 i).charge = charge 231 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2086_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2088_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2072 (i : Fin 32) :
    forwardStepOK (-768) (charge 231 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 232) (T 231 (231 + i.val + 1))
      (T 231 (231 + i.val)) (T 232 (231 + i.val))
      (OriginalRow227Roots.root_pos 232 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 231 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2072.entries OriginalRow227TriangleForward2072.checked
    ⟨i.val, by rw [size2072]; exact i.isLt⟩
  change (entry2072 i).check = true at h
  rcases fields2072 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2073 : OriginalRow227TriangleForward2073.entries.size = 7 := rfl

def entry2073 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2073.entries[i.val]'(by rw [size2073]; exact i.isLt)

theorem fields2073 (i : Fin 7) :
    (entry2073 i).IA = shift ∧ (entry2073 i).ID = S (263 + i.val + 1) ∧
      (entry2073 i).IC = S 232 ∧ (entry2073 i).Inext = T 231 (263 + i.val + 1) ∧
      (entry2073 i).Icur = T 231 (263 + i.val) ∧
      (entry2073 i).output = T 232 (263 + i.val) ∧
      (entry2073 i).charge = charge 231 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root232).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow231.block2087_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow232.block2089_value ⟨6, by decide⟩).symm, rfl⟩

theorem step2073 (i : Fin 7) :
    forwardStepOK (-768) (charge 231 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 232) (T 231 (263 + i.val + 1))
      (T 231 (263 + i.val)) (T 232 (263 + i.val))
      (OriginalRow227Roots.root_pos 232 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 231 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2073.entries OriginalRow227TriangleForward2073.checked
    ⟨i.val, by rw [size2073]; exact i.isLt⟩
  change (entry2073 i).check = true at h
  rcases fields2073 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 231 ≤ d) (hhi : d < 270) :
    forwardStepOK (-768) (charge 231 d) shift (S (d + 1)) (S 232)
      (T 231 (d + 1)) (T 231 d) (T 232 d)
      (OriginalRow227Roots.root_pos 232 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 231 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    have hi : d - 231 < 32 := by omega
    have heq : 231 + (d - 231) = d := by omega
    simpa only [heq] using step2072 ⟨d - 231, hi⟩
  ·
    have hi : d - 263 < 7 := by omega
    have heq : 263 + (d - 263) = d := by omega
    simpa only [heq] using step2073 ⟨d - 263, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232.fields2072,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232.step2072,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232.fields2073,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232.step2073,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow232
