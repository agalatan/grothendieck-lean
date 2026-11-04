import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow220
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221
import Grothe.UpperChaos.OriginalRow227TriangleForward2050
import Grothe.UpperChaos.OriginalRow227TriangleForward2051

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2050 : OriginalRow227TriangleForward2050.entries.size = 32 := rfl

def entry2050 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2050.entries[i.val]'(by rw [size2050]; exact i.isLt)

theorem fields2050 (i : Fin 32) :
    (entry2050 i).IA = shift ∧ (entry2050 i).ID = S (220 + i.val + 1) ∧
      (entry2050 i).IC = S 221 ∧ (entry2050 i).Inext = T 220 (220 + i.val + 1) ∧
      (entry2050 i).Icur = T 220 (220 + i.val) ∧
      (entry2050 i).output = T 221 (220 + i.val) ∧
      (entry2050 i).charge = charge 220 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2050 (i : Fin 32) :
    forwardStepOK (-768) (charge 220 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 221) (T 220 (220 + i.val + 1))
      (T 220 (220 + i.val)) (T 221 (220 + i.val))
      (OriginalRow227Roots.root_pos 221 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 220 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2050.entries OriginalRow227TriangleForward2050.checked
    ⟨i.val, by rw [size2050]; exact i.isLt⟩
  change (entry2050 i).check = true at h
  rcases fields2050 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2051 : OriginalRow227TriangleForward2051.entries.size = 29 := rfl

def entry2051 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2051.entries[i.val]'(by rw [size2051]; exact i.isLt)

theorem fields2051 (i : Fin 29) :
    (entry2051 i).IA = shift ∧ (entry2051 i).ID = S (252 + i.val + 1) ∧
      (entry2051 i).IC = S 221 ∧ (entry2051 i).Inext = T 220 (252 + i.val + 1) ∧
      (entry2051 i).Icur = T 220 (252 + i.val) ∧
      (entry2051 i).output = T 221 (252 + i.val) ∧
      (entry2051 i).charge = charge 220 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root221).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨28, by decide⟩).symm, rfl⟩

theorem step2051 (i : Fin 29) :
    forwardStepOK (-768) (charge 220 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 221) (T 220 (252 + i.val + 1))
      (T 220 (252 + i.val)) (T 221 (252 + i.val))
      (OriginalRow227Roots.root_pos 221 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 220 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2051.entries OriginalRow227TriangleForward2051.checked
    ⟨i.val, by rw [size2051]; exact i.isLt⟩
  change (entry2051 i).check = true at h
  rcases fields2051 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 220 ≤ d) (hhi : d < 281) :
    forwardStepOK (-768) (charge 220 d) shift (S (d + 1)) (S 221)
      (T 220 (d + 1)) (T 220 d) (T 221 d)
      (OriginalRow227Roots.root_pos 221 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 220 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    have hi : d - 220 < 32 := by omega
    have heq : 220 + (d - 220) = d := by omega
    simpa only [heq] using step2050 ⟨d - 220, hi⟩
  ·
    have hi : d - 252 < 29 := by omega
    have heq : 252 + (d - 252) = d := by omega
    simpa only [heq] using step2051 ⟨d - 252, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221.fields2050,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221.step2050,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221.fields2051,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221.step2051,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow221
