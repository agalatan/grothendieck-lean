import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow214
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215
import Grothe.UpperChaos.OriginalRow227TriangleForward2033
import Grothe.UpperChaos.OriginalRow227TriangleForward2034
import Grothe.UpperChaos.OriginalRow227TriangleForward2035

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2033 : OriginalRow227TriangleForward2033.entries.size = 32 := rfl

def entry2033 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2033.entries[i.val]'(by rw [size2033]; exact i.isLt)

theorem fields2033 (i : Fin 32) :
    (entry2033 i).IA = shift ∧ (entry2033 i).ID = S (214 + i.val + 1) ∧
      (entry2033 i).IC = S 215 ∧ (entry2033 i).Inext = T 214 (214 + i.val + 1) ∧
      (entry2033 i).Icur = T 214 (214 + i.val) ∧
      (entry2033 i).output = T 215 (214 + i.val) ∧
      (entry2033 i).charge = charge 214 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2046_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2033 (i : Fin 32) :
    forwardStepOK (-768) (charge 214 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 215) (T 214 (214 + i.val + 1))
      (T 214 (214 + i.val)) (T 215 (214 + i.val))
      (OriginalRow227Roots.root_pos 215 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 214 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2033.entries OriginalRow227TriangleForward2033.checked
    ⟨i.val, by rw [size2033]; exact i.isLt⟩
  change (entry2033 i).check = true at h
  rcases fields2033 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2034 : OriginalRow227TriangleForward2034.entries.size = 32 := rfl

def entry2034 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2034.entries[i.val]'(by rw [size2034]; exact i.isLt)

theorem fields2034 (i : Fin 32) :
    (entry2034 i).IA = shift ∧ (entry2034 i).ID = S (246 + i.val + 1) ∧
      (entry2034 i).IC = S 215 ∧ (entry2034 i).Inext = T 214 (246 + i.val + 1) ∧
      (entry2034 i).Icur = T 214 (246 + i.val) ∧
      (entry2034 i).output = T 215 (246 + i.val) ∧
      (entry2034 i).charge = charge 214 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2047_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2034 (i : Fin 32) :
    forwardStepOK (-768) (charge 214 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 215) (T 214 (246 + i.val + 1))
      (T 214 (246 + i.val)) (T 215 (246 + i.val))
      (OriginalRow227Roots.root_pos 215 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 214 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2034.entries OriginalRow227TriangleForward2034.checked
    ⟨i.val, by rw [size2034]; exact i.isLt⟩
  change (entry2034 i).check = true at h
  rcases fields2034 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2035 : OriginalRow227TriangleForward2035.entries.size = 9 := rfl

def entry2035 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2035.entries[i.val]'(by rw [size2035]; exact i.isLt)

theorem fields2035 (i : Fin 9) :
    (entry2035 i).IA = shift ∧ (entry2035 i).ID = S (278 + i.val + 1) ∧
      (entry2035 i).IC = S 215 ∧ (entry2035 i).Inext = T 214 (278 + i.val + 1) ∧
      (entry2035 i).Icur = T 214 (278 + i.val) ∧
      (entry2035 i).output = T 215 (278 + i.val) ∧
      (entry2035 i).charge = charge 214 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root215).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow214.block2048_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨8, by decide⟩).symm, rfl⟩

theorem step2035 (i : Fin 9) :
    forwardStepOK (-768) (charge 214 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 215) (T 214 (278 + i.val + 1))
      (T 214 (278 + i.val)) (T 215 (278 + i.val))
      (OriginalRow227Roots.root_pos 215 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 214 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2035.entries OriginalRow227TriangleForward2035.checked
    ⟨i.val, by rw [size2035]; exact i.isLt⟩
  change (entry2035 i).check = true at h
  rcases fields2035 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 214 ≤ d) (hhi : d < 287) :
    forwardStepOK (-768) (charge 214 d) shift (S (d + 1)) (S 215)
      (T 214 (d + 1)) (T 214 d) (T 215 d)
      (OriginalRow227Roots.root_pos 215 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 214 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    have hi : d - 214 < 32 := by omega
    have heq : 214 + (d - 214) = d := by omega
    simpa only [heq] using step2033 ⟨d - 214, hi⟩
  ·
    by_cases h278 : d < 278
    ·
      have hi : d - 246 < 32 := by omega
      have heq : 246 + (d - 246) = d := by omega
      simpa only [heq] using step2034 ⟨d - 246, hi⟩
    ·
      have hi : d - 278 < 9 := by omega
      have heq : 278 + (d - 278) = d := by omega
      simpa only [heq] using step2035 ⟨d - 278, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.fields2033,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.step2033,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.fields2034,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.step2034,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.fields2035,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.step2035,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow215
