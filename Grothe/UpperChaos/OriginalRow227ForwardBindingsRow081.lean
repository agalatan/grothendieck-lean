import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081
import Grothe.UpperChaos.OriginalRow227TriangleForward1095
import Grothe.UpperChaos.OriginalRow227TriangleForward1096
import Grothe.UpperChaos.OriginalRow227TriangleForward1097
import Grothe.UpperChaos.OriginalRow227TriangleForward1098
import Grothe.UpperChaos.OriginalRow227TriangleForward1099
import Grothe.UpperChaos.OriginalRow227TriangleForward1100
import Grothe.UpperChaos.OriginalRow227TriangleForward1101
import Grothe.UpperChaos.OriginalRow227TriangleForward1102
import Grothe.UpperChaos.OriginalRow227TriangleForward1103
import Grothe.UpperChaos.OriginalRow227TriangleForward1104
import Grothe.UpperChaos.OriginalRow227TriangleForward1105

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1095 : OriginalRow227TriangleForward1095.entries.size = 32 := rfl

def entry1095 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1095.entries[i.val]'(by rw [size1095]; exact i.isLt)

theorem fields1095 (i : Fin 32) :
    (entry1095 i).IA = shift ∧ (entry1095 i).ID = S (80 + i.val + 1) ∧
      (entry1095 i).IC = S 81 ∧ (entry1095 i).Inext = T 80 (80 + i.val + 1) ∧
      (entry1095 i).Icur = T 80 (80 + i.val) ∧
      (entry1095 i).output = T 81 (80 + i.val) ∧
      (entry1095 i).charge = charge 80 (80 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1095 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (80 + i.val)) shift
      (S (80 + i.val + 1)) (S 81) (T 80 (80 + i.val + 1))
      (T 80 (80 + i.val)) (T 81 (80 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1095.entries OriginalRow227TriangleForward1095.checked
    ⟨i.val, by rw [size1095]; exact i.isLt⟩
  change (entry1095 i).check = true at h
  rcases fields1095 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1096 : OriginalRow227TriangleForward1096.entries.size = 32 := rfl

def entry1096 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1096.entries[i.val]'(by rw [size1096]; exact i.isLt)

theorem fields1096 (i : Fin 32) :
    (entry1096 i).IA = shift ∧ (entry1096 i).ID = S (112 + i.val + 1) ∧
      (entry1096 i).IC = S 81 ∧ (entry1096 i).Inext = T 80 (112 + i.val + 1) ∧
      (entry1096 i).Icur = T 80 (112 + i.val) ∧
      (entry1096 i).output = T 81 (112 + i.val) ∧
      (entry1096 i).charge = charge 80 (112 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1096 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (112 + i.val)) shift
      (S (112 + i.val + 1)) (S 81) (T 80 (112 + i.val + 1))
      (T 80 (112 + i.val)) (T 81 (112 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1096.entries OriginalRow227TriangleForward1096.checked
    ⟨i.val, by rw [size1096]; exact i.isLt⟩
  change (entry1096 i).check = true at h
  rcases fields1096 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1097 : OriginalRow227TriangleForward1097.entries.size = 32 := rfl

def entry1097 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1097.entries[i.val]'(by rw [size1097]; exact i.isLt)

theorem fields1097 (i : Fin 32) :
    (entry1097 i).IA = shift ∧ (entry1097 i).ID = S (144 + i.val + 1) ∧
      (entry1097 i).IC = S 81 ∧ (entry1097 i).Inext = T 80 (144 + i.val + 1) ∧
      (entry1097 i).Icur = T 80 (144 + i.val) ∧
      (entry1097 i).output = T 81 (144 + i.val) ∧
      (entry1097 i).charge = charge 80 (144 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1097 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (144 + i.val)) shift
      (S (144 + i.val + 1)) (S 81) (T 80 (144 + i.val + 1))
      (T 80 (144 + i.val)) (T 81 (144 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1097.entries OriginalRow227TriangleForward1097.checked
    ⟨i.val, by rw [size1097]; exact i.isLt⟩
  change (entry1097 i).check = true at h
  rcases fields1097 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1098 : OriginalRow227TriangleForward1098.entries.size = 32 := rfl

def entry1098 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1098.entries[i.val]'(by rw [size1098]; exact i.isLt)

theorem fields1098 (i : Fin 32) :
    (entry1098 i).IA = shift ∧ (entry1098 i).ID = S (176 + i.val + 1) ∧
      (entry1098 i).IC = S 81 ∧ (entry1098 i).Inext = T 80 (176 + i.val + 1) ∧
      (entry1098 i).Icur = T 80 (176 + i.val) ∧
      (entry1098 i).output = T 81 (176 + i.val) ∧
      (entry1098 i).charge = charge 80 (176 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1098 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (176 + i.val)) shift
      (S (176 + i.val + 1)) (S 81) (T 80 (176 + i.val + 1))
      (T 80 (176 + i.val)) (T 81 (176 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1098.entries OriginalRow227TriangleForward1098.checked
    ⟨i.val, by rw [size1098]; exact i.isLt⟩
  change (entry1098 i).check = true at h
  rcases fields1098 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1099 : OriginalRow227TriangleForward1099.entries.size = 32 := rfl

def entry1099 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1099.entries[i.val]'(by rw [size1099]; exact i.isLt)

theorem fields1099 (i : Fin 32) :
    (entry1099 i).IA = shift ∧ (entry1099 i).ID = S (208 + i.val + 1) ∧
      (entry1099 i).IC = S 81 ∧ (entry1099 i).Inext = T 80 (208 + i.val + 1) ∧
      (entry1099 i).Icur = T 80 (208 + i.val) ∧
      (entry1099 i).output = T 81 (208 + i.val) ∧
      (entry1099 i).charge = charge 80 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1099 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 81) (T 80 (208 + i.val + 1))
      (T 80 (208 + i.val)) (T 81 (208 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1099.entries OriginalRow227TriangleForward1099.checked
    ⟨i.val, by rw [size1099]; exact i.isLt⟩
  change (entry1099 i).check = true at h
  rcases fields1099 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1100 : OriginalRow227TriangleForward1100.entries.size = 32 := rfl

def entry1100 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1100.entries[i.val]'(by rw [size1100]; exact i.isLt)

theorem fields1100 (i : Fin 32) :
    (entry1100 i).IA = shift ∧ (entry1100 i).ID = S (240 + i.val + 1) ∧
      (entry1100 i).IC = S 81 ∧ (entry1100 i).Inext = T 80 (240 + i.val + 1) ∧
      (entry1100 i).Icur = T 80 (240 + i.val) ∧
      (entry1100 i).output = T 81 (240 + i.val) ∧
      (entry1100 i).charge = charge 80 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1100 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 81) (T 80 (240 + i.val + 1))
      (T 80 (240 + i.val)) (T 81 (240 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1100.entries OriginalRow227TriangleForward1100.checked
    ⟨i.val, by rw [size1100]; exact i.isLt⟩
  change (entry1100 i).check = true at h
  rcases fields1100 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1101 : OriginalRow227TriangleForward1101.entries.size = 32 := rfl

def entry1101 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1101.entries[i.val]'(by rw [size1101]; exact i.isLt)

theorem fields1101 (i : Fin 32) :
    (entry1101 i).IA = shift ∧ (entry1101 i).ID = S (272 + i.val + 1) ∧
      (entry1101 i).IC = S 81 ∧ (entry1101 i).Inext = T 80 (272 + i.val + 1) ∧
      (entry1101 i).Icur = T 80 (272 + i.val) ∧
      (entry1101 i).output = T 81 (272 + i.val) ∧
      (entry1101 i).charge = charge 80 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1101 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 81) (T 80 (272 + i.val + 1))
      (T 80 (272 + i.val)) (T 81 (272 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1101.entries OriginalRow227TriangleForward1101.checked
    ⟨i.val, by rw [size1101]; exact i.isLt⟩
  change (entry1101 i).check = true at h
  rcases fields1101 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1102 : OriginalRow227TriangleForward1102.entries.size = 32 := rfl

def entry1102 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1102.entries[i.val]'(by rw [size1102]; exact i.isLt)

theorem fields1102 (i : Fin 32) :
    (entry1102 i).IA = shift ∧ (entry1102 i).ID = S (304 + i.val + 1) ∧
      (entry1102 i).IC = S 81 ∧ (entry1102 i).Inext = T 80 (304 + i.val + 1) ∧
      (entry1102 i).Icur = T 80 (304 + i.val) ∧
      (entry1102 i).output = T 81 (304 + i.val) ∧
      (entry1102 i).charge = charge 80 (304 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1102 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (304 + i.val)) shift
      (S (304 + i.val + 1)) (S 81) (T 80 (304 + i.val + 1))
      (T 80 (304 + i.val)) (T 81 (304 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1102.entries OriginalRow227TriangleForward1102.checked
    ⟨i.val, by rw [size1102]; exact i.isLt⟩
  change (entry1102 i).check = true at h
  rcases fields1102 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1103 : OriginalRow227TriangleForward1103.entries.size = 32 := rfl

def entry1103 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1103.entries[i.val]'(by rw [size1103]; exact i.isLt)

theorem fields1103 (i : Fin 32) :
    (entry1103 i).IA = shift ∧ (entry1103 i).ID = S (336 + i.val + 1) ∧
      (entry1103 i).IC = S 81 ∧ (entry1103 i).Inext = T 80 (336 + i.val + 1) ∧
      (entry1103 i).Icur = T 80 (336 + i.val) ∧
      (entry1103 i).output = T 81 (336 + i.val) ∧
      (entry1103 i).charge = charge 80 (336 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1103 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (336 + i.val)) shift
      (S (336 + i.val + 1)) (S 81) (T 80 (336 + i.val + 1))
      (T 80 (336 + i.val)) (T 81 (336 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1103.entries OriginalRow227TriangleForward1103.checked
    ⟨i.val, by rw [size1103]; exact i.isLt⟩
  change (entry1103 i).check = true at h
  rcases fields1103 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1104 : OriginalRow227TriangleForward1104.entries.size = 32 := rfl

def entry1104 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1104.entries[i.val]'(by rw [size1104]; exact i.isLt)

theorem fields1104 (i : Fin 32) :
    (entry1104 i).IA = shift ∧ (entry1104 i).ID = S (368 + i.val + 1) ∧
      (entry1104 i).IC = S 81 ∧ (entry1104 i).Inext = T 80 (368 + i.val + 1) ∧
      (entry1104 i).Icur = T 80 (368 + i.val) ∧
      (entry1104 i).output = T 81 (368 + i.val) ∧
      (entry1104 i).charge = charge 80 (368 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1104 (i : Fin 32) :
    forwardStepOK (-768) (charge 80 (368 + i.val)) shift
      (S (368 + i.val + 1)) (S 81) (T 80 (368 + i.val + 1))
      (T 80 (368 + i.val)) (T 81 (368 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1104.entries OriginalRow227TriangleForward1104.checked
    ⟨i.val, by rw [size1104]; exact i.isLt⟩
  change (entry1104 i).check = true at h
  rcases fields1104 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1105 : OriginalRow227TriangleForward1105.entries.size = 21 := rfl

def entry1105 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1105.entries[i.val]'(by rw [size1105]; exact i.isLt)

theorem fields1105 (i : Fin 21) :
    (entry1105 i).IA = shift ∧ (entry1105 i).ID = S (400 + i.val + 1) ∧
      (entry1105 i).IC = S 81 ∧ (entry1105 i).Inext = T 80 (400 + i.val + 1) ∧
      (entry1105 i).Icur = T 80 (400 + i.val) ∧
      (entry1105 i).output = T 81 (400 + i.val) ∧
      (entry1105 i).charge = charge 80 (400 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root81).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1105 (i : Fin 21) :
    forwardStepOK (-768) (charge 80 (400 + i.val)) shift
      (S (400 + i.val + 1)) (S 81) (T 80 (400 + i.val + 1))
      (T 80 (400 + i.val)) (T 81 (400 + i.val))
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1105.entries OriginalRow227TriangleForward1105.checked
    ⟨i.val, by rw [size1105]; exact i.isLt⟩
  change (entry1105 i).check = true at h
  rcases fields1105 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 80 ≤ d) (hhi : d < 421) :
    forwardStepOK (-768) (charge 80 d) shift (S (d + 1)) (S 81)
      (T 80 (d + 1)) (T 80 d) (T 81 d)
      (OriginalRow227Roots.root_pos 81 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 80 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    by_cases h144 : d < 144
    ·
      by_cases h112 : d < 112
      ·
        have hi : d - 80 < 32 := by omega
        have heq : 80 + (d - 80) = d := by omega
        simpa only [heq] using step1095 ⟨d - 80, hi⟩
      ·
        have hi : d - 112 < 32 := by omega
        have heq : 112 + (d - 112) = d := by omega
        simpa only [heq] using step1096 ⟨d - 112, hi⟩
    ·
      by_cases h176 : d < 176
      ·
        have hi : d - 144 < 32 := by omega
        have heq : 144 + (d - 144) = d := by omega
        simpa only [heq] using step1097 ⟨d - 144, hi⟩
      ·
        by_cases h208 : d < 208
        ·
          have hi : d - 176 < 32 := by omega
          have heq : 176 + (d - 176) = d := by omega
          simpa only [heq] using step1098 ⟨d - 176, hi⟩
        ·
          have hi : d - 208 < 32 := by omega
          have heq : 208 + (d - 208) = d := by omega
          simpa only [heq] using step1099 ⟨d - 208, hi⟩
  ·
    by_cases h336 : d < 336
    ·
      by_cases h272 : d < 272
      ·
        have hi : d - 240 < 32 := by omega
        have heq : 240 + (d - 240) = d := by omega
        simpa only [heq] using step1100 ⟨d - 240, hi⟩
      ·
        by_cases h304 : d < 304
        ·
          have hi : d - 272 < 32 := by omega
          have heq : 272 + (d - 272) = d := by omega
          simpa only [heq] using step1101 ⟨d - 272, hi⟩
        ·
          have hi : d - 304 < 32 := by omega
          have heq : 304 + (d - 304) = d := by omega
          simpa only [heq] using step1102 ⟨d - 304, hi⟩
    ·
      by_cases h368 : d < 368
      ·
        have hi : d - 336 < 32 := by omega
        have heq : 336 + (d - 336) = d := by omega
        simpa only [heq] using step1103 ⟨d - 336, hi⟩
      ·
        by_cases h400 : d < 400
        ·
          have hi : d - 368 < 32 := by omega
          have heq : 368 + (d - 368) = d := by omega
          simpa only [heq] using step1104 ⟨d - 368, hi⟩
        ·
          have hi : d - 400 < 21 := by omega
          have heq : 400 + (d - 400) = d := by omega
          simpa only [heq] using step1105 ⟨d - 400, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1095,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1095,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1096,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1096,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1097,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1097,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1098,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1098,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1099,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1099,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1100,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1100,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1101,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1101,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1102,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1102,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1103,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1103,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1104,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1104,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.fields1105,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.step1105,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow081
