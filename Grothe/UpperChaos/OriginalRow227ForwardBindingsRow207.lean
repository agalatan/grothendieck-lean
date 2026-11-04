import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow206
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow207
import Grothe.UpperChaos.OriginalRow227TriangleForward2009
import Grothe.UpperChaos.OriginalRow227TriangleForward2010
import Grothe.UpperChaos.OriginalRow227TriangleForward2011

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2009 : OriginalRow227TriangleForward2009.entries.size = 32 := rfl

def entry2009 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2009.entries[i.val]'(by rw [size2009]; exact i.isLt)

theorem fields2009 (i : Fin 32) :
    (entry2009 i).IA = shift ∧ (entry2009 i).ID = S (206 + i.val + 1) ∧
      (entry2009 i).IC = S 207 ∧ (entry2009 i).Inext = T 206 (206 + i.val + 1) ∧
      (entry2009 i).Icur = T 206 (206 + i.val) ∧
      (entry2009 i).output = T 207 (206 + i.val) ∧
      (entry2009 i).charge = charge 206 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2022_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2025_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2009 (i : Fin 32) :
    forwardStepOK (-768) (charge 206 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 207) (T 206 (206 + i.val + 1))
      (T 206 (206 + i.val)) (T 207 (206 + i.val))
      (OriginalRow227Roots.root_pos 207 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 206 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2009.entries OriginalRow227TriangleForward2009.checked
    ⟨i.val, by rw [size2009]; exact i.isLt⟩
  change (entry2009 i).check = true at h
  rcases fields2009 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2010 : OriginalRow227TriangleForward2010.entries.size = 32 := rfl

def entry2010 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2010.entries[i.val]'(by rw [size2010]; exact i.isLt)

theorem fields2010 (i : Fin 32) :
    (entry2010 i).IA = shift ∧ (entry2010 i).ID = S (238 + i.val + 1) ∧
      (entry2010 i).IC = S 207 ∧ (entry2010 i).Inext = T 206 (238 + i.val + 1) ∧
      (entry2010 i).Icur = T 206 (238 + i.val) ∧
      (entry2010 i).output = T 207 (238 + i.val) ∧
      (entry2010 i).charge = charge 206 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2023_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2026_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2010 (i : Fin 32) :
    forwardStepOK (-768) (charge 206 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 207) (T 206 (238 + i.val + 1))
      (T 206 (238 + i.val)) (T 207 (238 + i.val))
      (OriginalRow227Roots.root_pos 207 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 206 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2010.entries OriginalRow227TriangleForward2010.checked
    ⟨i.val, by rw [size2010]; exact i.isLt⟩
  change (entry2010 i).check = true at h
  rcases fields2010 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2011 : OriginalRow227TriangleForward2011.entries.size = 25 := rfl

def entry2011 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2011.entries[i.val]'(by rw [size2011]; exact i.isLt)

theorem fields2011 (i : Fin 25) :
    (entry2011 i).IA = shift ∧ (entry2011 i).ID = S (270 + i.val + 1) ∧
      (entry2011 i).IC = S 207 ∧ (entry2011 i).Inext = T 206 (270 + i.val + 1) ∧
      (entry2011 i).Icur = T 206 (270 + i.val) ∧
      (entry2011 i).output = T 207 (270 + i.val) ∧
      (entry2011 i).charge = charge 206 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root207).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow206.block2024_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow207.block2027_value ⟨24, by decide⟩).symm, rfl⟩

theorem step2011 (i : Fin 25) :
    forwardStepOK (-768) (charge 206 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 207) (T 206 (270 + i.val + 1))
      (T 206 (270 + i.val)) (T 207 (270 + i.val))
      (OriginalRow227Roots.root_pos 207 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 206 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2011.entries OriginalRow227TriangleForward2011.checked
    ⟨i.val, by rw [size2011]; exact i.isLt⟩
  change (entry2011 i).check = true at h
  rcases fields2011 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 206 ≤ d) (hhi : d < 295) :
    forwardStepOK (-768) (charge 206 d) shift (S (d + 1)) (S 207)
      (T 206 (d + 1)) (T 206 d) (T 207 d)
      (OriginalRow227Roots.root_pos 207 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 206 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    have hi : d - 206 < 32 := by omega
    have heq : 206 + (d - 206) = d := by omega
    simpa only [heq] using step2009 ⟨d - 206, hi⟩
  ·
    by_cases h270 : d < 270
    ·
      have hi : d - 238 < 32 := by omega
      have heq : 238 + (d - 238) = d := by omega
      simpa only [heq] using step2010 ⟨d - 238, hi⟩
    ·
      have hi : d - 270 < 25 := by omega
      have heq : 270 + (d - 270) = d := by omega
      simpa only [heq] using step2011 ⟨d - 270, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.fields2009,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.step2009,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.fields2010,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.step2010,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.fields2011,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.step2011,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow207
