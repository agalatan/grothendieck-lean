import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow072
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073
import Grothe.UpperChaos.OriginalRow227TriangleForward1004
import Grothe.UpperChaos.OriginalRow227TriangleForward1005
import Grothe.UpperChaos.OriginalRow227TriangleForward1006
import Grothe.UpperChaos.OriginalRow227TriangleForward1007
import Grothe.UpperChaos.OriginalRow227TriangleForward1008
import Grothe.UpperChaos.OriginalRow227TriangleForward1009
import Grothe.UpperChaos.OriginalRow227TriangleForward1010
import Grothe.UpperChaos.OriginalRow227TriangleForward1011
import Grothe.UpperChaos.OriginalRow227TriangleForward1012
import Grothe.UpperChaos.OriginalRow227TriangleForward1013
import Grothe.UpperChaos.OriginalRow227TriangleForward1014
import Grothe.UpperChaos.OriginalRow227TriangleForward1015

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1004 : OriginalRow227TriangleForward1004.entries.size = 32 := rfl

def entry1004 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1004.entries[i.val]'(by rw [size1004]; exact i.isLt)

theorem fields1004 (i : Fin 32) :
    (entry1004 i).IA = shift ∧ (entry1004 i).ID = S (72 + i.val + 1) ∧
      (entry1004 i).IC = S 73 ∧ (entry1004 i).Inext = T 72 (72 + i.val + 1) ∧
      (entry1004 i).Icur = T 72 (72 + i.val) ∧
      (entry1004 i).output = T 73 (72 + i.val) ∧
      (entry1004 i).charge = charge 72 (72 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1004 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (72 + i.val)) shift
      (S (72 + i.val + 1)) (S 73) (T 72 (72 + i.val + 1))
      (T 72 (72 + i.val)) (T 73 (72 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1004.entries OriginalRow227TriangleForward1004.checked
    ⟨i.val, by rw [size1004]; exact i.isLt⟩
  change (entry1004 i).check = true at h
  rcases fields1004 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1005 : OriginalRow227TriangleForward1005.entries.size = 32 := rfl

def entry1005 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1005.entries[i.val]'(by rw [size1005]; exact i.isLt)

theorem fields1005 (i : Fin 32) :
    (entry1005 i).IA = shift ∧ (entry1005 i).ID = S (104 + i.val + 1) ∧
      (entry1005 i).IC = S 73 ∧ (entry1005 i).Inext = T 72 (104 + i.val + 1) ∧
      (entry1005 i).Icur = T 72 (104 + i.val) ∧
      (entry1005 i).output = T 73 (104 + i.val) ∧
      (entry1005 i).charge = charge 72 (104 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1005 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (104 + i.val)) shift
      (S (104 + i.val + 1)) (S 73) (T 72 (104 + i.val + 1))
      (T 72 (104 + i.val)) (T 73 (104 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1005.entries OriginalRow227TriangleForward1005.checked
    ⟨i.val, by rw [size1005]; exact i.isLt⟩
  change (entry1005 i).check = true at h
  rcases fields1005 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1006 : OriginalRow227TriangleForward1006.entries.size = 32 := rfl

def entry1006 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1006.entries[i.val]'(by rw [size1006]; exact i.isLt)

theorem fields1006 (i : Fin 32) :
    (entry1006 i).IA = shift ∧ (entry1006 i).ID = S (136 + i.val + 1) ∧
      (entry1006 i).IC = S 73 ∧ (entry1006 i).Inext = T 72 (136 + i.val + 1) ∧
      (entry1006 i).Icur = T 72 (136 + i.val) ∧
      (entry1006 i).output = T 73 (136 + i.val) ∧
      (entry1006 i).charge = charge 72 (136 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1006 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (136 + i.val)) shift
      (S (136 + i.val + 1)) (S 73) (T 72 (136 + i.val + 1))
      (T 72 (136 + i.val)) (T 73 (136 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1006.entries OriginalRow227TriangleForward1006.checked
    ⟨i.val, by rw [size1006]; exact i.isLt⟩
  change (entry1006 i).check = true at h
  rcases fields1006 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1007 : OriginalRow227TriangleForward1007.entries.size = 32 := rfl

def entry1007 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1007.entries[i.val]'(by rw [size1007]; exact i.isLt)

theorem fields1007 (i : Fin 32) :
    (entry1007 i).IA = shift ∧ (entry1007 i).ID = S (168 + i.val + 1) ∧
      (entry1007 i).IC = S 73 ∧ (entry1007 i).Inext = T 72 (168 + i.val + 1) ∧
      (entry1007 i).Icur = T 72 (168 + i.val) ∧
      (entry1007 i).output = T 73 (168 + i.val) ∧
      (entry1007 i).charge = charge 72 (168 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1011_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1007 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (168 + i.val)) shift
      (S (168 + i.val + 1)) (S 73) (T 72 (168 + i.val + 1))
      (T 72 (168 + i.val)) (T 73 (168 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1007.entries OriginalRow227TriangleForward1007.checked
    ⟨i.val, by rw [size1007]; exact i.isLt⟩
  change (entry1007 i).check = true at h
  rcases fields1007 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1008 : OriginalRow227TriangleForward1008.entries.size = 32 := rfl

def entry1008 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1008.entries[i.val]'(by rw [size1008]; exact i.isLt)

theorem fields1008 (i : Fin 32) :
    (entry1008 i).IA = shift ∧ (entry1008 i).ID = S (200 + i.val + 1) ∧
      (entry1008 i).IC = S 73 ∧ (entry1008 i).Inext = T 72 (200 + i.val + 1) ∧
      (entry1008 i).Icur = T 72 (200 + i.val) ∧
      (entry1008 i).output = T 73 (200 + i.val) ∧
      (entry1008 i).charge = charge 72 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1008 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 73) (T 72 (200 + i.val + 1))
      (T 72 (200 + i.val)) (T 73 (200 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1008.entries OriginalRow227TriangleForward1008.checked
    ⟨i.val, by rw [size1008]; exact i.isLt⟩
  change (entry1008 i).check = true at h
  rcases fields1008 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1009 : OriginalRow227TriangleForward1009.entries.size = 32 := rfl

def entry1009 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1009.entries[i.val]'(by rw [size1009]; exact i.isLt)

theorem fields1009 (i : Fin 32) :
    (entry1009 i).IA = shift ∧ (entry1009 i).ID = S (232 + i.val + 1) ∧
      (entry1009 i).IC = S 73 ∧ (entry1009 i).Inext = T 72 (232 + i.val + 1) ∧
      (entry1009 i).Icur = T 72 (232 + i.val) ∧
      (entry1009 i).output = T 73 (232 + i.val) ∧
      (entry1009 i).charge = charge 72 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1009 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 73) (T 72 (232 + i.val + 1))
      (T 72 (232 + i.val)) (T 73 (232 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1009.entries OriginalRow227TriangleForward1009.checked
    ⟨i.val, by rw [size1009]; exact i.isLt⟩
  change (entry1009 i).check = true at h
  rcases fields1009 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1010 : OriginalRow227TriangleForward1010.entries.size = 32 := rfl

def entry1010 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1010.entries[i.val]'(by rw [size1010]; exact i.isLt)

theorem fields1010 (i : Fin 32) :
    (entry1010 i).IA = shift ∧ (entry1010 i).ID = S (264 + i.val + 1) ∧
      (entry1010 i).IC = S 73 ∧ (entry1010 i).Inext = T 72 (264 + i.val + 1) ∧
      (entry1010 i).Icur = T 72 (264 + i.val) ∧
      (entry1010 i).output = T 73 (264 + i.val) ∧
      (entry1010 i).charge = charge 72 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1010 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 73) (T 72 (264 + i.val + 1))
      (T 72 (264 + i.val)) (T 73 (264 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1010.entries OriginalRow227TriangleForward1010.checked
    ⟨i.val, by rw [size1010]; exact i.isLt⟩
  change (entry1010 i).check = true at h
  rcases fields1010 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1011 : OriginalRow227TriangleForward1011.entries.size = 32 := rfl

def entry1011 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1011.entries[i.val]'(by rw [size1011]; exact i.isLt)

theorem fields1011 (i : Fin 32) :
    (entry1011 i).IA = shift ∧ (entry1011 i).ID = S (296 + i.val + 1) ∧
      (entry1011 i).IC = S 73 ∧ (entry1011 i).Inext = T 72 (296 + i.val + 1) ∧
      (entry1011 i).Icur = T 72 (296 + i.val) ∧
      (entry1011 i).output = T 73 (296 + i.val) ∧
      (entry1011 i).charge = charge 72 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1015_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1011 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 73) (T 72 (296 + i.val + 1))
      (T 72 (296 + i.val)) (T 73 (296 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1011.entries OriginalRow227TriangleForward1011.checked
    ⟨i.val, by rw [size1011]; exact i.isLt⟩
  change (entry1011 i).check = true at h
  rcases fields1011 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1012 : OriginalRow227TriangleForward1012.entries.size = 32 := rfl

def entry1012 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1012.entries[i.val]'(by rw [size1012]; exact i.isLt)

theorem fields1012 (i : Fin 32) :
    (entry1012 i).IA = shift ∧ (entry1012 i).ID = S (328 + i.val + 1) ∧
      (entry1012 i).IC = S 73 ∧ (entry1012 i).Inext = T 72 (328 + i.val + 1) ∧
      (entry1012 i).Icur = T 72 (328 + i.val) ∧
      (entry1012 i).output = T 73 (328 + i.val) ∧
      (entry1012 i).charge = charge 72 (328 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1016_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1012 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (328 + i.val)) shift
      (S (328 + i.val + 1)) (S 73) (T 72 (328 + i.val + 1))
      (T 72 (328 + i.val)) (T 73 (328 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1012.entries OriginalRow227TriangleForward1012.checked
    ⟨i.val, by rw [size1012]; exact i.isLt⟩
  change (entry1012 i).check = true at h
  rcases fields1012 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1013 : OriginalRow227TriangleForward1013.entries.size = 32 := rfl

def entry1013 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1013.entries[i.val]'(by rw [size1013]; exact i.isLt)

theorem fields1013 (i : Fin 32) :
    (entry1013 i).IA = shift ∧ (entry1013 i).ID = S (360 + i.val + 1) ∧
      (entry1013 i).IC = S 73 ∧ (entry1013 i).Inext = T 72 (360 + i.val + 1) ∧
      (entry1013 i).Icur = T 72 (360 + i.val) ∧
      (entry1013 i).output = T 73 (360 + i.val) ∧
      (entry1013 i).charge = charge 72 (360 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1017_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1013 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (360 + i.val)) shift
      (S (360 + i.val + 1)) (S 73) (T 72 (360 + i.val + 1))
      (T 72 (360 + i.val)) (T 73 (360 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1013.entries OriginalRow227TriangleForward1013.checked
    ⟨i.val, by rw [size1013]; exact i.isLt⟩
  change (entry1013 i).check = true at h
  rcases fields1013 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1014 : OriginalRow227TriangleForward1014.entries.size = 32 := rfl

def entry1014 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1014.entries[i.val]'(by rw [size1014]; exact i.isLt)

theorem fields1014 (i : Fin 32) :
    (entry1014 i).IA = shift ∧ (entry1014 i).ID = S (392 + i.val + 1) ∧
      (entry1014 i).IC = S 73 ∧ (entry1014 i).Inext = T 72 (392 + i.val + 1) ∧
      (entry1014 i).Icur = T 72 (392 + i.val) ∧
      (entry1014 i).output = T 73 (392 + i.val) ∧
      (entry1014 i).charge = charge 72 (392 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1018_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1014 (i : Fin 32) :
    forwardStepOK (-768) (charge 72 (392 + i.val)) shift
      (S (392 + i.val + 1)) (S 73) (T 72 (392 + i.val + 1))
      (T 72 (392 + i.val)) (T 73 (392 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1014.entries OriginalRow227TriangleForward1014.checked
    ⟨i.val, by rw [size1014]; exact i.isLt⟩
  change (entry1014 i).check = true at h
  rcases fields1014 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1015 : OriginalRow227TriangleForward1015.entries.size = 5 := rfl

def entry1015 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1015.entries[i.val]'(by rw [size1015]; exact i.isLt)

theorem fields1015 (i : Fin 5) :
    (entry1015 i).IA = shift ∧ (entry1015 i).ID = S (424 + i.val + 1) ∧
      (entry1015 i).IC = S 73 ∧ (entry1015 i).Inext = T 72 (424 + i.val + 1) ∧
      (entry1015 i).Icur = T 72 (424 + i.val) ∧
      (entry1015 i).output = T 73 (424 + i.val) ∧
      (entry1015 i).charge = charge 72 (424 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root73).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow072.block1019_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1015 (i : Fin 5) :
    forwardStepOK (-768) (charge 72 (424 + i.val)) shift
      (S (424 + i.val + 1)) (S 73) (T 72 (424 + i.val + 1))
      (T 72 (424 + i.val)) (T 73 (424 + i.val))
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1015.entries OriginalRow227TriangleForward1015.checked
    ⟨i.val, by rw [size1015]; exact i.isLt⟩
  change (entry1015 i).check = true at h
  rcases fields1015 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 72 ≤ d) (hhi : d < 429) :
    forwardStepOK (-768) (charge 72 d) shift (S (d + 1)) (S 73)
      (T 72 (d + 1)) (T 72 d) (T 73 d)
      (OriginalRow227Roots.root_pos 73 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 72 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h168 : d < 168
    ·
      by_cases h104 : d < 104
      ·
        have hi : d - 72 < 32 := by omega
        have heq : 72 + (d - 72) = d := by omega
        simpa only [heq] using step1004 ⟨d - 72, hi⟩
      ·
        by_cases h136 : d < 136
        ·
          have hi : d - 104 < 32 := by omega
          have heq : 104 + (d - 104) = d := by omega
          simpa only [heq] using step1005 ⟨d - 104, hi⟩
        ·
          have hi : d - 136 < 32 := by omega
          have heq : 136 + (d - 136) = d := by omega
          simpa only [heq] using step1006 ⟨d - 136, hi⟩
    ·
      by_cases h200 : d < 200
      ·
        have hi : d - 168 < 32 := by omega
        have heq : 168 + (d - 168) = d := by omega
        simpa only [heq] using step1007 ⟨d - 168, hi⟩
      ·
        by_cases h232 : d < 232
        ·
          have hi : d - 200 < 32 := by omega
          have heq : 200 + (d - 200) = d := by omega
          simpa only [heq] using step1008 ⟨d - 200, hi⟩
        ·
          have hi : d - 232 < 32 := by omega
          have heq : 232 + (d - 232) = d := by omega
          simpa only [heq] using step1009 ⟨d - 232, hi⟩
  ·
    by_cases h360 : d < 360
    ·
      by_cases h296 : d < 296
      ·
        have hi : d - 264 < 32 := by omega
        have heq : 264 + (d - 264) = d := by omega
        simpa only [heq] using step1010 ⟨d - 264, hi⟩
      ·
        by_cases h328 : d < 328
        ·
          have hi : d - 296 < 32 := by omega
          have heq : 296 + (d - 296) = d := by omega
          simpa only [heq] using step1011 ⟨d - 296, hi⟩
        ·
          have hi : d - 328 < 32 := by omega
          have heq : 328 + (d - 328) = d := by omega
          simpa only [heq] using step1012 ⟨d - 328, hi⟩
    ·
      by_cases h392 : d < 392
      ·
        have hi : d - 360 < 32 := by omega
        have heq : 360 + (d - 360) = d := by omega
        simpa only [heq] using step1013 ⟨d - 360, hi⟩
      ·
        by_cases h424 : d < 424
        ·
          have hi : d - 392 < 32 := by omega
          have heq : 392 + (d - 392) = d := by omega
          simpa only [heq] using step1014 ⟨d - 392, hi⟩
        ·
          have hi : d - 424 < 5 := by omega
          have heq : 424 + (d - 424) = d := by omega
          simpa only [heq] using step1015 ⟨d - 424, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1004,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1004,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1005,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1005,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1006,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1006,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1007,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1007,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1008,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1008,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1009,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1009,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1010,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1010,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1011,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1011,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1012,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1012,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1013,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1013,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1014,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1014,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.fields1015,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.step1015,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow073
