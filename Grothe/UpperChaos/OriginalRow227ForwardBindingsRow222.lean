import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow221
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow222
import Grothe.UpperChaos.OriginalRow227TriangleForward2052
import Grothe.UpperChaos.OriginalRow227TriangleForward2053

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2052 : OriginalRow227TriangleForward2052.entries.size = 32 := rfl

def entry2052 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2052.entries[i.val]'(by rw [size2052]; exact i.isLt)

theorem fields2052 (i : Fin 32) :
    (entry2052 i).IA = shift ∧ (entry2052 i).ID = S (221 + i.val + 1) ∧
      (entry2052 i).IC = S 222 ∧ (entry2052 i).Inext = T 221 (221 + i.val + 1) ∧
      (entry2052 i).Icur = T 221 (221 + i.val) ∧
      (entry2052 i).output = T 222 (221 + i.val) ∧
      (entry2052 i).charge = charge 221 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2066_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2068_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2052 (i : Fin 32) :
    forwardStepOK (-768) (charge 221 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 222) (T 221 (221 + i.val + 1))
      (T 221 (221 + i.val)) (T 222 (221 + i.val))
      (OriginalRow227Roots.root_pos 222 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 221 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2052.entries OriginalRow227TriangleForward2052.checked
    ⟨i.val, by rw [size2052]; exact i.isLt⟩
  change (entry2052 i).check = true at h
  rcases fields2052 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2053 : OriginalRow227TriangleForward2053.entries.size = 27 := rfl

def entry2053 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2053.entries[i.val]'(by rw [size2053]; exact i.isLt)

theorem fields2053 (i : Fin 27) :
    (entry2053 i).IA = shift ∧ (entry2053 i).ID = S (253 + i.val + 1) ∧
      (entry2053 i).IC = S 222 ∧ (entry2053 i).Inext = T 221 (253 + i.val + 1) ∧
      (entry2053 i).Icur = T 221 (253 + i.val) ∧
      (entry2053 i).output = T 222 (253 + i.val) ∧
      (entry2053 i).charge = charge 221 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root222).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow221.block2067_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow222.block2069_value ⟨26, by decide⟩).symm, rfl⟩

theorem step2053 (i : Fin 27) :
    forwardStepOK (-768) (charge 221 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 222) (T 221 (253 + i.val + 1))
      (T 221 (253 + i.val)) (T 222 (253 + i.val))
      (OriginalRow227Roots.root_pos 222 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 221 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2053.entries OriginalRow227TriangleForward2053.checked
    ⟨i.val, by rw [size2053]; exact i.isLt⟩
  change (entry2053 i).check = true at h
  rcases fields2053 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 221 ≤ d) (hhi : d < 280) :
    forwardStepOK (-768) (charge 221 d) shift (S (d + 1)) (S 222)
      (T 221 (d + 1)) (T 221 d) (T 222 d)
      (OriginalRow227Roots.root_pos 222 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 221 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    have hi : d - 221 < 32 := by omega
    have heq : 221 + (d - 221) = d := by omega
    simpa only [heq] using step2052 ⟨d - 221, hi⟩
  ·
    have hi : d - 253 < 27 := by omega
    have heq : 253 + (d - 253) = d := by omega
    simpa only [heq] using step2053 ⟨d - 253, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222.fields2052,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222.step2052,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222.fields2053,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222.step2053,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow222
