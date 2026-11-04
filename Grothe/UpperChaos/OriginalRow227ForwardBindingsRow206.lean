import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206
import Grothe.UpperChaos.OriginalRow227TriangleForward2006
import Grothe.UpperChaos.OriginalRow227TriangleForward2007
import Grothe.UpperChaos.OriginalRow227TriangleForward2008

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2006 : OriginalRow227TriangleForward2006.entries.size = 32 := rfl

def entry2006 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2006.entries[i.val]'(by rw [size2006]; exact i.isLt)

theorem fields2006 (i : Fin 32) :
    (entry2006 i).IA = shift ∧ (entry2006 i).ID = S (205 + i.val + 1) ∧
      (entry2006 i).IC = S 206 ∧ (entry2006 i).Inext = T 205 (205 + i.val + 1) ∧
      (entry2006 i).Icur = T 205 (205 + i.val) ∧
      (entry2006 i).output = T 206 (205 + i.val) ∧
      (entry2006 i).charge = charge 205 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2006 (i : Fin 32) :
    forwardStepOK (-768) (charge 205 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 206) (T 205 (205 + i.val + 1))
      (T 205 (205 + i.val)) (T 206 (205 + i.val))
      (OriginalRow227Roots.root_pos 206 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 205 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2006.entries OriginalRow227TriangleForward2006.checked
    ⟨i.val, by rw [size2006]; exact i.isLt⟩
  change (entry2006 i).check = true at h
  rcases fields2006 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2007 : OriginalRow227TriangleForward2007.entries.size = 32 := rfl

def entry2007 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2007.entries[i.val]'(by rw [size2007]; exact i.isLt)

theorem fields2007 (i : Fin 32) :
    (entry2007 i).IA = shift ∧ (entry2007 i).ID = S (237 + i.val + 1) ∧
      (entry2007 i).IC = S 206 ∧ (entry2007 i).Inext = T 205 (237 + i.val + 1) ∧
      (entry2007 i).Icur = T 205 (237 + i.val) ∧
      (entry2007 i).output = T 206 (237 + i.val) ∧
      (entry2007 i).charge = charge 205 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2007 (i : Fin 32) :
    forwardStepOK (-768) (charge 205 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 206) (T 205 (237 + i.val + 1))
      (T 205 (237 + i.val)) (T 206 (237 + i.val))
      (OriginalRow227Roots.root_pos 206 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 205 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2007.entries OriginalRow227TriangleForward2007.checked
    ⟨i.val, by rw [size2007]; exact i.isLt⟩
  change (entry2007 i).check = true at h
  rcases fields2007 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2008 : OriginalRow227TriangleForward2008.entries.size = 27 := rfl

def entry2008 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2008.entries[i.val]'(by rw [size2008]; exact i.isLt)

theorem fields2008 (i : Fin 27) :
    (entry2008 i).IA = shift ∧ (entry2008 i).ID = S (269 + i.val + 1) ∧
      (entry2008 i).IC = S 206 ∧ (entry2008 i).Inext = T 205 (269 + i.val + 1) ∧
      (entry2008 i).Icur = T 205 (269 + i.val) ∧
      (entry2008 i).output = T 206 (269 + i.val) ∧
      (entry2008 i).charge = charge 205 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root206).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨26, by decide⟩).symm, rfl⟩

theorem step2008 (i : Fin 27) :
    forwardStepOK (-768) (charge 205 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 206) (T 205 (269 + i.val + 1))
      (T 205 (269 + i.val)) (T 206 (269 + i.val))
      (OriginalRow227Roots.root_pos 206 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 205 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2008.entries OriginalRow227TriangleForward2008.checked
    ⟨i.val, by rw [size2008]; exact i.isLt⟩
  change (entry2008 i).check = true at h
  rcases fields2008 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 205 ≤ d) (hhi : d < 296) :
    forwardStepOK (-768) (charge 205 d) shift (S (d + 1)) (S 206)
      (T 205 (d + 1)) (T 205 d) (T 206 d)
      (OriginalRow227Roots.root_pos 206 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 205 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    have hi : d - 205 < 32 := by omega
    have heq : 205 + (d - 205) = d := by omega
    simpa only [heq] using step2006 ⟨d - 205, hi⟩
  ·
    by_cases h269 : d < 269
    ·
      have hi : d - 237 < 32 := by omega
      have heq : 237 + (d - 237) = d := by omega
      simpa only [heq] using step2007 ⟨d - 237, hi⟩
    ·
      have hi : d - 269 < 27 := by omega
      have heq : 269 + (d - 269) = d := by omega
      simpa only [heq] using step2008 ⟨d - 269, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.fields2006,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.step2006,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.fields2007,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.step2007,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.fields2008,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.step2008,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow206
