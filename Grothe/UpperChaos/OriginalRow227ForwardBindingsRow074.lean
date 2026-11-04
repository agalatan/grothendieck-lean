import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow073
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow074
import Grothe.UpperChaos.OriginalRow227TriangleForward1016
import Grothe.UpperChaos.OriginalRow227TriangleForward1017
import Grothe.UpperChaos.OriginalRow227TriangleForward1018
import Grothe.UpperChaos.OriginalRow227TriangleForward1019
import Grothe.UpperChaos.OriginalRow227TriangleForward1020
import Grothe.UpperChaos.OriginalRow227TriangleForward1021
import Grothe.UpperChaos.OriginalRow227TriangleForward1022
import Grothe.UpperChaos.OriginalRow227TriangleForward1023
import Grothe.UpperChaos.OriginalRow227TriangleForward1024
import Grothe.UpperChaos.OriginalRow227TriangleForward1025
import Grothe.UpperChaos.OriginalRow227TriangleForward1026
import Grothe.UpperChaos.OriginalRow227TriangleForward1027

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1016 : OriginalRow227TriangleForward1016.entries.size = 32 := rfl

def entry1016 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1016.entries[i.val]'(by rw [size1016]; exact i.isLt)

theorem fields1016 (i : Fin 32) :
    (entry1016 i).IA = shift ∧ (entry1016 i).ID = S (73 + i.val + 1) ∧
      (entry1016 i).IC = S 74 ∧ (entry1016 i).Inext = T 73 (73 + i.val + 1) ∧
      (entry1016 i).Icur = T 73 (73 + i.val) ∧
      (entry1016 i).output = T 74 (73 + i.val) ∧
      (entry1016 i).charge = charge 73 (73 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1020_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1032_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1016 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (73 + i.val)) shift
      (S (73 + i.val + 1)) (S 74) (T 73 (73 + i.val + 1))
      (T 73 (73 + i.val)) (T 74 (73 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1016.entries OriginalRow227TriangleForward1016.checked
    ⟨i.val, by rw [size1016]; exact i.isLt⟩
  change (entry1016 i).check = true at h
  rcases fields1016 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1017 : OriginalRow227TriangleForward1017.entries.size = 32 := rfl

def entry1017 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1017.entries[i.val]'(by rw [size1017]; exact i.isLt)

theorem fields1017 (i : Fin 32) :
    (entry1017 i).IA = shift ∧ (entry1017 i).ID = S (105 + i.val + 1) ∧
      (entry1017 i).IC = S 74 ∧ (entry1017 i).Inext = T 73 (105 + i.val + 1) ∧
      (entry1017 i).Icur = T 73 (105 + i.val) ∧
      (entry1017 i).output = T 74 (105 + i.val) ∧
      (entry1017 i).charge = charge 73 (105 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1021_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1033_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1017 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (105 + i.val)) shift
      (S (105 + i.val + 1)) (S 74) (T 73 (105 + i.val + 1))
      (T 73 (105 + i.val)) (T 74 (105 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1017.entries OriginalRow227TriangleForward1017.checked
    ⟨i.val, by rw [size1017]; exact i.isLt⟩
  change (entry1017 i).check = true at h
  rcases fields1017 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1018 : OriginalRow227TriangleForward1018.entries.size = 32 := rfl

def entry1018 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1018.entries[i.val]'(by rw [size1018]; exact i.isLt)

theorem fields1018 (i : Fin 32) :
    (entry1018 i).IA = shift ∧ (entry1018 i).ID = S (137 + i.val + 1) ∧
      (entry1018 i).IC = S 74 ∧ (entry1018 i).Inext = T 73 (137 + i.val + 1) ∧
      (entry1018 i).Icur = T 73 (137 + i.val) ∧
      (entry1018 i).output = T 74 (137 + i.val) ∧
      (entry1018 i).charge = charge 73 (137 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1022_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1034_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1018 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (137 + i.val)) shift
      (S (137 + i.val + 1)) (S 74) (T 73 (137 + i.val + 1))
      (T 73 (137 + i.val)) (T 74 (137 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1018.entries OriginalRow227TriangleForward1018.checked
    ⟨i.val, by rw [size1018]; exact i.isLt⟩
  change (entry1018 i).check = true at h
  rcases fields1018 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1019 : OriginalRow227TriangleForward1019.entries.size = 32 := rfl

def entry1019 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1019.entries[i.val]'(by rw [size1019]; exact i.isLt)

theorem fields1019 (i : Fin 32) :
    (entry1019 i).IA = shift ∧ (entry1019 i).ID = S (169 + i.val + 1) ∧
      (entry1019 i).IC = S 74 ∧ (entry1019 i).Inext = T 73 (169 + i.val + 1) ∧
      (entry1019 i).Icur = T 73 (169 + i.val) ∧
      (entry1019 i).output = T 74 (169 + i.val) ∧
      (entry1019 i).charge = charge 73 (169 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1023_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1035_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1019 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (169 + i.val)) shift
      (S (169 + i.val + 1)) (S 74) (T 73 (169 + i.val + 1))
      (T 73 (169 + i.val)) (T 74 (169 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1019.entries OriginalRow227TriangleForward1019.checked
    ⟨i.val, by rw [size1019]; exact i.isLt⟩
  change (entry1019 i).check = true at h
  rcases fields1019 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1020 : OriginalRow227TriangleForward1020.entries.size = 32 := rfl

def entry1020 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1020.entries[i.val]'(by rw [size1020]; exact i.isLt)

theorem fields1020 (i : Fin 32) :
    (entry1020 i).IA = shift ∧ (entry1020 i).ID = S (201 + i.val + 1) ∧
      (entry1020 i).IC = S 74 ∧ (entry1020 i).Inext = T 73 (201 + i.val + 1) ∧
      (entry1020 i).Icur = T 73 (201 + i.val) ∧
      (entry1020 i).output = T 74 (201 + i.val) ∧
      (entry1020 i).charge = charge 73 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1024_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1036_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1020 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 74) (T 73 (201 + i.val + 1))
      (T 73 (201 + i.val)) (T 74 (201 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1020.entries OriginalRow227TriangleForward1020.checked
    ⟨i.val, by rw [size1020]; exact i.isLt⟩
  change (entry1020 i).check = true at h
  rcases fields1020 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1021 : OriginalRow227TriangleForward1021.entries.size = 32 := rfl

def entry1021 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1021.entries[i.val]'(by rw [size1021]; exact i.isLt)

theorem fields1021 (i : Fin 32) :
    (entry1021 i).IA = shift ∧ (entry1021 i).ID = S (233 + i.val + 1) ∧
      (entry1021 i).IC = S 74 ∧ (entry1021 i).Inext = T 73 (233 + i.val + 1) ∧
      (entry1021 i).Icur = T 73 (233 + i.val) ∧
      (entry1021 i).output = T 74 (233 + i.val) ∧
      (entry1021 i).charge = charge 73 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1025_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1037_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1021 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 74) (T 73 (233 + i.val + 1))
      (T 73 (233 + i.val)) (T 74 (233 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1021.entries OriginalRow227TriangleForward1021.checked
    ⟨i.val, by rw [size1021]; exact i.isLt⟩
  change (entry1021 i).check = true at h
  rcases fields1021 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1022 : OriginalRow227TriangleForward1022.entries.size = 32 := rfl

def entry1022 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1022.entries[i.val]'(by rw [size1022]; exact i.isLt)

theorem fields1022 (i : Fin 32) :
    (entry1022 i).IA = shift ∧ (entry1022 i).ID = S (265 + i.val + 1) ∧
      (entry1022 i).IC = S 74 ∧ (entry1022 i).Inext = T 73 (265 + i.val + 1) ∧
      (entry1022 i).Icur = T 73 (265 + i.val) ∧
      (entry1022 i).output = T 74 (265 + i.val) ∧
      (entry1022 i).charge = charge 73 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1026_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1038_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1022 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 74) (T 73 (265 + i.val + 1))
      (T 73 (265 + i.val)) (T 74 (265 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1022.entries OriginalRow227TriangleForward1022.checked
    ⟨i.val, by rw [size1022]; exact i.isLt⟩
  change (entry1022 i).check = true at h
  rcases fields1022 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1023 : OriginalRow227TriangleForward1023.entries.size = 32 := rfl

def entry1023 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1023.entries[i.val]'(by rw [size1023]; exact i.isLt)

theorem fields1023 (i : Fin 32) :
    (entry1023 i).IA = shift ∧ (entry1023 i).ID = S (297 + i.val + 1) ∧
      (entry1023 i).IC = S 74 ∧ (entry1023 i).Inext = T 73 (297 + i.val + 1) ∧
      (entry1023 i).Icur = T 73 (297 + i.val) ∧
      (entry1023 i).output = T 74 (297 + i.val) ∧
      (entry1023 i).charge = charge 73 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1027_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1039_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1023 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 74) (T 73 (297 + i.val + 1))
      (T 73 (297 + i.val)) (T 74 (297 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1023.entries OriginalRow227TriangleForward1023.checked
    ⟨i.val, by rw [size1023]; exact i.isLt⟩
  change (entry1023 i).check = true at h
  rcases fields1023 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1024 : OriginalRow227TriangleForward1024.entries.size = 32 := rfl

def entry1024 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1024.entries[i.val]'(by rw [size1024]; exact i.isLt)

theorem fields1024 (i : Fin 32) :
    (entry1024 i).IA = shift ∧ (entry1024 i).ID = S (329 + i.val + 1) ∧
      (entry1024 i).IC = S 74 ∧ (entry1024 i).Inext = T 73 (329 + i.val + 1) ∧
      (entry1024 i).Icur = T 73 (329 + i.val) ∧
      (entry1024 i).output = T 74 (329 + i.val) ∧
      (entry1024 i).charge = charge 73 (329 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1028_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1040_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1024 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (329 + i.val)) shift
      (S (329 + i.val + 1)) (S 74) (T 73 (329 + i.val + 1))
      (T 73 (329 + i.val)) (T 74 (329 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1024.entries OriginalRow227TriangleForward1024.checked
    ⟨i.val, by rw [size1024]; exact i.isLt⟩
  change (entry1024 i).check = true at h
  rcases fields1024 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1025 : OriginalRow227TriangleForward1025.entries.size = 32 := rfl

def entry1025 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1025.entries[i.val]'(by rw [size1025]; exact i.isLt)

theorem fields1025 (i : Fin 32) :
    (entry1025 i).IA = shift ∧ (entry1025 i).ID = S (361 + i.val + 1) ∧
      (entry1025 i).IC = S 74 ∧ (entry1025 i).Inext = T 73 (361 + i.val + 1) ∧
      (entry1025 i).Icur = T 73 (361 + i.val) ∧
      (entry1025 i).output = T 74 (361 + i.val) ∧
      (entry1025 i).charge = charge 73 (361 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1029_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1041_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1025 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (361 + i.val)) shift
      (S (361 + i.val + 1)) (S 74) (T 73 (361 + i.val + 1))
      (T 73 (361 + i.val)) (T 74 (361 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1025.entries OriginalRow227TriangleForward1025.checked
    ⟨i.val, by rw [size1025]; exact i.isLt⟩
  change (entry1025 i).check = true at h
  rcases fields1025 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1026 : OriginalRow227TriangleForward1026.entries.size = 32 := rfl

def entry1026 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1026.entries[i.val]'(by rw [size1026]; exact i.isLt)

theorem fields1026 (i : Fin 32) :
    (entry1026 i).IA = shift ∧ (entry1026 i).ID = S (393 + i.val + 1) ∧
      (entry1026 i).IC = S 74 ∧ (entry1026 i).Inext = T 73 (393 + i.val + 1) ∧
      (entry1026 i).Icur = T 73 (393 + i.val) ∧
      (entry1026 i).output = T 74 (393 + i.val) ∧
      (entry1026 i).charge = charge 73 (393 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1030_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1042_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1026 (i : Fin 32) :
    forwardStepOK (-768) (charge 73 (393 + i.val)) shift
      (S (393 + i.val + 1)) (S 74) (T 73 (393 + i.val + 1))
      (T 73 (393 + i.val)) (T 74 (393 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1026.entries OriginalRow227TriangleForward1026.checked
    ⟨i.val, by rw [size1026]; exact i.isLt⟩
  change (entry1026 i).check = true at h
  rcases fields1026 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1027 : OriginalRow227TriangleForward1027.entries.size = 3 := rfl

def entry1027 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1027.entries[i.val]'(by rw [size1027]; exact i.isLt)

theorem fields1027 (i : Fin 3) :
    (entry1027 i).IA = shift ∧ (entry1027 i).ID = S (425 + i.val + 1) ∧
      (entry1027 i).IC = S 74 ∧ (entry1027 i).Inext = T 73 (425 + i.val + 1) ∧
      (entry1027 i).Icur = T 73 (425 + i.val) ∧
      (entry1027 i).output = T 74 (425 + i.val) ∧
      (entry1027 i).charge = charge 73 (425 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root74).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow073.block1031_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow074.block1043_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1027 (i : Fin 3) :
    forwardStepOK (-768) (charge 73 (425 + i.val)) shift
      (S (425 + i.val + 1)) (S 74) (T 73 (425 + i.val + 1))
      (T 73 (425 + i.val)) (T 74 (425 + i.val))
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1027.entries OriginalRow227TriangleForward1027.checked
    ⟨i.val, by rw [size1027]; exact i.isLt⟩
  change (entry1027 i).check = true at h
  rcases fields1027 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 73 ≤ d) (hhi : d < 428) :
    forwardStepOK (-768) (charge 73 d) shift (S (d + 1)) (S 74)
      (T 73 (d + 1)) (T 73 d) (T 74 d)
      (OriginalRow227Roots.root_pos 74 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 73 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h169 : d < 169
    ·
      by_cases h105 : d < 105
      ·
        have hi : d - 73 < 32 := by omega
        have heq : 73 + (d - 73) = d := by omega
        simpa only [heq] using step1016 ⟨d - 73, hi⟩
      ·
        by_cases h137 : d < 137
        ·
          have hi : d - 105 < 32 := by omega
          have heq : 105 + (d - 105) = d := by omega
          simpa only [heq] using step1017 ⟨d - 105, hi⟩
        ·
          have hi : d - 137 < 32 := by omega
          have heq : 137 + (d - 137) = d := by omega
          simpa only [heq] using step1018 ⟨d - 137, hi⟩
    ·
      by_cases h201 : d < 201
      ·
        have hi : d - 169 < 32 := by omega
        have heq : 169 + (d - 169) = d := by omega
        simpa only [heq] using step1019 ⟨d - 169, hi⟩
      ·
        by_cases h233 : d < 233
        ·
          have hi : d - 201 < 32 := by omega
          have heq : 201 + (d - 201) = d := by omega
          simpa only [heq] using step1020 ⟨d - 201, hi⟩
        ·
          have hi : d - 233 < 32 := by omega
          have heq : 233 + (d - 233) = d := by omega
          simpa only [heq] using step1021 ⟨d - 233, hi⟩
  ·
    by_cases h361 : d < 361
    ·
      by_cases h297 : d < 297
      ·
        have hi : d - 265 < 32 := by omega
        have heq : 265 + (d - 265) = d := by omega
        simpa only [heq] using step1022 ⟨d - 265, hi⟩
      ·
        by_cases h329 : d < 329
        ·
          have hi : d - 297 < 32 := by omega
          have heq : 297 + (d - 297) = d := by omega
          simpa only [heq] using step1023 ⟨d - 297, hi⟩
        ·
          have hi : d - 329 < 32 := by omega
          have heq : 329 + (d - 329) = d := by omega
          simpa only [heq] using step1024 ⟨d - 329, hi⟩
    ·
      by_cases h393 : d < 393
      ·
        have hi : d - 361 < 32 := by omega
        have heq : 361 + (d - 361) = d := by omega
        simpa only [heq] using step1025 ⟨d - 361, hi⟩
      ·
        by_cases h425 : d < 425
        ·
          have hi : d - 393 < 32 := by omega
          have heq : 393 + (d - 393) = d := by omega
          simpa only [heq] using step1026 ⟨d - 393, hi⟩
        ·
          have hi : d - 425 < 3 := by omega
          have heq : 425 + (d - 425) = d := by omega
          simpa only [heq] using step1027 ⟨d - 425, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1016,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1016,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1017,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1017,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1018,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1018,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1019,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1019,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1020,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1020,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1021,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1021,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1022,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1022,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1023,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1023,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1024,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1024,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1025,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1025,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1026,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1026,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.fields1027,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.step1027,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow074
