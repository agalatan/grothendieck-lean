import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow216
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217
import Grothe.UpperChaos.OriginalRow227TriangleForward2039
import Grothe.UpperChaos.OriginalRow227TriangleForward2040
import Grothe.UpperChaos.OriginalRow227TriangleForward2041

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2039 : OriginalRow227TriangleForward2039.entries.size = 32 := rfl

def entry2039 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2039.entries[i.val]'(by rw [size2039]; exact i.isLt)

theorem fields2039 (i : Fin 32) :
    (entry2039 i).IA = shift ∧ (entry2039 i).ID = S (216 + i.val + 1) ∧
      (entry2039 i).IC = S 217 ∧ (entry2039 i).Inext = T 216 (216 + i.val + 1) ∧
      (entry2039 i).Icur = T 216 (216 + i.val) ∧
      (entry2039 i).output = T 217 (216 + i.val) ∧
      (entry2039 i).charge = charge 216 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2052_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2039 (i : Fin 32) :
    forwardStepOK (-768) (charge 216 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 217) (T 216 (216 + i.val + 1))
      (T 216 (216 + i.val)) (T 217 (216 + i.val))
      (OriginalRow227Roots.root_pos 217 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 216 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2039.entries OriginalRow227TriangleForward2039.checked
    ⟨i.val, by rw [size2039]; exact i.isLt⟩
  change (entry2039 i).check = true at h
  rcases fields2039 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2040 : OriginalRow227TriangleForward2040.entries.size = 32 := rfl

def entry2040 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2040.entries[i.val]'(by rw [size2040]; exact i.isLt)

theorem fields2040 (i : Fin 32) :
    (entry2040 i).IA = shift ∧ (entry2040 i).ID = S (248 + i.val + 1) ∧
      (entry2040 i).IC = S 217 ∧ (entry2040 i).Inext = T 216 (248 + i.val + 1) ∧
      (entry2040 i).Icur = T 216 (248 + i.val) ∧
      (entry2040 i).output = T 217 (248 + i.val) ∧
      (entry2040 i).charge = charge 216 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2053_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2040 (i : Fin 32) :
    forwardStepOK (-768) (charge 216 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 217) (T 216 (248 + i.val + 1))
      (T 216 (248 + i.val)) (T 217 (248 + i.val))
      (OriginalRow227Roots.root_pos 217 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 216 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2040.entries OriginalRow227TriangleForward2040.checked
    ⟨i.val, by rw [size2040]; exact i.isLt⟩
  change (entry2040 i).check = true at h
  rcases fields2040 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2041 : OriginalRow227TriangleForward2041.entries.size = 5 := rfl

def entry2041 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2041.entries[i.val]'(by rw [size2041]; exact i.isLt)

theorem fields2041 (i : Fin 5) :
    (entry2041 i).IA = shift ∧ (entry2041 i).ID = S (280 + i.val + 1) ∧
      (entry2041 i).IC = S 217 ∧ (entry2041 i).Inext = T 216 (280 + i.val + 1) ∧
      (entry2041 i).Icur = T 216 (280 + i.val) ∧
      (entry2041 i).output = T 217 (280 + i.val) ∧
      (entry2041 i).charge = charge 216 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root217).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow216.block2054_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨4, by decide⟩).symm, rfl⟩

theorem step2041 (i : Fin 5) :
    forwardStepOK (-768) (charge 216 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 217) (T 216 (280 + i.val + 1))
      (T 216 (280 + i.val)) (T 217 (280 + i.val))
      (OriginalRow227Roots.root_pos 217 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 216 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2041.entries OriginalRow227TriangleForward2041.checked
    ⟨i.val, by rw [size2041]; exact i.isLt⟩
  change (entry2041 i).check = true at h
  rcases fields2041 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 216 ≤ d) (hhi : d < 285) :
    forwardStepOK (-768) (charge 216 d) shift (S (d + 1)) (S 217)
      (T 216 (d + 1)) (T 216 d) (T 217 d)
      (OriginalRow227Roots.root_pos 217 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 216 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    have hi : d - 216 < 32 := by omega
    have heq : 216 + (d - 216) = d := by omega
    simpa only [heq] using step2039 ⟨d - 216, hi⟩
  ·
    by_cases h280 : d < 280
    ·
      have hi : d - 248 < 32 := by omega
      have heq : 248 + (d - 248) = d := by omega
      simpa only [heq] using step2040 ⟨d - 248, hi⟩
    ·
      have hi : d - 280 < 5 := by omega
      have heq : 280 + (d - 280) = d := by omega
      simpa only [heq] using step2041 ⟨d - 280, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.fields2039,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.step2039,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.fields2040,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.step2040,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.fields2041,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.step2041,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow217
