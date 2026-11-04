import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219
import Grothe.UpperChaos.OriginalRow227TriangleForward2045
import Grothe.UpperChaos.OriginalRow227TriangleForward2046
import Grothe.UpperChaos.OriginalRow227TriangleForward2047

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2045 : OriginalRow227TriangleForward2045.entries.size = 32 := rfl

def entry2045 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2045.entries[i.val]'(by rw [size2045]; exact i.isLt)

theorem fields2045 (i : Fin 32) :
    (entry2045 i).IA = shift ∧ (entry2045 i).ID = S (218 + i.val + 1) ∧
      (entry2045 i).IC = S 219 ∧ (entry2045 i).Inext = T 218 (218 + i.val + 1) ∧
      (entry2045 i).Icur = T 218 (218 + i.val) ∧
      (entry2045 i).output = T 219 (218 + i.val) ∧
      (entry2045 i).charge = charge 218 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2045 (i : Fin 32) :
    forwardStepOK (-768) (charge 218 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 219) (T 218 (218 + i.val + 1))
      (T 218 (218 + i.val)) (T 219 (218 + i.val))
      (OriginalRow227Roots.root_pos 219 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 218 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2045.entries OriginalRow227TriangleForward2045.checked
    ⟨i.val, by rw [size2045]; exact i.isLt⟩
  change (entry2045 i).check = true at h
  rcases fields2045 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2046 : OriginalRow227TriangleForward2046.entries.size = 32 := rfl

def entry2046 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2046.entries[i.val]'(by rw [size2046]; exact i.isLt)

theorem fields2046 (i : Fin 32) :
    (entry2046 i).IA = shift ∧ (entry2046 i).ID = S (250 + i.val + 1) ∧
      (entry2046 i).IC = S 219 ∧ (entry2046 i).Inext = T 218 (250 + i.val + 1) ∧
      (entry2046 i).Icur = T 218 (250 + i.val) ∧
      (entry2046 i).output = T 219 (250 + i.val) ∧
      (entry2046 i).charge = charge 218 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2046 (i : Fin 32) :
    forwardStepOK (-768) (charge 218 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 219) (T 218 (250 + i.val + 1))
      (T 218 (250 + i.val)) (T 219 (250 + i.val))
      (OriginalRow227Roots.root_pos 219 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 218 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2046.entries OriginalRow227TriangleForward2046.checked
    ⟨i.val, by rw [size2046]; exact i.isLt⟩
  change (entry2046 i).check = true at h
  rcases fields2046 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2047 : OriginalRow227TriangleForward2047.entries.size = 1 := rfl

def entry2047 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2047.entries[i.val]'(by rw [size2047]; exact i.isLt)

theorem fields2047 (i : Fin 1) :
    (entry2047 i).IA = shift ∧ (entry2047 i).ID = S (282 + i.val + 1) ∧
      (entry2047 i).IC = S 219 ∧ (entry2047 i).Inext = T 218 (282 + i.val + 1) ∧
      (entry2047 i).Icur = T 218 (282 + i.val) ∧
      (entry2047 i).output = T 219 (282 + i.val) ∧
      (entry2047 i).charge = charge 218 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root219).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2063_value ⟨0, by decide⟩).symm, rfl⟩

theorem step2047 (i : Fin 1) :
    forwardStepOK (-768) (charge 218 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 219) (T 218 (282 + i.val + 1))
      (T 218 (282 + i.val)) (T 219 (282 + i.val))
      (OriginalRow227Roots.root_pos 219 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 218 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2047.entries OriginalRow227TriangleForward2047.checked
    ⟨i.val, by rw [size2047]; exact i.isLt⟩
  change (entry2047 i).check = true at h
  rcases fields2047 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 218 ≤ d) (hhi : d < 283) :
    forwardStepOK (-768) (charge 218 d) shift (S (d + 1)) (S 219)
      (T 218 (d + 1)) (T 218 d) (T 219 d)
      (OriginalRow227Roots.root_pos 219 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 218 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    have hi : d - 218 < 32 := by omega
    have heq : 218 + (d - 218) = d := by omega
    simpa only [heq] using step2045 ⟨d - 218, hi⟩
  ·
    by_cases h282 : d < 282
    ·
      have hi : d - 250 < 32 := by omega
      have heq : 250 + (d - 250) = d := by omega
      simpa only [heq] using step2046 ⟨d - 250, hi⟩
    ·
      have hi : d - 282 < 1 := by omega
      have heq : 282 + (d - 282) = d := by omega
      simpa only [heq] using step2047 ⟨d - 282, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.fields2045,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.step2045,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.fields2046,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.step2046,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.fields2047,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.step2047,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow219
