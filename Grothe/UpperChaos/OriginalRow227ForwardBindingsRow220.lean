import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow219
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow220
import Grothe.UpperChaos.OriginalRow227TriangleForward2048
import Grothe.UpperChaos.OriginalRow227TriangleForward2049

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2048 : OriginalRow227TriangleForward2048.entries.size = 32 := rfl

def entry2048 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2048.entries[i.val]'(by rw [size2048]; exact i.isLt)

theorem fields2048 (i : Fin 32) :
    (entry2048 i).IA = shift ∧ (entry2048 i).ID = S (219 + i.val + 1) ∧
      (entry2048 i).IC = S 220 ∧ (entry2048 i).Inext = T 219 (219 + i.val + 1) ∧
      (entry2048 i).Icur = T 219 (219 + i.val) ∧
      (entry2048 i).output = T 220 (219 + i.val) ∧
      (entry2048 i).charge = charge 219 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2061_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2064_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2048 (i : Fin 32) :
    forwardStepOK (-768) (charge 219 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 220) (T 219 (219 + i.val + 1))
      (T 219 (219 + i.val)) (T 220 (219 + i.val))
      (OriginalRow227Roots.root_pos 220 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 219 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2048.entries OriginalRow227TriangleForward2048.checked
    ⟨i.val, by rw [size2048]; exact i.isLt⟩
  change (entry2048 i).check = true at h
  rcases fields2048 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2049 : OriginalRow227TriangleForward2049.entries.size = 31 := rfl

def entry2049 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2049.entries[i.val]'(by rw [size2049]; exact i.isLt)

theorem fields2049 (i : Fin 31) :
    (entry2049 i).IA = shift ∧ (entry2049 i).ID = S (251 + i.val + 1) ∧
      (entry2049 i).IC = S 220 ∧ (entry2049 i).Inext = T 219 (251 + i.val + 1) ∧
      (entry2049 i).Icur = T 219 (251 + i.val) ∧
      (entry2049 i).output = T 220 (251 + i.val) ∧
      (entry2049 i).charge = charge 219 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root220).symm,
      (OriginalRow227TriangleBindingsRow219.block2063_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow219.block2062_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow220.block2065_value ⟨30, by decide⟩).symm, rfl⟩

theorem step2049 (i : Fin 31) :
    forwardStepOK (-768) (charge 219 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 220) (T 219 (251 + i.val + 1))
      (T 219 (251 + i.val)) (T 220 (251 + i.val))
      (OriginalRow227Roots.root_pos 220 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 219 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2049.entries OriginalRow227TriangleForward2049.checked
    ⟨i.val, by rw [size2049]; exact i.isLt⟩
  change (entry2049 i).check = true at h
  rcases fields2049 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 219 ≤ d) (hhi : d < 282) :
    forwardStepOK (-768) (charge 219 d) shift (S (d + 1)) (S 220)
      (T 219 (d + 1)) (T 219 d) (T 220 d)
      (OriginalRow227Roots.root_pos 220 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 219 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    have hi : d - 219 < 32 := by omega
    have heq : 219 + (d - 219) = d := by omega
    simpa only [heq] using step2048 ⟨d - 219, hi⟩
  ·
    have hi : d - 251 < 31 := by omega
    have heq : 251 + (d - 251) = d := by omega
    simpa only [heq] using step2049 ⟨d - 251, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220.fields2048,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220.step2048,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220.fields2049,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220.step2049,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow220
