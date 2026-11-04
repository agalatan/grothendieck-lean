import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow213
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214
import Grothe.UpperChaos.OriginalRow227TriangleForward2030
import Grothe.UpperChaos.OriginalRow227TriangleForward2031
import Grothe.UpperChaos.OriginalRow227TriangleForward2032

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2030 : OriginalRow227TriangleForward2030.entries.size = 32 := rfl

def entry2030 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2030.entries[i.val]'(by rw [size2030]; exact i.isLt)

theorem fields2030 (i : Fin 32) :
    (entry2030 i).IA = shift ∧ (entry2030 i).ID = S (213 + i.val + 1) ∧
      (entry2030 i).IC = S 214 ∧ (entry2030 i).Inext = T 213 (213 + i.val + 1) ∧
      (entry2030 i).Icur = T 213 (213 + i.val) ∧
      (entry2030 i).output = T 214 (213 + i.val) ∧
      (entry2030 i).charge = charge 213 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2043_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2030 (i : Fin 32) :
    forwardStepOK (-768) (charge 213 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 214) (T 213 (213 + i.val + 1))
      (T 213 (213 + i.val)) (T 214 (213 + i.val))
      (OriginalRow227Roots.root_pos 214 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 213 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2030.entries OriginalRow227TriangleForward2030.checked
    ⟨i.val, by rw [size2030]; exact i.isLt⟩
  change (entry2030 i).check = true at h
  rcases fields2030 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2031 : OriginalRow227TriangleForward2031.entries.size = 32 := rfl

def entry2031 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2031.entries[i.val]'(by rw [size2031]; exact i.isLt)

theorem fields2031 (i : Fin 32) :
    (entry2031 i).IA = shift ∧ (entry2031 i).ID = S (245 + i.val + 1) ∧
      (entry2031 i).IC = S 214 ∧ (entry2031 i).Inext = T 213 (245 + i.val + 1) ∧
      (entry2031 i).Icur = T 213 (245 + i.val) ∧
      (entry2031 i).output = T 214 (245 + i.val) ∧
      (entry2031 i).charge = charge 213 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2044_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2031 (i : Fin 32) :
    forwardStepOK (-768) (charge 213 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 214) (T 213 (245 + i.val + 1))
      (T 213 (245 + i.val)) (T 214 (245 + i.val))
      (OriginalRow227Roots.root_pos 214 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 213 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2031.entries OriginalRow227TriangleForward2031.checked
    ⟨i.val, by rw [size2031]; exact i.isLt⟩
  change (entry2031 i).check = true at h
  rcases fields2031 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2032 : OriginalRow227TriangleForward2032.entries.size = 11 := rfl

def entry2032 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2032.entries[i.val]'(by rw [size2032]; exact i.isLt)

theorem fields2032 (i : Fin 11) :
    (entry2032 i).IA = shift ∧ (entry2032 i).ID = S (277 + i.val + 1) ∧
      (entry2032 i).IC = S 214 ∧ (entry2032 i).Inext = T 213 (277 + i.val + 1) ∧
      (entry2032 i).Icur = T 213 (277 + i.val) ∧
      (entry2032 i).output = T 214 (277 + i.val) ∧
      (entry2032 i).charge = charge 213 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root214).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow213.block2045_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨10, by decide⟩).symm, rfl⟩

theorem step2032 (i : Fin 11) :
    forwardStepOK (-768) (charge 213 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 214) (T 213 (277 + i.val + 1))
      (T 213 (277 + i.val)) (T 214 (277 + i.val))
      (OriginalRow227Roots.root_pos 214 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 213 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2032.entries OriginalRow227TriangleForward2032.checked
    ⟨i.val, by rw [size2032]; exact i.isLt⟩
  change (entry2032 i).check = true at h
  rcases fields2032 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 213 ≤ d) (hhi : d < 288) :
    forwardStepOK (-768) (charge 213 d) shift (S (d + 1)) (S 214)
      (T 213 (d + 1)) (T 213 d) (T 214 d)
      (OriginalRow227Roots.root_pos 214 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 213 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    have hi : d - 213 < 32 := by omega
    have heq : 213 + (d - 213) = d := by omega
    simpa only [heq] using step2030 ⟨d - 213, hi⟩
  ·
    by_cases h277 : d < 277
    ·
      have hi : d - 245 < 32 := by omega
      have heq : 245 + (d - 245) = d := by omega
      simpa only [heq] using step2031 ⟨d - 245, hi⟩
    ·
      have hi : d - 277 < 11 := by omega
      have heq : 277 + (d - 277) = d := by omega
      simpa only [heq] using step2032 ⟨d - 277, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.fields2030,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.step2030,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.fields2031,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.step2031,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.fields2032,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.step2032,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow214
