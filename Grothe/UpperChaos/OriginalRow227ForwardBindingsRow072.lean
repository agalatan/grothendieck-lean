import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072
import Grothe.UpperChaos.OriginalRow227TriangleForward0992
import Grothe.UpperChaos.OriginalRow227TriangleForward0993
import Grothe.UpperChaos.OriginalRow227TriangleForward0994
import Grothe.UpperChaos.OriginalRow227TriangleForward0995
import Grothe.UpperChaos.OriginalRow227TriangleForward0996
import Grothe.UpperChaos.OriginalRow227TriangleForward0997
import Grothe.UpperChaos.OriginalRow227TriangleForward0998
import Grothe.UpperChaos.OriginalRow227TriangleForward0999
import Grothe.UpperChaos.OriginalRow227TriangleForward1000
import Grothe.UpperChaos.OriginalRow227TriangleForward1001
import Grothe.UpperChaos.OriginalRow227TriangleForward1002
import Grothe.UpperChaos.OriginalRow227TriangleForward1003

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0992 : OriginalRow227TriangleForward0992.entries.size = 32 := rfl

def entry0992 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0992.entries[i.val]'(by rw [size0992]; exact i.isLt)

theorem fields0992 (i : Fin 32) :
    (entry0992 i).IA = shift ∧ (entry0992 i).ID = S (71 + i.val + 1) ∧
      (entry0992 i).IC = S 72 ∧ (entry0992 i).Inext = T 71 (71 + i.val + 1) ∧
      (entry0992 i).Icur = T 71 (71 + i.val) ∧
      (entry0992 i).output = T 72 (71 + i.val) ∧
      (entry0992 i).charge = charge 71 (71 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0992 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (71 + i.val)) shift
      (S (71 + i.val + 1)) (S 72) (T 71 (71 + i.val + 1))
      (T 71 (71 + i.val)) (T 72 (71 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0992.entries OriginalRow227TriangleForward0992.checked
    ⟨i.val, by rw [size0992]; exact i.isLt⟩
  change (entry0992 i).check = true at h
  rcases fields0992 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0993 : OriginalRow227TriangleForward0993.entries.size = 32 := rfl

def entry0993 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0993.entries[i.val]'(by rw [size0993]; exact i.isLt)

theorem fields0993 (i : Fin 32) :
    (entry0993 i).IA = shift ∧ (entry0993 i).ID = S (103 + i.val + 1) ∧
      (entry0993 i).IC = S 72 ∧ (entry0993 i).Inext = T 71 (103 + i.val + 1) ∧
      (entry0993 i).Icur = T 71 (103 + i.val) ∧
      (entry0993 i).output = T 72 (103 + i.val) ∧
      (entry0993 i).charge = charge 71 (103 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0993 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (103 + i.val)) shift
      (S (103 + i.val + 1)) (S 72) (T 71 (103 + i.val + 1))
      (T 71 (103 + i.val)) (T 72 (103 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0993.entries OriginalRow227TriangleForward0993.checked
    ⟨i.val, by rw [size0993]; exact i.isLt⟩
  change (entry0993 i).check = true at h
  rcases fields0993 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0994 : OriginalRow227TriangleForward0994.entries.size = 32 := rfl

def entry0994 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0994.entries[i.val]'(by rw [size0994]; exact i.isLt)

theorem fields0994 (i : Fin 32) :
    (entry0994 i).IA = shift ∧ (entry0994 i).ID = S (135 + i.val + 1) ∧
      (entry0994 i).IC = S 72 ∧ (entry0994 i).Inext = T 71 (135 + i.val + 1) ∧
      (entry0994 i).Icur = T 71 (135 + i.val) ∧
      (entry0994 i).output = T 72 (135 + i.val) ∧
      (entry0994 i).charge = charge 71 (135 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0994 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (135 + i.val)) shift
      (S (135 + i.val + 1)) (S 72) (T 71 (135 + i.val + 1))
      (T 71 (135 + i.val)) (T 72 (135 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0994.entries OriginalRow227TriangleForward0994.checked
    ⟨i.val, by rw [size0994]; exact i.isLt⟩
  change (entry0994 i).check = true at h
  rcases fields0994 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0995 : OriginalRow227TriangleForward0995.entries.size = 32 := rfl

def entry0995 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0995.entries[i.val]'(by rw [size0995]; exact i.isLt)

theorem fields0995 (i : Fin 32) :
    (entry0995 i).IA = shift ∧ (entry0995 i).ID = S (167 + i.val + 1) ∧
      (entry0995 i).IC = S 72 ∧ (entry0995 i).Inext = T 71 (167 + i.val + 1) ∧
      (entry0995 i).Icur = T 71 (167 + i.val) ∧
      (entry0995 i).output = T 72 (167 + i.val) ∧
      (entry0995 i).charge = charge 71 (167 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0995 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (167 + i.val)) shift
      (S (167 + i.val + 1)) (S 72) (T 71 (167 + i.val + 1))
      (T 71 (167 + i.val)) (T 72 (167 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0995.entries OriginalRow227TriangleForward0995.checked
    ⟨i.val, by rw [size0995]; exact i.isLt⟩
  change (entry0995 i).check = true at h
  rcases fields0995 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0996 : OriginalRow227TriangleForward0996.entries.size = 32 := rfl

def entry0996 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0996.entries[i.val]'(by rw [size0996]; exact i.isLt)

theorem fields0996 (i : Fin 32) :
    (entry0996 i).IA = shift ∧ (entry0996 i).ID = S (199 + i.val + 1) ∧
      (entry0996 i).IC = S 72 ∧ (entry0996 i).Inext = T 71 (199 + i.val + 1) ∧
      (entry0996 i).Icur = T 71 (199 + i.val) ∧
      (entry0996 i).output = T 72 (199 + i.val) ∧
      (entry0996 i).charge = charge 71 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0996 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 72) (T 71 (199 + i.val + 1))
      (T 71 (199 + i.val)) (T 72 (199 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0996.entries OriginalRow227TriangleForward0996.checked
    ⟨i.val, by rw [size0996]; exact i.isLt⟩
  change (entry0996 i).check = true at h
  rcases fields0996 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0997 : OriginalRow227TriangleForward0997.entries.size = 32 := rfl

def entry0997 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0997.entries[i.val]'(by rw [size0997]; exact i.isLt)

theorem fields0997 (i : Fin 32) :
    (entry0997 i).IA = shift ∧ (entry0997 i).ID = S (231 + i.val + 1) ∧
      (entry0997 i).IC = S 72 ∧ (entry0997 i).Inext = T 71 (231 + i.val + 1) ∧
      (entry0997 i).Icur = T 71 (231 + i.val) ∧
      (entry0997 i).output = T 72 (231 + i.val) ∧
      (entry0997 i).charge = charge 71 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0997 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 72) (T 71 (231 + i.val + 1))
      (T 71 (231 + i.val)) (T 72 (231 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0997.entries OriginalRow227TriangleForward0997.checked
    ⟨i.val, by rw [size0997]; exact i.isLt⟩
  change (entry0997 i).check = true at h
  rcases fields0997 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0998 : OriginalRow227TriangleForward0998.entries.size = 32 := rfl

def entry0998 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0998.entries[i.val]'(by rw [size0998]; exact i.isLt)

theorem fields0998 (i : Fin 32) :
    (entry0998 i).IA = shift ∧ (entry0998 i).ID = S (263 + i.val + 1) ∧
      (entry0998 i).IC = S 72 ∧ (entry0998 i).Inext = T 71 (263 + i.val + 1) ∧
      (entry0998 i).Icur = T 71 (263 + i.val) ∧
      (entry0998 i).output = T 72 (263 + i.val) ∧
      (entry0998 i).charge = charge 71 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0998 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 72) (T 71 (263 + i.val + 1))
      (T 71 (263 + i.val)) (T 72 (263 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0998.entries OriginalRow227TriangleForward0998.checked
    ⟨i.val, by rw [size0998]; exact i.isLt⟩
  change (entry0998 i).check = true at h
  rcases fields0998 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0999 : OriginalRow227TriangleForward0999.entries.size = 32 := rfl

def entry0999 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0999.entries[i.val]'(by rw [size0999]; exact i.isLt)

theorem fields0999 (i : Fin 32) :
    (entry0999 i).IA = shift ∧ (entry0999 i).ID = S (295 + i.val + 1) ∧
      (entry0999 i).IC = S 72 ∧ (entry0999 i).Inext = T 71 (295 + i.val + 1) ∧
      (entry0999 i).Icur = T 71 (295 + i.val) ∧
      (entry0999 i).output = T 72 (295 + i.val) ∧
      (entry0999 i).charge = charge 71 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0999 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 72) (T 71 (295 + i.val + 1))
      (T 71 (295 + i.val)) (T 72 (295 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0999.entries OriginalRow227TriangleForward0999.checked
    ⟨i.val, by rw [size0999]; exact i.isLt⟩
  change (entry0999 i).check = true at h
  rcases fields0999 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1000 : OriginalRow227TriangleForward1000.entries.size = 32 := rfl

def entry1000 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1000.entries[i.val]'(by rw [size1000]; exact i.isLt)

theorem fields1000 (i : Fin 32) :
    (entry1000 i).IA = shift ∧ (entry1000 i).ID = S (327 + i.val + 1) ∧
      (entry1000 i).IC = S 72 ∧ (entry1000 i).Inext = T 71 (327 + i.val + 1) ∧
      (entry1000 i).Icur = T 71 (327 + i.val) ∧
      (entry1000 i).output = T 72 (327 + i.val) ∧
      (entry1000 i).charge = charge 71 (327 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1000 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (327 + i.val)) shift
      (S (327 + i.val + 1)) (S 72) (T 71 (327 + i.val + 1))
      (T 71 (327 + i.val)) (T 72 (327 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1000.entries OriginalRow227TriangleForward1000.checked
    ⟨i.val, by rw [size1000]; exact i.isLt⟩
  change (entry1000 i).check = true at h
  rcases fields1000 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1001 : OriginalRow227TriangleForward1001.entries.size = 32 := rfl

def entry1001 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1001.entries[i.val]'(by rw [size1001]; exact i.isLt)

theorem fields1001 (i : Fin 32) :
    (entry1001 i).IA = shift ∧ (entry1001 i).ID = S (359 + i.val + 1) ∧
      (entry1001 i).IC = S 72 ∧ (entry1001 i).Inext = T 71 (359 + i.val + 1) ∧
      (entry1001 i).Icur = T 71 (359 + i.val) ∧
      (entry1001 i).output = T 72 (359 + i.val) ∧
      (entry1001 i).charge = charge 71 (359 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1001 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (359 + i.val)) shift
      (S (359 + i.val + 1)) (S 72) (T 71 (359 + i.val + 1))
      (T 71 (359 + i.val)) (T 72 (359 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1001.entries OriginalRow227TriangleForward1001.checked
    ⟨i.val, by rw [size1001]; exact i.isLt⟩
  change (entry1001 i).check = true at h
  rcases fields1001 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1002 : OriginalRow227TriangleForward1002.entries.size = 32 := rfl

def entry1002 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1002.entries[i.val]'(by rw [size1002]; exact i.isLt)

theorem fields1002 (i : Fin 32) :
    (entry1002 i).IA = shift ∧ (entry1002 i).ID = S (391 + i.val + 1) ∧
      (entry1002 i).IC = S 72 ∧ (entry1002 i).Inext = T 71 (391 + i.val + 1) ∧
      (entry1002 i).Icur = T 71 (391 + i.val) ∧
      (entry1002 i).output = T 72 (391 + i.val) ∧
      (entry1002 i).charge = charge 71 (391 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1002 (i : Fin 32) :
    forwardStepOK (-768) (charge 71 (391 + i.val)) shift
      (S (391 + i.val + 1)) (S 72) (T 71 (391 + i.val + 1))
      (T 71 (391 + i.val)) (T 72 (391 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1002.entries OriginalRow227TriangleForward1002.checked
    ⟨i.val, by rw [size1002]; exact i.isLt⟩
  change (entry1002 i).check = true at h
  rcases fields1002 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1003 : OriginalRow227TriangleForward1003.entries.size = 7 := rfl

def entry1003 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1003.entries[i.val]'(by rw [size1003]; exact i.isLt)

theorem fields1003 (i : Fin 7) :
    (entry1003 i).IA = shift ∧ (entry1003 i).ID = S (423 + i.val + 1) ∧
      (entry1003 i).IC = S 72 ∧ (entry1003 i).Inext = T 71 (423 + i.val + 1) ∧
      (entry1003 i).Icur = T 71 (423 + i.val) ∧
      (entry1003 i).output = T 72 (423 + i.val) ∧
      (entry1003 i).charge = charge 71 (423 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root72).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1003 (i : Fin 7) :
    forwardStepOK (-768) (charge 71 (423 + i.val)) shift
      (S (423 + i.val + 1)) (S 72) (T 71 (423 + i.val + 1))
      (T 71 (423 + i.val)) (T 72 (423 + i.val))
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1003.entries OriginalRow227TriangleForward1003.checked
    ⟨i.val, by rw [size1003]; exact i.isLt⟩
  change (entry1003 i).check = true at h
  rcases fields1003 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 71 ≤ d) (hhi : d < 430) :
    forwardStepOK (-768) (charge 71 d) shift (S (d + 1)) (S 72)
      (T 71 (d + 1)) (T 71 d) (T 72 d)
      (OriginalRow227Roots.root_pos 72 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 71 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h167 : d < 167
    ·
      by_cases h103 : d < 103
      ·
        have hi : d - 71 < 32 := by omega
        have heq : 71 + (d - 71) = d := by omega
        simpa only [heq] using step0992 ⟨d - 71, hi⟩
      ·
        by_cases h135 : d < 135
        ·
          have hi : d - 103 < 32 := by omega
          have heq : 103 + (d - 103) = d := by omega
          simpa only [heq] using step0993 ⟨d - 103, hi⟩
        ·
          have hi : d - 135 < 32 := by omega
          have heq : 135 + (d - 135) = d := by omega
          simpa only [heq] using step0994 ⟨d - 135, hi⟩
    ·
      by_cases h199 : d < 199
      ·
        have hi : d - 167 < 32 := by omega
        have heq : 167 + (d - 167) = d := by omega
        simpa only [heq] using step0995 ⟨d - 167, hi⟩
      ·
        by_cases h231 : d < 231
        ·
          have hi : d - 199 < 32 := by omega
          have heq : 199 + (d - 199) = d := by omega
          simpa only [heq] using step0996 ⟨d - 199, hi⟩
        ·
          have hi : d - 231 < 32 := by omega
          have heq : 231 + (d - 231) = d := by omega
          simpa only [heq] using step0997 ⟨d - 231, hi⟩
  ·
    by_cases h359 : d < 359
    ·
      by_cases h295 : d < 295
      ·
        have hi : d - 263 < 32 := by omega
        have heq : 263 + (d - 263) = d := by omega
        simpa only [heq] using step0998 ⟨d - 263, hi⟩
      ·
        by_cases h327 : d < 327
        ·
          have hi : d - 295 < 32 := by omega
          have heq : 295 + (d - 295) = d := by omega
          simpa only [heq] using step0999 ⟨d - 295, hi⟩
        ·
          have hi : d - 327 < 32 := by omega
          have heq : 327 + (d - 327) = d := by omega
          simpa only [heq] using step1000 ⟨d - 327, hi⟩
    ·
      by_cases h391 : d < 391
      ·
        have hi : d - 359 < 32 := by omega
        have heq : 359 + (d - 359) = d := by omega
        simpa only [heq] using step1001 ⟨d - 359, hi⟩
      ·
        by_cases h423 : d < 423
        ·
          have hi : d - 391 < 32 := by omega
          have heq : 391 + (d - 391) = d := by omega
          simpa only [heq] using step1002 ⟨d - 391, hi⟩
        ·
          have hi : d - 423 < 7 := by omega
          have heq : 423 + (d - 423) = d := by omega
          simpa only [heq] using step1003 ⟨d - 423, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0992,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0992,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0993,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0993,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0994,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0994,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0995,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0995,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0996,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0996,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0997,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0997,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0998,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0998,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields0999,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step0999,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields1000,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step1000,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields1001,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step1001,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields1002,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step1002,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.fields1003,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.step1003,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow072
