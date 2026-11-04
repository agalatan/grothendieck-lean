import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow210
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow211
import Grothe.UpperChaos.OriginalRow227TriangleForward2021
import Grothe.UpperChaos.OriginalRow227TriangleForward2022
import Grothe.UpperChaos.OriginalRow227TriangleForward2023

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2021 : OriginalRow227TriangleForward2021.entries.size = 32 := rfl

def entry2021 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2021.entries[i.val]'(by rw [size2021]; exact i.isLt)

theorem fields2021 (i : Fin 32) :
    (entry2021 i).IA = shift ∧ (entry2021 i).ID = S (210 + i.val + 1) ∧
      (entry2021 i).IC = S 211 ∧ (entry2021 i).Inext = T 210 (210 + i.val + 1) ∧
      (entry2021 i).Icur = T 210 (210 + i.val) ∧
      (entry2021 i).output = T 211 (210 + i.val) ∧
      (entry2021 i).charge = charge 210 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2034_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2037_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2021 (i : Fin 32) :
    forwardStepOK (-768) (charge 210 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 211) (T 210 (210 + i.val + 1))
      (T 210 (210 + i.val)) (T 211 (210 + i.val))
      (OriginalRow227Roots.root_pos 211 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 210 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2021.entries OriginalRow227TriangleForward2021.checked
    ⟨i.val, by rw [size2021]; exact i.isLt⟩
  change (entry2021 i).check = true at h
  rcases fields2021 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2022 : OriginalRow227TriangleForward2022.entries.size = 32 := rfl

def entry2022 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2022.entries[i.val]'(by rw [size2022]; exact i.isLt)

theorem fields2022 (i : Fin 32) :
    (entry2022 i).IA = shift ∧ (entry2022 i).ID = S (242 + i.val + 1) ∧
      (entry2022 i).IC = S 211 ∧ (entry2022 i).Inext = T 210 (242 + i.val + 1) ∧
      (entry2022 i).Icur = T 210 (242 + i.val) ∧
      (entry2022 i).output = T 211 (242 + i.val) ∧
      (entry2022 i).charge = charge 210 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2035_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2038_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2022 (i : Fin 32) :
    forwardStepOK (-768) (charge 210 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 211) (T 210 (242 + i.val + 1))
      (T 210 (242 + i.val)) (T 211 (242 + i.val))
      (OriginalRow227Roots.root_pos 211 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 210 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2022.entries OriginalRow227TriangleForward2022.checked
    ⟨i.val, by rw [size2022]; exact i.isLt⟩
  change (entry2022 i).check = true at h
  rcases fields2022 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2023 : OriginalRow227TriangleForward2023.entries.size = 17 := rfl

def entry2023 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2023.entries[i.val]'(by rw [size2023]; exact i.isLt)

theorem fields2023 (i : Fin 17) :
    (entry2023 i).IA = shift ∧ (entry2023 i).ID = S (274 + i.val + 1) ∧
      (entry2023 i).IC = S 211 ∧ (entry2023 i).Inext = T 210 (274 + i.val + 1) ∧
      (entry2023 i).Icur = T 210 (274 + i.val) ∧
      (entry2023 i).output = T 211 (274 + i.val) ∧
      (entry2023 i).charge = charge 210 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root211).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow210.block2036_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow211.block2039_value ⟨16, by decide⟩).symm, rfl⟩

theorem step2023 (i : Fin 17) :
    forwardStepOK (-768) (charge 210 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 211) (T 210 (274 + i.val + 1))
      (T 210 (274 + i.val)) (T 211 (274 + i.val))
      (OriginalRow227Roots.root_pos 211 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 210 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2023.entries OriginalRow227TriangleForward2023.checked
    ⟨i.val, by rw [size2023]; exact i.isLt⟩
  change (entry2023 i).check = true at h
  rcases fields2023 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 210 ≤ d) (hhi : d < 291) :
    forwardStepOK (-768) (charge 210 d) shift (S (d + 1)) (S 211)
      (T 210 (d + 1)) (T 210 d) (T 211 d)
      (OriginalRow227Roots.root_pos 211 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 210 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    have hi : d - 210 < 32 := by omega
    have heq : 210 + (d - 210) = d := by omega
    simpa only [heq] using step2021 ⟨d - 210, hi⟩
  ·
    by_cases h274 : d < 274
    ·
      have hi : d - 242 < 32 := by omega
      have heq : 242 + (d - 242) = d := by omega
      simpa only [heq] using step2022 ⟨d - 242, hi⟩
    ·
      have hi : d - 274 < 17 := by omega
      have heq : 274 + (d - 274) = d := by omega
      simpa only [heq] using step2023 ⟨d - 274, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.fields2021,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.step2021,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.fields2022,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.step2022,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.fields2023,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.step2023,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow211
