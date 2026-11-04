import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow075
import Grothe.UpperChaos.OriginalRow227TriangleForward1028
import Grothe.UpperChaos.OriginalRow227TriangleForward1029
import Grothe.UpperChaos.OriginalRow227TriangleForward1030
import Grothe.UpperChaos.OriginalRow227TriangleForward1031
import Grothe.UpperChaos.OriginalRow227TriangleForward1032
import Grothe.UpperChaos.OriginalRow227TriangleForward1033
import Grothe.UpperChaos.OriginalRow227TriangleForward1034
import Grothe.UpperChaos.OriginalRow227TriangleForward1035
import Grothe.UpperChaos.OriginalRow227TriangleForward1036
import Grothe.UpperChaos.OriginalRow227TriangleForward1037
import Grothe.UpperChaos.OriginalRow227TriangleForward1038
import Grothe.UpperChaos.OriginalRow227TriangleForward1039

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1028 : OriginalRow227TriangleForward1028.entries.size = 32 := rfl

def entry1028 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1028.entries[i.val]'(by rw [size1028]; exact i.isLt)

theorem fields1028 (i : Fin 32) :
    (entry1028 i).IA = shift ∧ (entry1028 i).ID = S (74 + i.val + 1) ∧
      (entry1028 i).IC = S 75 ∧ (entry1028 i).Inext = T 74 (74 + i.val + 1) ∧
      (entry1028 i).Icur = T 74 (74 + i.val) ∧
      (entry1028 i).output = T 75 (74 + i.val) ∧
      (entry1028 i).charge = charge 74 (74 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1044_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1028 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (74 + i.val)) shift
      (S (74 + i.val + 1)) (S 75) (T 74 (74 + i.val + 1))
      (T 74 (74 + i.val)) (T 75 (74 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1028.entries OriginalRow227TriangleForward1028.checked
    ⟨i.val, by rw [size1028]; exact i.isLt⟩
  change (entry1028 i).check = true at h
  rcases fields1028 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1029 : OriginalRow227TriangleForward1029.entries.size = 32 := rfl

def entry1029 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1029.entries[i.val]'(by rw [size1029]; exact i.isLt)

theorem fields1029 (i : Fin 32) :
    (entry1029 i).IA = shift ∧ (entry1029 i).ID = S (106 + i.val + 1) ∧
      (entry1029 i).IC = S 75 ∧ (entry1029 i).Inext = T 74 (106 + i.val + 1) ∧
      (entry1029 i).Icur = T 74 (106 + i.val) ∧
      (entry1029 i).output = T 75 (106 + i.val) ∧
      (entry1029 i).charge = charge 74 (106 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1045_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1029 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (106 + i.val)) shift
      (S (106 + i.val + 1)) (S 75) (T 74 (106 + i.val + 1))
      (T 74 (106 + i.val)) (T 75 (106 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1029.entries OriginalRow227TriangleForward1029.checked
    ⟨i.val, by rw [size1029]; exact i.isLt⟩
  change (entry1029 i).check = true at h
  rcases fields1029 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1030 : OriginalRow227TriangleForward1030.entries.size = 32 := rfl

def entry1030 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1030.entries[i.val]'(by rw [size1030]; exact i.isLt)

theorem fields1030 (i : Fin 32) :
    (entry1030 i).IA = shift ∧ (entry1030 i).ID = S (138 + i.val + 1) ∧
      (entry1030 i).IC = S 75 ∧ (entry1030 i).Inext = T 74 (138 + i.val + 1) ∧
      (entry1030 i).Icur = T 74 (138 + i.val) ∧
      (entry1030 i).output = T 75 (138 + i.val) ∧
      (entry1030 i).charge = charge 74 (138 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1046_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1030 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (138 + i.val)) shift
      (S (138 + i.val + 1)) (S 75) (T 74 (138 + i.val + 1))
      (T 74 (138 + i.val)) (T 75 (138 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1030.entries OriginalRow227TriangleForward1030.checked
    ⟨i.val, by rw [size1030]; exact i.isLt⟩
  change (entry1030 i).check = true at h
  rcases fields1030 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1031 : OriginalRow227TriangleForward1031.entries.size = 32 := rfl

def entry1031 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1031.entries[i.val]'(by rw [size1031]; exact i.isLt)

theorem fields1031 (i : Fin 32) :
    (entry1031 i).IA = shift ∧ (entry1031 i).ID = S (170 + i.val + 1) ∧
      (entry1031 i).IC = S 75 ∧ (entry1031 i).Inext = T 74 (170 + i.val + 1) ∧
      (entry1031 i).Icur = T 74 (170 + i.val) ∧
      (entry1031 i).output = T 75 (170 + i.val) ∧
      (entry1031 i).charge = charge 74 (170 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1047_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1031 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (170 + i.val)) shift
      (S (170 + i.val + 1)) (S 75) (T 74 (170 + i.val + 1))
      (T 74 (170 + i.val)) (T 75 (170 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1031.entries OriginalRow227TriangleForward1031.checked
    ⟨i.val, by rw [size1031]; exact i.isLt⟩
  change (entry1031 i).check = true at h
  rcases fields1031 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1032 : OriginalRow227TriangleForward1032.entries.size = 32 := rfl

def entry1032 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1032.entries[i.val]'(by rw [size1032]; exact i.isLt)

theorem fields1032 (i : Fin 32) :
    (entry1032 i).IA = shift ∧ (entry1032 i).ID = S (202 + i.val + 1) ∧
      (entry1032 i).IC = S 75 ∧ (entry1032 i).Inext = T 74 (202 + i.val + 1) ∧
      (entry1032 i).Icur = T 74 (202 + i.val) ∧
      (entry1032 i).output = T 75 (202 + i.val) ∧
      (entry1032 i).charge = charge 74 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1048_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1032 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 75) (T 74 (202 + i.val + 1))
      (T 74 (202 + i.val)) (T 75 (202 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1032.entries OriginalRow227TriangleForward1032.checked
    ⟨i.val, by rw [size1032]; exact i.isLt⟩
  change (entry1032 i).check = true at h
  rcases fields1032 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1033 : OriginalRow227TriangleForward1033.entries.size = 32 := rfl

def entry1033 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1033.entries[i.val]'(by rw [size1033]; exact i.isLt)

theorem fields1033 (i : Fin 32) :
    (entry1033 i).IA = shift ∧ (entry1033 i).ID = S (234 + i.val + 1) ∧
      (entry1033 i).IC = S 75 ∧ (entry1033 i).Inext = T 74 (234 + i.val + 1) ∧
      (entry1033 i).Icur = T 74 (234 + i.val) ∧
      (entry1033 i).output = T 75 (234 + i.val) ∧
      (entry1033 i).charge = charge 74 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1049_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1033 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 75) (T 74 (234 + i.val + 1))
      (T 74 (234 + i.val)) (T 75 (234 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1033.entries OriginalRow227TriangleForward1033.checked
    ⟨i.val, by rw [size1033]; exact i.isLt⟩
  change (entry1033 i).check = true at h
  rcases fields1033 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1034 : OriginalRow227TriangleForward1034.entries.size = 32 := rfl

def entry1034 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1034.entries[i.val]'(by rw [size1034]; exact i.isLt)

theorem fields1034 (i : Fin 32) :
    (entry1034 i).IA = shift ∧ (entry1034 i).ID = S (266 + i.val + 1) ∧
      (entry1034 i).IC = S 75 ∧ (entry1034 i).Inext = T 74 (266 + i.val + 1) ∧
      (entry1034 i).Icur = T 74 (266 + i.val) ∧
      (entry1034 i).output = T 75 (266 + i.val) ∧
      (entry1034 i).charge = charge 74 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1050_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1034 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 75) (T 74 (266 + i.val + 1))
      (T 74 (266 + i.val)) (T 75 (266 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1034.entries OriginalRow227TriangleForward1034.checked
    ⟨i.val, by rw [size1034]; exact i.isLt⟩
  change (entry1034 i).check = true at h
  rcases fields1034 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1035 : OriginalRow227TriangleForward1035.entries.size = 32 := rfl

def entry1035 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1035.entries[i.val]'(by rw [size1035]; exact i.isLt)

theorem fields1035 (i : Fin 32) :
    (entry1035 i).IA = shift ∧ (entry1035 i).ID = S (298 + i.val + 1) ∧
      (entry1035 i).IC = S 75 ∧ (entry1035 i).Inext = T 74 (298 + i.val + 1) ∧
      (entry1035 i).Icur = T 74 (298 + i.val) ∧
      (entry1035 i).output = T 75 (298 + i.val) ∧
      (entry1035 i).charge = charge 74 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1051_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1035 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 75) (T 74 (298 + i.val + 1))
      (T 74 (298 + i.val)) (T 75 (298 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1035.entries OriginalRow227TriangleForward1035.checked
    ⟨i.val, by rw [size1035]; exact i.isLt⟩
  change (entry1035 i).check = true at h
  rcases fields1035 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1036 : OriginalRow227TriangleForward1036.entries.size = 32 := rfl

def entry1036 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1036.entries[i.val]'(by rw [size1036]; exact i.isLt)

theorem fields1036 (i : Fin 32) :
    (entry1036 i).IA = shift ∧ (entry1036 i).ID = S (330 + i.val + 1) ∧
      (entry1036 i).IC = S 75 ∧ (entry1036 i).Inext = T 74 (330 + i.val + 1) ∧
      (entry1036 i).Icur = T 74 (330 + i.val) ∧
      (entry1036 i).output = T 75 (330 + i.val) ∧
      (entry1036 i).charge = charge 74 (330 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1052_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1036 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (330 + i.val)) shift
      (S (330 + i.val + 1)) (S 75) (T 74 (330 + i.val + 1))
      (T 74 (330 + i.val)) (T 75 (330 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1036.entries OriginalRow227TriangleForward1036.checked
    ⟨i.val, by rw [size1036]; exact i.isLt⟩
  change (entry1036 i).check = true at h
  rcases fields1036 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1037 : OriginalRow227TriangleForward1037.entries.size = 32 := rfl

def entry1037 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1037.entries[i.val]'(by rw [size1037]; exact i.isLt)

theorem fields1037 (i : Fin 32) :
    (entry1037 i).IA = shift ∧ (entry1037 i).ID = S (362 + i.val + 1) ∧
      (entry1037 i).IC = S 75 ∧ (entry1037 i).Inext = T 74 (362 + i.val + 1) ∧
      (entry1037 i).Icur = T 74 (362 + i.val) ∧
      (entry1037 i).output = T 75 (362 + i.val) ∧
      (entry1037 i).charge = charge 74 (362 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1053_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1037 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (362 + i.val)) shift
      (S (362 + i.val + 1)) (S 75) (T 74 (362 + i.val + 1))
      (T 74 (362 + i.val)) (T 75 (362 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1037.entries OriginalRow227TriangleForward1037.checked
    ⟨i.val, by rw [size1037]; exact i.isLt⟩
  change (entry1037 i).check = true at h
  rcases fields1037 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1038 : OriginalRow227TriangleForward1038.entries.size = 32 := rfl

def entry1038 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1038.entries[i.val]'(by rw [size1038]; exact i.isLt)

theorem fields1038 (i : Fin 32) :
    (entry1038 i).IA = shift ∧ (entry1038 i).ID = S (394 + i.val + 1) ∧
      (entry1038 i).IC = S 75 ∧ (entry1038 i).Inext = T 74 (394 + i.val + 1) ∧
      (entry1038 i).Icur = T 74 (394 + i.val) ∧
      (entry1038 i).output = T 75 (394 + i.val) ∧
      (entry1038 i).charge = charge 74 (394 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1054_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1038 (i : Fin 32) :
    forwardStepOK (-768) (charge 74 (394 + i.val)) shift
      (S (394 + i.val + 1)) (S 75) (T 74 (394 + i.val + 1))
      (T 74 (394 + i.val)) (T 75 (394 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1038.entries OriginalRow227TriangleForward1038.checked
    ⟨i.val, by rw [size1038]; exact i.isLt⟩
  change (entry1038 i).check = true at h
  rcases fields1038 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1039 : OriginalRow227TriangleForward1039.entries.size = 1 := rfl

def entry1039 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1039.entries[i.val]'(by rw [size1039]; exact i.isLt)

theorem fields1039 (i : Fin 1) :
    (entry1039 i).IA = shift ∧ (entry1039 i).ID = S (426 + i.val + 1) ∧
      (entry1039 i).IC = S 75 ∧ (entry1039 i).Inext = T 74 (426 + i.val + 1) ∧
      (entry1039 i).Icur = T 74 (426 + i.val) ∧
      (entry1039 i).output = T 75 (426 + i.val) ∧
      (entry1039 i).charge = charge 74 (426 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root75).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow075.block1055_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1039 (i : Fin 1) :
    forwardStepOK (-768) (charge 74 (426 + i.val)) shift
      (S (426 + i.val + 1)) (S 75) (T 74 (426 + i.val + 1))
      (T 74 (426 + i.val)) (T 75 (426 + i.val))
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1039.entries OriginalRow227TriangleForward1039.checked
    ⟨i.val, by rw [size1039]; exact i.isLt⟩
  change (entry1039 i).check = true at h
  rcases fields1039 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 74 ≤ d) (hhi : d < 427) :
    forwardStepOK (-768) (charge 74 d) shift (S (d + 1)) (S 75)
      (T 74 (d + 1)) (T 74 d) (T 75 d)
      (OriginalRow227Roots.root_pos 75 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 74 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h170 : d < 170
    ·
      by_cases h106 : d < 106
      ·
        have hi : d - 74 < 32 := by omega
        have heq : 74 + (d - 74) = d := by omega
        simpa only [heq] using step1028 ⟨d - 74, hi⟩
      ·
        by_cases h138 : d < 138
        ·
          have hi : d - 106 < 32 := by omega
          have heq : 106 + (d - 106) = d := by omega
          simpa only [heq] using step1029 ⟨d - 106, hi⟩
        ·
          have hi : d - 138 < 32 := by omega
          have heq : 138 + (d - 138) = d := by omega
          simpa only [heq] using step1030 ⟨d - 138, hi⟩
    ·
      by_cases h202 : d < 202
      ·
        have hi : d - 170 < 32 := by omega
        have heq : 170 + (d - 170) = d := by omega
        simpa only [heq] using step1031 ⟨d - 170, hi⟩
      ·
        by_cases h234 : d < 234
        ·
          have hi : d - 202 < 32 := by omega
          have heq : 202 + (d - 202) = d := by omega
          simpa only [heq] using step1032 ⟨d - 202, hi⟩
        ·
          have hi : d - 234 < 32 := by omega
          have heq : 234 + (d - 234) = d := by omega
          simpa only [heq] using step1033 ⟨d - 234, hi⟩
  ·
    by_cases h362 : d < 362
    ·
      by_cases h298 : d < 298
      ·
        have hi : d - 266 < 32 := by omega
        have heq : 266 + (d - 266) = d := by omega
        simpa only [heq] using step1034 ⟨d - 266, hi⟩
      ·
        by_cases h330 : d < 330
        ·
          have hi : d - 298 < 32 := by omega
          have heq : 298 + (d - 298) = d := by omega
          simpa only [heq] using step1035 ⟨d - 298, hi⟩
        ·
          have hi : d - 330 < 32 := by omega
          have heq : 330 + (d - 330) = d := by omega
          simpa only [heq] using step1036 ⟨d - 330, hi⟩
    ·
      by_cases h394 : d < 394
      ·
        have hi : d - 362 < 32 := by omega
        have heq : 362 + (d - 362) = d := by omega
        simpa only [heq] using step1037 ⟨d - 362, hi⟩
      ·
        by_cases h426 : d < 426
        ·
          have hi : d - 394 < 32 := by omega
          have heq : 394 + (d - 394) = d := by omega
          simpa only [heq] using step1038 ⟨d - 394, hi⟩
        ·
          have hi : d - 426 < 1 := by omega
          have heq : 426 + (d - 426) = d := by omega
          simpa only [heq] using step1039 ⟨d - 426, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1028,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1028,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1029,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1029,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1030,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1030,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1031,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1031,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1032,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1032,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1033,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1033,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1034,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1034,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1035,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1035,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1036,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1036,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1037,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1037,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1038,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1038,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.fields1039,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.step1039,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow075
