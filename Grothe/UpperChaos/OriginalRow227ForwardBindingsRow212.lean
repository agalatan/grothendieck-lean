import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow212
import Grothe.UpperChaos.OriginalRow227TriangleForward2024
import Grothe.UpperChaos.OriginalRow227TriangleForward2025
import Grothe.UpperChaos.OriginalRow227TriangleForward2026

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2024 : OriginalRow227TriangleForward2024.entries.size = 32 := rfl

def entry2024 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2024.entries[i.val]'(by rw [size2024]; exact i.isLt)

theorem fields2024 (i : Fin 32) :
    (entry2024 i).IA = shift ∧ (entry2024 i).ID = S (211 + i.val + 1) ∧
      (entry2024 i).IC = S 212 ∧ (entry2024 i).Inext = T 211 (211 + i.val + 1) ∧
      (entry2024 i).Icur = T 211 (211 + i.val) ∧
      (entry2024 i).output = T 212 (211 + i.val) ∧
      (entry2024 i).charge = charge 211 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2040_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2024 (i : Fin 32) :
    forwardStepOK (-768) (charge 211 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 212) (T 211 (211 + i.val + 1))
      (T 211 (211 + i.val)) (T 212 (211 + i.val))
      (OriginalRow227Roots.root_pos 212 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 211 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2024.entries OriginalRow227TriangleForward2024.checked
    ⟨i.val, by rw [size2024]; exact i.isLt⟩
  change (entry2024 i).check = true at h
  rcases fields2024 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2025 : OriginalRow227TriangleForward2025.entries.size = 32 := rfl

def entry2025 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2025.entries[i.val]'(by rw [size2025]; exact i.isLt)

theorem fields2025 (i : Fin 32) :
    (entry2025 i).IA = shift ∧ (entry2025 i).ID = S (243 + i.val + 1) ∧
      (entry2025 i).IC = S 212 ∧ (entry2025 i).Inext = T 211 (243 + i.val + 1) ∧
      (entry2025 i).Icur = T 211 (243 + i.val) ∧
      (entry2025 i).output = T 212 (243 + i.val) ∧
      (entry2025 i).charge = charge 211 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2041_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2025 (i : Fin 32) :
    forwardStepOK (-768) (charge 211 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 212) (T 211 (243 + i.val + 1))
      (T 211 (243 + i.val)) (T 212 (243 + i.val))
      (OriginalRow227Roots.root_pos 212 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 211 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2025.entries OriginalRow227TriangleForward2025.checked
    ⟨i.val, by rw [size2025]; exact i.isLt⟩
  change (entry2025 i).check = true at h
  rcases fields2025 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2026 : OriginalRow227TriangleForward2026.entries.size = 15 := rfl

def entry2026 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2026.entries[i.val]'(by rw [size2026]; exact i.isLt)

theorem fields2026 (i : Fin 15) :
    (entry2026 i).IA = shift ∧ (entry2026 i).ID = S (275 + i.val + 1) ∧
      (entry2026 i).IC = S 212 ∧ (entry2026 i).Inext = T 211 (275 + i.val + 1) ∧
      (entry2026 i).Icur = T 211 (275 + i.val) ∧
      (entry2026 i).output = T 212 (275 + i.val) ∧
      (entry2026 i).charge = charge 211 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root212).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow212.block2042_value ⟨14, by decide⟩).symm, rfl⟩

theorem step2026 (i : Fin 15) :
    forwardStepOK (-768) (charge 211 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 212) (T 211 (275 + i.val + 1))
      (T 211 (275 + i.val)) (T 212 (275 + i.val))
      (OriginalRow227Roots.root_pos 212 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 211 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2026.entries OriginalRow227TriangleForward2026.checked
    ⟨i.val, by rw [size2026]; exact i.isLt⟩
  change (entry2026 i).check = true at h
  rcases fields2026 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 211 ≤ d) (hhi : d < 290) :
    forwardStepOK (-768) (charge 211 d) shift (S (d + 1)) (S 212)
      (T 211 (d + 1)) (T 211 d) (T 212 d)
      (OriginalRow227Roots.root_pos 212 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 211 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    have hi : d - 211 < 32 := by omega
    have heq : 211 + (d - 211) = d := by omega
    simpa only [heq] using step2024 ⟨d - 211, hi⟩
  ·
    by_cases h275 : d < 275
    ·
      have hi : d - 243 < 32 := by omega
      have heq : 243 + (d - 243) = d := by omega
      simpa only [heq] using step2025 ⟨d - 243, hi⟩
    ·
      have hi : d - 275 < 15 := by omega
      have heq : 275 + (d - 275) = d := by omega
      simpa only [heq] using step2026 ⟨d - 275, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.fields2024,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.step2024,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.fields2025,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.step2025,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.fields2026,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.step2026,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow212
