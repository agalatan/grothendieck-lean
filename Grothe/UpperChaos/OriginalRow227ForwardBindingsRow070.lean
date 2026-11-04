import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow069
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070
import Grothe.UpperChaos.OriginalRow227TriangleForward0968
import Grothe.UpperChaos.OriginalRow227TriangleForward0969
import Grothe.UpperChaos.OriginalRow227TriangleForward0970
import Grothe.UpperChaos.OriginalRow227TriangleForward0971
import Grothe.UpperChaos.OriginalRow227TriangleForward0972
import Grothe.UpperChaos.OriginalRow227TriangleForward0973
import Grothe.UpperChaos.OriginalRow227TriangleForward0974
import Grothe.UpperChaos.OriginalRow227TriangleForward0975
import Grothe.UpperChaos.OriginalRow227TriangleForward0976
import Grothe.UpperChaos.OriginalRow227TriangleForward0977
import Grothe.UpperChaos.OriginalRow227TriangleForward0978
import Grothe.UpperChaos.OriginalRow227TriangleForward0979

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0968 : OriginalRow227TriangleForward0968.entries.size = 32 := rfl

def entry0968 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0968.entries[i.val]'(by rw [size0968]; exact i.isLt)

theorem fields0968 (i : Fin 32) :
    (entry0968 i).IA = shift ∧ (entry0968 i).ID = S (69 + i.val + 1) ∧
      (entry0968 i).IC = S 70 ∧ (entry0968 i).Inext = T 69 (69 + i.val + 1) ∧
      (entry0968 i).Icur = T 69 (69 + i.val) ∧
      (entry0968 i).output = T 70 (69 + i.val) ∧
      (entry0968 i).charge = charge 69 (69 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0968 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (69 + i.val)) shift
      (S (69 + i.val + 1)) (S 70) (T 69 (69 + i.val + 1))
      (T 69 (69 + i.val)) (T 70 (69 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0968.entries OriginalRow227TriangleForward0968.checked
    ⟨i.val, by rw [size0968]; exact i.isLt⟩
  change (entry0968 i).check = true at h
  rcases fields0968 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0969 : OriginalRow227TriangleForward0969.entries.size = 32 := rfl

def entry0969 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0969.entries[i.val]'(by rw [size0969]; exact i.isLt)

theorem fields0969 (i : Fin 32) :
    (entry0969 i).IA = shift ∧ (entry0969 i).ID = S (101 + i.val + 1) ∧
      (entry0969 i).IC = S 70 ∧ (entry0969 i).Inext = T 69 (101 + i.val + 1) ∧
      (entry0969 i).Icur = T 69 (101 + i.val) ∧
      (entry0969 i).output = T 70 (101 + i.val) ∧
      (entry0969 i).charge = charge 69 (101 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0969 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (101 + i.val)) shift
      (S (101 + i.val + 1)) (S 70) (T 69 (101 + i.val + 1))
      (T 69 (101 + i.val)) (T 70 (101 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0969.entries OriginalRow227TriangleForward0969.checked
    ⟨i.val, by rw [size0969]; exact i.isLt⟩
  change (entry0969 i).check = true at h
  rcases fields0969 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0970 : OriginalRow227TriangleForward0970.entries.size = 32 := rfl

def entry0970 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0970.entries[i.val]'(by rw [size0970]; exact i.isLt)

theorem fields0970 (i : Fin 32) :
    (entry0970 i).IA = shift ∧ (entry0970 i).ID = S (133 + i.val + 1) ∧
      (entry0970 i).IC = S 70 ∧ (entry0970 i).Inext = T 69 (133 + i.val + 1) ∧
      (entry0970 i).Icur = T 69 (133 + i.val) ∧
      (entry0970 i).output = T 70 (133 + i.val) ∧
      (entry0970 i).charge = charge 69 (133 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0970 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (133 + i.val)) shift
      (S (133 + i.val + 1)) (S 70) (T 69 (133 + i.val + 1))
      (T 69 (133 + i.val)) (T 70 (133 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0970.entries OriginalRow227TriangleForward0970.checked
    ⟨i.val, by rw [size0970]; exact i.isLt⟩
  change (entry0970 i).check = true at h
  rcases fields0970 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0971 : OriginalRow227TriangleForward0971.entries.size = 32 := rfl

def entry0971 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0971.entries[i.val]'(by rw [size0971]; exact i.isLt)

theorem fields0971 (i : Fin 32) :
    (entry0971 i).IA = shift ∧ (entry0971 i).ID = S (165 + i.val + 1) ∧
      (entry0971 i).IC = S 70 ∧ (entry0971 i).Inext = T 69 (165 + i.val + 1) ∧
      (entry0971 i).Icur = T 69 (165 + i.val) ∧
      (entry0971 i).output = T 70 (165 + i.val) ∧
      (entry0971 i).charge = charge 69 (165 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0971 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (165 + i.val)) shift
      (S (165 + i.val + 1)) (S 70) (T 69 (165 + i.val + 1))
      (T 69 (165 + i.val)) (T 70 (165 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0971.entries OriginalRow227TriangleForward0971.checked
    ⟨i.val, by rw [size0971]; exact i.isLt⟩
  change (entry0971 i).check = true at h
  rcases fields0971 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0972 : OriginalRow227TriangleForward0972.entries.size = 32 := rfl

def entry0972 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0972.entries[i.val]'(by rw [size0972]; exact i.isLt)

theorem fields0972 (i : Fin 32) :
    (entry0972 i).IA = shift ∧ (entry0972 i).ID = S (197 + i.val + 1) ∧
      (entry0972 i).IC = S 70 ∧ (entry0972 i).Inext = T 69 (197 + i.val + 1) ∧
      (entry0972 i).Icur = T 69 (197 + i.val) ∧
      (entry0972 i).output = T 70 (197 + i.val) ∧
      (entry0972 i).charge = charge 69 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0972 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 70) (T 69 (197 + i.val + 1))
      (T 69 (197 + i.val)) (T 70 (197 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0972.entries OriginalRow227TriangleForward0972.checked
    ⟨i.val, by rw [size0972]; exact i.isLt⟩
  change (entry0972 i).check = true at h
  rcases fields0972 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0973 : OriginalRow227TriangleForward0973.entries.size = 32 := rfl

def entry0973 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0973.entries[i.val]'(by rw [size0973]; exact i.isLt)

theorem fields0973 (i : Fin 32) :
    (entry0973 i).IA = shift ∧ (entry0973 i).ID = S (229 + i.val + 1) ∧
      (entry0973 i).IC = S 70 ∧ (entry0973 i).Inext = T 69 (229 + i.val + 1) ∧
      (entry0973 i).Icur = T 69 (229 + i.val) ∧
      (entry0973 i).output = T 70 (229 + i.val) ∧
      (entry0973 i).charge = charge 69 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0973 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 70) (T 69 (229 + i.val + 1))
      (T 69 (229 + i.val)) (T 70 (229 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0973.entries OriginalRow227TriangleForward0973.checked
    ⟨i.val, by rw [size0973]; exact i.isLt⟩
  change (entry0973 i).check = true at h
  rcases fields0973 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0974 : OriginalRow227TriangleForward0974.entries.size = 32 := rfl

def entry0974 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0974.entries[i.val]'(by rw [size0974]; exact i.isLt)

theorem fields0974 (i : Fin 32) :
    (entry0974 i).IA = shift ∧ (entry0974 i).ID = S (261 + i.val + 1) ∧
      (entry0974 i).IC = S 70 ∧ (entry0974 i).Inext = T 69 (261 + i.val + 1) ∧
      (entry0974 i).Icur = T 69 (261 + i.val) ∧
      (entry0974 i).output = T 70 (261 + i.val) ∧
      (entry0974 i).charge = charge 69 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0974 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 70) (T 69 (261 + i.val + 1))
      (T 69 (261 + i.val)) (T 70 (261 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0974.entries OriginalRow227TriangleForward0974.checked
    ⟨i.val, by rw [size0974]; exact i.isLt⟩
  change (entry0974 i).check = true at h
  rcases fields0974 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0975 : OriginalRow227TriangleForward0975.entries.size = 32 := rfl

def entry0975 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0975.entries[i.val]'(by rw [size0975]; exact i.isLt)

theorem fields0975 (i : Fin 32) :
    (entry0975 i).IA = shift ∧ (entry0975 i).ID = S (293 + i.val + 1) ∧
      (entry0975 i).IC = S 70 ∧ (entry0975 i).Inext = T 69 (293 + i.val + 1) ∧
      (entry0975 i).Icur = T 69 (293 + i.val) ∧
      (entry0975 i).output = T 70 (293 + i.val) ∧
      (entry0975 i).charge = charge 69 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0975 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 70) (T 69 (293 + i.val + 1))
      (T 69 (293 + i.val)) (T 70 (293 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0975.entries OriginalRow227TriangleForward0975.checked
    ⟨i.val, by rw [size0975]; exact i.isLt⟩
  change (entry0975 i).check = true at h
  rcases fields0975 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0976 : OriginalRow227TriangleForward0976.entries.size = 32 := rfl

def entry0976 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0976.entries[i.val]'(by rw [size0976]; exact i.isLt)

theorem fields0976 (i : Fin 32) :
    (entry0976 i).IA = shift ∧ (entry0976 i).ID = S (325 + i.val + 1) ∧
      (entry0976 i).IC = S 70 ∧ (entry0976 i).Inext = T 69 (325 + i.val + 1) ∧
      (entry0976 i).Icur = T 69 (325 + i.val) ∧
      (entry0976 i).output = T 70 (325 + i.val) ∧
      (entry0976 i).charge = charge 69 (325 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0976 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (325 + i.val)) shift
      (S (325 + i.val + 1)) (S 70) (T 69 (325 + i.val + 1))
      (T 69 (325 + i.val)) (T 70 (325 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0976.entries OriginalRow227TriangleForward0976.checked
    ⟨i.val, by rw [size0976]; exact i.isLt⟩
  change (entry0976 i).check = true at h
  rcases fields0976 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0977 : OriginalRow227TriangleForward0977.entries.size = 32 := rfl

def entry0977 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0977.entries[i.val]'(by rw [size0977]; exact i.isLt)

theorem fields0977 (i : Fin 32) :
    (entry0977 i).IA = shift ∧ (entry0977 i).ID = S (357 + i.val + 1) ∧
      (entry0977 i).IC = S 70 ∧ (entry0977 i).Inext = T 69 (357 + i.val + 1) ∧
      (entry0977 i).Icur = T 69 (357 + i.val) ∧
      (entry0977 i).output = T 70 (357 + i.val) ∧
      (entry0977 i).charge = charge 69 (357 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0977 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (357 + i.val)) shift
      (S (357 + i.val + 1)) (S 70) (T 69 (357 + i.val + 1))
      (T 69 (357 + i.val)) (T 70 (357 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0977.entries OriginalRow227TriangleForward0977.checked
    ⟨i.val, by rw [size0977]; exact i.isLt⟩
  change (entry0977 i).check = true at h
  rcases fields0977 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0978 : OriginalRow227TriangleForward0978.entries.size = 32 := rfl

def entry0978 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0978.entries[i.val]'(by rw [size0978]; exact i.isLt)

theorem fields0978 (i : Fin 32) :
    (entry0978 i).IA = shift ∧ (entry0978 i).ID = S (389 + i.val + 1) ∧
      (entry0978 i).IC = S 70 ∧ (entry0978 i).Inext = T 69 (389 + i.val + 1) ∧
      (entry0978 i).Icur = T 69 (389 + i.val) ∧
      (entry0978 i).output = T 70 (389 + i.val) ∧
      (entry0978 i).charge = charge 69 (389 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0978 (i : Fin 32) :
    forwardStepOK (-768) (charge 69 (389 + i.val)) shift
      (S (389 + i.val + 1)) (S 70) (T 69 (389 + i.val + 1))
      (T 69 (389 + i.val)) (T 70 (389 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0978.entries OriginalRow227TriangleForward0978.checked
    ⟨i.val, by rw [size0978]; exact i.isLt⟩
  change (entry0978 i).check = true at h
  rcases fields0978 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0979 : OriginalRow227TriangleForward0979.entries.size = 11 := rfl

def entry0979 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0979.entries[i.val]'(by rw [size0979]; exact i.isLt)

theorem fields0979 (i : Fin 11) :
    (entry0979 i).IA = shift ∧ (entry0979 i).ID = S (421 + i.val + 1) ∧
      (entry0979 i).IC = S 70 ∧ (entry0979 i).Inext = T 69 (421 + i.val + 1) ∧
      (entry0979 i).Icur = T 69 (421 + i.val) ∧
      (entry0979 i).output = T 70 (421 + i.val) ∧
      (entry0979 i).charge = charge 69 (421 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings02.S_eq_root70).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨10, by decide⟩).symm, rfl⟩

theorem step0979 (i : Fin 11) :
    forwardStepOK (-768) (charge 69 (421 + i.val)) shift
      (S (421 + i.val + 1)) (S 70) (T 69 (421 + i.val + 1))
      (T 69 (421 + i.val)) (T 70 (421 + i.val))
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0979.entries OriginalRow227TriangleForward0979.checked
    ⟨i.val, by rw [size0979]; exact i.isLt⟩
  change (entry0979 i).check = true at h
  rcases fields0979 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 69 ≤ d) (hhi : d < 432) :
    forwardStepOK (-768) (charge 69 d) shift (S (d + 1)) (S 70)
      (T 69 (d + 1)) (T 69 d) (T 70 d)
      (OriginalRow227Roots.root_pos 70 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 69 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h165 : d < 165
    ·
      by_cases h101 : d < 101
      ·
        have hi : d - 69 < 32 := by omega
        have heq : 69 + (d - 69) = d := by omega
        simpa only [heq] using step0968 ⟨d - 69, hi⟩
      ·
        by_cases h133 : d < 133
        ·
          have hi : d - 101 < 32 := by omega
          have heq : 101 + (d - 101) = d := by omega
          simpa only [heq] using step0969 ⟨d - 101, hi⟩
        ·
          have hi : d - 133 < 32 := by omega
          have heq : 133 + (d - 133) = d := by omega
          simpa only [heq] using step0970 ⟨d - 133, hi⟩
    ·
      by_cases h197 : d < 197
      ·
        have hi : d - 165 < 32 := by omega
        have heq : 165 + (d - 165) = d := by omega
        simpa only [heq] using step0971 ⟨d - 165, hi⟩
      ·
        by_cases h229 : d < 229
        ·
          have hi : d - 197 < 32 := by omega
          have heq : 197 + (d - 197) = d := by omega
          simpa only [heq] using step0972 ⟨d - 197, hi⟩
        ·
          have hi : d - 229 < 32 := by omega
          have heq : 229 + (d - 229) = d := by omega
          simpa only [heq] using step0973 ⟨d - 229, hi⟩
  ·
    by_cases h357 : d < 357
    ·
      by_cases h293 : d < 293
      ·
        have hi : d - 261 < 32 := by omega
        have heq : 261 + (d - 261) = d := by omega
        simpa only [heq] using step0974 ⟨d - 261, hi⟩
      ·
        by_cases h325 : d < 325
        ·
          have hi : d - 293 < 32 := by omega
          have heq : 293 + (d - 293) = d := by omega
          simpa only [heq] using step0975 ⟨d - 293, hi⟩
        ·
          have hi : d - 325 < 32 := by omega
          have heq : 325 + (d - 325) = d := by omega
          simpa only [heq] using step0976 ⟨d - 325, hi⟩
    ·
      by_cases h389 : d < 389
      ·
        have hi : d - 357 < 32 := by omega
        have heq : 357 + (d - 357) = d := by omega
        simpa only [heq] using step0977 ⟨d - 357, hi⟩
      ·
        by_cases h421 : d < 421
        ·
          have hi : d - 389 < 32 := by omega
          have heq : 389 + (d - 389) = d := by omega
          simpa only [heq] using step0978 ⟨d - 389, hi⟩
        ·
          have hi : d - 421 < 11 := by omega
          have heq : 421 + (d - 421) = d := by omega
          simpa only [heq] using step0979 ⟨d - 421, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0968,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0968,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0969,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0969,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0970,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0970,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0971,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0971,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0972,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0972,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0973,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0973,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0974,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0974,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0975,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0975,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0976,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0976,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0977,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0977,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0978,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0978,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.fields0979,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.step0979,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow070
