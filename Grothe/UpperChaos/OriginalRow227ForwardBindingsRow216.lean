import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow215
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216
import Grothe.UpperChaos.OriginalRow227TriangleForward2036
import Grothe.UpperChaos.OriginalRow227TriangleForward2037
import Grothe.UpperChaos.OriginalRow227TriangleForward2038

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2036 : OriginalRow227TriangleForward2036.entries.size = 32 := rfl

def entry2036 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2036.entries[i.val]'(by rw [size2036]; exact i.isLt)

theorem fields2036 (i : Fin 32) :
    (entry2036 i).IA = shift ∧ (entry2036 i).ID = S (215 + i.val + 1) ∧
      (entry2036 i).IC = S 216 ∧ (entry2036 i).Inext = T 215 (215 + i.val + 1) ∧
      (entry2036 i).Icur = T 215 (215 + i.val) ∧
      (entry2036 i).output = T 216 (215 + i.val) ∧
      (entry2036 i).charge = charge 215 (215 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2049_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2036 (i : Fin 32) :
    forwardStepOK (-768) (charge 215 (215 + i.val)) shift
      (S (215 + i.val + 1)) (S 216) (T 215 (215 + i.val + 1))
      (T 215 (215 + i.val)) (T 216 (215 + i.val))
      (OriginalRow227Roots.root_pos 216 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 215 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2036.entries OriginalRow227TriangleForward2036.checked
    ⟨i.val, by rw [size2036]; exact i.isLt⟩
  change (entry2036 i).check = true at h
  rcases fields2036 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2037 : OriginalRow227TriangleForward2037.entries.size = 32 := rfl

def entry2037 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2037.entries[i.val]'(by rw [size2037]; exact i.isLt)

theorem fields2037 (i : Fin 32) :
    (entry2037 i).IA = shift ∧ (entry2037 i).ID = S (247 + i.val + 1) ∧
      (entry2037 i).IC = S 216 ∧ (entry2037 i).Inext = T 215 (247 + i.val + 1) ∧
      (entry2037 i).Icur = T 215 (247 + i.val) ∧
      (entry2037 i).output = T 216 (247 + i.val) ∧
      (entry2037 i).charge = charge 215 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2050_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2037 (i : Fin 32) :
    forwardStepOK (-768) (charge 215 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 216) (T 215 (247 + i.val + 1))
      (T 215 (247 + i.val)) (T 216 (247 + i.val))
      (OriginalRow227Roots.root_pos 216 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 215 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2037.entries OriginalRow227TriangleForward2037.checked
    ⟨i.val, by rw [size2037]; exact i.isLt⟩
  change (entry2037 i).check = true at h
  rcases fields2037 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2038 : OriginalRow227TriangleForward2038.entries.size = 7 := rfl

def entry2038 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2038.entries[i.val]'(by rw [size2038]; exact i.isLt)

theorem fields2038 (i : Fin 7) :
    (entry2038 i).IA = shift ∧ (entry2038 i).ID = S (279 + i.val + 1) ∧
      (entry2038 i).IC = S 216 ∧ (entry2038 i).Inext = T 215 (279 + i.val + 1) ∧
      (entry2038 i).Icur = T 215 (279 + i.val) ∧
      (entry2038 i).output = T 216 (279 + i.val) ∧
      (entry2038 i).charge = charge 215 (279 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root216).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow215.block2051_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨6, by decide⟩).symm, rfl⟩

theorem step2038 (i : Fin 7) :
    forwardStepOK (-768) (charge 215 (279 + i.val)) shift
      (S (279 + i.val + 1)) (S 216) (T 215 (279 + i.val + 1))
      (T 215 (279 + i.val)) (T 216 (279 + i.val))
      (OriginalRow227Roots.root_pos 216 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 215 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2038.entries OriginalRow227TriangleForward2038.checked
    ⟨i.val, by rw [size2038]; exact i.isLt⟩
  change (entry2038 i).check = true at h
  rcases fields2038 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 215 ≤ d) (hhi : d < 286) :
    forwardStepOK (-768) (charge 215 d) shift (S (d + 1)) (S 216)
      (T 215 (d + 1)) (T 215 d) (T 216 d)
      (OriginalRow227Roots.root_pos 216 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 215 (by decide)) = true := by
  by_cases h247 : d < 247
  ·
    have hi : d - 215 < 32 := by omega
    have heq : 215 + (d - 215) = d := by omega
    simpa only [heq] using step2036 ⟨d - 215, hi⟩
  ·
    by_cases h279 : d < 279
    ·
      have hi : d - 247 < 32 := by omega
      have heq : 247 + (d - 247) = d := by omega
      simpa only [heq] using step2037 ⟨d - 247, hi⟩
    ·
      have hi : d - 279 < 7 := by omega
      have heq : 279 + (d - 279) = d := by omega
      simpa only [heq] using step2038 ⟨d - 279, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.fields2036,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.step2036,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.fields2037,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.step2037,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.fields2038,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.step2038,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow216
