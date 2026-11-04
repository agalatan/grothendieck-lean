import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076
import Grothe.UpperChaos.OriginalRow227TriangleForward1040
import Grothe.UpperChaos.OriginalRow227TriangleForward1041
import Grothe.UpperChaos.OriginalRow227TriangleForward1042
import Grothe.UpperChaos.OriginalRow227TriangleForward1043
import Grothe.UpperChaos.OriginalRow227TriangleForward1044
import Grothe.UpperChaos.OriginalRow227TriangleForward1045
import Grothe.UpperChaos.OriginalRow227TriangleForward1046
import Grothe.UpperChaos.OriginalRow227TriangleForward1047
import Grothe.UpperChaos.OriginalRow227TriangleForward1048
import Grothe.UpperChaos.OriginalRow227TriangleForward1049
import Grothe.UpperChaos.OriginalRow227TriangleForward1050

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1040 : OriginalRow227TriangleForward1040.entries.size = 32 := rfl

def entry1040 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1040.entries[i.val]'(by rw [size1040]; exact i.isLt)

theorem fields1040 (i : Fin 32) :
    (entry1040 i).IA = shift ∧ (entry1040 i).ID = S (75 + i.val + 1) ∧
      (entry1040 i).IC = S 76 ∧ (entry1040 i).Inext = T 75 (75 + i.val + 1) ∧
      (entry1040 i).Icur = T 75 (75 + i.val) ∧
      (entry1040 i).output = T 76 (75 + i.val) ∧
      (entry1040 i).charge = charge 75 (75 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1040 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (75 + i.val)) shift
      (S (75 + i.val + 1)) (S 76) (T 75 (75 + i.val + 1))
      (T 75 (75 + i.val)) (T 76 (75 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1040.entries OriginalRow227TriangleForward1040.checked
    ⟨i.val, by rw [size1040]; exact i.isLt⟩
  change (entry1040 i).check = true at h
  rcases fields1040 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1041 : OriginalRow227TriangleForward1041.entries.size = 32 := rfl

def entry1041 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1041.entries[i.val]'(by rw [size1041]; exact i.isLt)

theorem fields1041 (i : Fin 32) :
    (entry1041 i).IA = shift ∧ (entry1041 i).ID = S (107 + i.val + 1) ∧
      (entry1041 i).IC = S 76 ∧ (entry1041 i).Inext = T 75 (107 + i.val + 1) ∧
      (entry1041 i).Icur = T 75 (107 + i.val) ∧
      (entry1041 i).output = T 76 (107 + i.val) ∧
      (entry1041 i).charge = charge 75 (107 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1041 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (107 + i.val)) shift
      (S (107 + i.val + 1)) (S 76) (T 75 (107 + i.val + 1))
      (T 75 (107 + i.val)) (T 76 (107 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1041.entries OriginalRow227TriangleForward1041.checked
    ⟨i.val, by rw [size1041]; exact i.isLt⟩
  change (entry1041 i).check = true at h
  rcases fields1041 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1042 : OriginalRow227TriangleForward1042.entries.size = 32 := rfl

def entry1042 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1042.entries[i.val]'(by rw [size1042]; exact i.isLt)

theorem fields1042 (i : Fin 32) :
    (entry1042 i).IA = shift ∧ (entry1042 i).ID = S (139 + i.val + 1) ∧
      (entry1042 i).IC = S 76 ∧ (entry1042 i).Inext = T 75 (139 + i.val + 1) ∧
      (entry1042 i).Icur = T 75 (139 + i.val) ∧
      (entry1042 i).output = T 76 (139 + i.val) ∧
      (entry1042 i).charge = charge 75 (139 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1042 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (139 + i.val)) shift
      (S (139 + i.val + 1)) (S 76) (T 75 (139 + i.val + 1))
      (T 75 (139 + i.val)) (T 76 (139 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1042.entries OriginalRow227TriangleForward1042.checked
    ⟨i.val, by rw [size1042]; exact i.isLt⟩
  change (entry1042 i).check = true at h
  rcases fields1042 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1043 : OriginalRow227TriangleForward1043.entries.size = 32 := rfl

def entry1043 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1043.entries[i.val]'(by rw [size1043]; exact i.isLt)

theorem fields1043 (i : Fin 32) :
    (entry1043 i).IA = shift ∧ (entry1043 i).ID = S (171 + i.val + 1) ∧
      (entry1043 i).IC = S 76 ∧ (entry1043 i).Inext = T 75 (171 + i.val + 1) ∧
      (entry1043 i).Icur = T 75 (171 + i.val) ∧
      (entry1043 i).output = T 76 (171 + i.val) ∧
      (entry1043 i).charge = charge 75 (171 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1043 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (171 + i.val)) shift
      (S (171 + i.val + 1)) (S 76) (T 75 (171 + i.val + 1))
      (T 75 (171 + i.val)) (T 76 (171 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1043.entries OriginalRow227TriangleForward1043.checked
    ⟨i.val, by rw [size1043]; exact i.isLt⟩
  change (entry1043 i).check = true at h
  rcases fields1043 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1044 : OriginalRow227TriangleForward1044.entries.size = 32 := rfl

def entry1044 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1044.entries[i.val]'(by rw [size1044]; exact i.isLt)

theorem fields1044 (i : Fin 32) :
    (entry1044 i).IA = shift ∧ (entry1044 i).ID = S (203 + i.val + 1) ∧
      (entry1044 i).IC = S 76 ∧ (entry1044 i).Inext = T 75 (203 + i.val + 1) ∧
      (entry1044 i).Icur = T 75 (203 + i.val) ∧
      (entry1044 i).output = T 76 (203 + i.val) ∧
      (entry1044 i).charge = charge 75 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1044 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 76) (T 75 (203 + i.val + 1))
      (T 75 (203 + i.val)) (T 76 (203 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1044.entries OriginalRow227TriangleForward1044.checked
    ⟨i.val, by rw [size1044]; exact i.isLt⟩
  change (entry1044 i).check = true at h
  rcases fields1044 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1045 : OriginalRow227TriangleForward1045.entries.size = 32 := rfl

def entry1045 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1045.entries[i.val]'(by rw [size1045]; exact i.isLt)

theorem fields1045 (i : Fin 32) :
    (entry1045 i).IA = shift ∧ (entry1045 i).ID = S (235 + i.val + 1) ∧
      (entry1045 i).IC = S 76 ∧ (entry1045 i).Inext = T 75 (235 + i.val + 1) ∧
      (entry1045 i).Icur = T 75 (235 + i.val) ∧
      (entry1045 i).output = T 76 (235 + i.val) ∧
      (entry1045 i).charge = charge 75 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1045 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 76) (T 75 (235 + i.val + 1))
      (T 75 (235 + i.val)) (T 76 (235 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1045.entries OriginalRow227TriangleForward1045.checked
    ⟨i.val, by rw [size1045]; exact i.isLt⟩
  change (entry1045 i).check = true at h
  rcases fields1045 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1046 : OriginalRow227TriangleForward1046.entries.size = 32 := rfl

def entry1046 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1046.entries[i.val]'(by rw [size1046]; exact i.isLt)

theorem fields1046 (i : Fin 32) :
    (entry1046 i).IA = shift ∧ (entry1046 i).ID = S (267 + i.val + 1) ∧
      (entry1046 i).IC = S 76 ∧ (entry1046 i).Inext = T 75 (267 + i.val + 1) ∧
      (entry1046 i).Icur = T 75 (267 + i.val) ∧
      (entry1046 i).output = T 76 (267 + i.val) ∧
      (entry1046 i).charge = charge 75 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1046 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 76) (T 75 (267 + i.val + 1))
      (T 75 (267 + i.val)) (T 76 (267 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1046.entries OriginalRow227TriangleForward1046.checked
    ⟨i.val, by rw [size1046]; exact i.isLt⟩
  change (entry1046 i).check = true at h
  rcases fields1046 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1047 : OriginalRow227TriangleForward1047.entries.size = 32 := rfl

def entry1047 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1047.entries[i.val]'(by rw [size1047]; exact i.isLt)

theorem fields1047 (i : Fin 32) :
    (entry1047 i).IA = shift ∧ (entry1047 i).ID = S (299 + i.val + 1) ∧
      (entry1047 i).IC = S 76 ∧ (entry1047 i).Inext = T 75 (299 + i.val + 1) ∧
      (entry1047 i).Icur = T 75 (299 + i.val) ∧
      (entry1047 i).output = T 76 (299 + i.val) ∧
      (entry1047 i).charge = charge 75 (299 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1047 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (299 + i.val)) shift
      (S (299 + i.val + 1)) (S 76) (T 75 (299 + i.val + 1))
      (T 75 (299 + i.val)) (T 76 (299 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1047.entries OriginalRow227TriangleForward1047.checked
    ⟨i.val, by rw [size1047]; exact i.isLt⟩
  change (entry1047 i).check = true at h
  rcases fields1047 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1048 : OriginalRow227TriangleForward1048.entries.size = 32 := rfl

def entry1048 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1048.entries[i.val]'(by rw [size1048]; exact i.isLt)

theorem fields1048 (i : Fin 32) :
    (entry1048 i).IA = shift ∧ (entry1048 i).ID = S (331 + i.val + 1) ∧
      (entry1048 i).IC = S 76 ∧ (entry1048 i).Inext = T 75 (331 + i.val + 1) ∧
      (entry1048 i).Icur = T 75 (331 + i.val) ∧
      (entry1048 i).output = T 76 (331 + i.val) ∧
      (entry1048 i).charge = charge 75 (331 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1048 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (331 + i.val)) shift
      (S (331 + i.val + 1)) (S 76) (T 75 (331 + i.val + 1))
      (T 75 (331 + i.val)) (T 76 (331 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1048.entries OriginalRow227TriangleForward1048.checked
    ⟨i.val, by rw [size1048]; exact i.isLt⟩
  change (entry1048 i).check = true at h
  rcases fields1048 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1049 : OriginalRow227TriangleForward1049.entries.size = 32 := rfl

def entry1049 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1049.entries[i.val]'(by rw [size1049]; exact i.isLt)

theorem fields1049 (i : Fin 32) :
    (entry1049 i).IA = shift ∧ (entry1049 i).ID = S (363 + i.val + 1) ∧
      (entry1049 i).IC = S 76 ∧ (entry1049 i).Inext = T 75 (363 + i.val + 1) ∧
      (entry1049 i).Icur = T 75 (363 + i.val) ∧
      (entry1049 i).output = T 76 (363 + i.val) ∧
      (entry1049 i).charge = charge 75 (363 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1049 (i : Fin 32) :
    forwardStepOK (-768) (charge 75 (363 + i.val)) shift
      (S (363 + i.val + 1)) (S 76) (T 75 (363 + i.val + 1))
      (T 75 (363 + i.val)) (T 76 (363 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1049.entries OriginalRow227TriangleForward1049.checked
    ⟨i.val, by rw [size1049]; exact i.isLt⟩
  change (entry1049 i).check = true at h
  rcases fields1049 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1050 : OriginalRow227TriangleForward1050.entries.size = 31 := rfl

def entry1050 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1050.entries[i.val]'(by rw [size1050]; exact i.isLt)

theorem fields1050 (i : Fin 31) :
    (entry1050 i).IA = shift ∧ (entry1050 i).ID = S (395 + i.val + 1) ∧
      (entry1050 i).IC = S 76 ∧ (entry1050 i).Inext = T 75 (395 + i.val + 1) ∧
      (entry1050 i).Icur = T 75 (395 + i.val) ∧
      (entry1050 i).output = T 76 (395 + i.val) ∧
      (entry1050 i).charge = charge 75 (395 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root76).symm,
      (OriginalRow227TriangleBindingsRow075.block1055_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1050 (i : Fin 31) :
    forwardStepOK (-768) (charge 75 (395 + i.val)) shift
      (S (395 + i.val + 1)) (S 76) (T 75 (395 + i.val + 1))
      (T 75 (395 + i.val)) (T 76 (395 + i.val))
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1050.entries OriginalRow227TriangleForward1050.checked
    ⟨i.val, by rw [size1050]; exact i.isLt⟩
  change (entry1050 i).check = true at h
  rcases fields1050 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 75 ≤ d) (hhi : d < 426) :
    forwardStepOK (-768) (charge 75 d) shift (S (d + 1)) (S 76)
      (T 75 (d + 1)) (T 75 d) (T 76 d)
      (OriginalRow227Roots.root_pos 76 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 75 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    by_cases h139 : d < 139
    ·
      by_cases h107 : d < 107
      ·
        have hi : d - 75 < 32 := by omega
        have heq : 75 + (d - 75) = d := by omega
        simpa only [heq] using step1040 ⟨d - 75, hi⟩
      ·
        have hi : d - 107 < 32 := by omega
        have heq : 107 + (d - 107) = d := by omega
        simpa only [heq] using step1041 ⟨d - 107, hi⟩
    ·
      by_cases h171 : d < 171
      ·
        have hi : d - 139 < 32 := by omega
        have heq : 139 + (d - 139) = d := by omega
        simpa only [heq] using step1042 ⟨d - 139, hi⟩
      ·
        by_cases h203 : d < 203
        ·
          have hi : d - 171 < 32 := by omega
          have heq : 171 + (d - 171) = d := by omega
          simpa only [heq] using step1043 ⟨d - 171, hi⟩
        ·
          have hi : d - 203 < 32 := by omega
          have heq : 203 + (d - 203) = d := by omega
          simpa only [heq] using step1044 ⟨d - 203, hi⟩
  ·
    by_cases h331 : d < 331
    ·
      by_cases h267 : d < 267
      ·
        have hi : d - 235 < 32 := by omega
        have heq : 235 + (d - 235) = d := by omega
        simpa only [heq] using step1045 ⟨d - 235, hi⟩
      ·
        by_cases h299 : d < 299
        ·
          have hi : d - 267 < 32 := by omega
          have heq : 267 + (d - 267) = d := by omega
          simpa only [heq] using step1046 ⟨d - 267, hi⟩
        ·
          have hi : d - 299 < 32 := by omega
          have heq : 299 + (d - 299) = d := by omega
          simpa only [heq] using step1047 ⟨d - 299, hi⟩
    ·
      by_cases h363 : d < 363
      ·
        have hi : d - 331 < 32 := by omega
        have heq : 331 + (d - 331) = d := by omega
        simpa only [heq] using step1048 ⟨d - 331, hi⟩
      ·
        by_cases h395 : d < 395
        ·
          have hi : d - 363 < 32 := by omega
          have heq : 363 + (d - 363) = d := by omega
          simpa only [heq] using step1049 ⟨d - 363, hi⟩
        ·
          have hi : d - 395 < 31 := by omega
          have heq : 395 + (d - 395) = d := by omega
          simpa only [heq] using step1050 ⟨d - 395, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1040,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1040,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1041,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1041,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1042,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1042,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1043,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1043,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1044,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1044,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1045,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1045,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1046,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1046,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1047,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1047,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1048,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1048,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1049,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1049,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.fields1050,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.step1050,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow076
