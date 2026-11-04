import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow081
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082
import Grothe.UpperChaos.OriginalRow227TriangleForward1106
import Grothe.UpperChaos.OriginalRow227TriangleForward1107
import Grothe.UpperChaos.OriginalRow227TriangleForward1108
import Grothe.UpperChaos.OriginalRow227TriangleForward1109
import Grothe.UpperChaos.OriginalRow227TriangleForward1110
import Grothe.UpperChaos.OriginalRow227TriangleForward1111
import Grothe.UpperChaos.OriginalRow227TriangleForward1112
import Grothe.UpperChaos.OriginalRow227TriangleForward1113
import Grothe.UpperChaos.OriginalRow227TriangleForward1114
import Grothe.UpperChaos.OriginalRow227TriangleForward1115
import Grothe.UpperChaos.OriginalRow227TriangleForward1116

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1106 : OriginalRow227TriangleForward1106.entries.size = 32 := rfl

def entry1106 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1106.entries[i.val]'(by rw [size1106]; exact i.isLt)

theorem fields1106 (i : Fin 32) :
    (entry1106 i).IA = shift ∧ (entry1106 i).ID = S (81 + i.val + 1) ∧
      (entry1106 i).IC = S 82 ∧ (entry1106 i).Inext = T 81 (81 + i.val + 1) ∧
      (entry1106 i).Icur = T 81 (81 + i.val) ∧
      (entry1106 i).output = T 82 (81 + i.val) ∧
      (entry1106 i).charge = charge 81 (81 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1111_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1106 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (81 + i.val)) shift
      (S (81 + i.val + 1)) (S 82) (T 81 (81 + i.val + 1))
      (T 81 (81 + i.val)) (T 82 (81 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1106.entries OriginalRow227TriangleForward1106.checked
    ⟨i.val, by rw [size1106]; exact i.isLt⟩
  change (entry1106 i).check = true at h
  rcases fields1106 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1107 : OriginalRow227TriangleForward1107.entries.size = 32 := rfl

def entry1107 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1107.entries[i.val]'(by rw [size1107]; exact i.isLt)

theorem fields1107 (i : Fin 32) :
    (entry1107 i).IA = shift ∧ (entry1107 i).ID = S (113 + i.val + 1) ∧
      (entry1107 i).IC = S 82 ∧ (entry1107 i).Inext = T 81 (113 + i.val + 1) ∧
      (entry1107 i).Icur = T 81 (113 + i.val) ∧
      (entry1107 i).output = T 82 (113 + i.val) ∧
      (entry1107 i).charge = charge 81 (113 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1112_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1107 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (113 + i.val)) shift
      (S (113 + i.val + 1)) (S 82) (T 81 (113 + i.val + 1))
      (T 81 (113 + i.val)) (T 82 (113 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1107.entries OriginalRow227TriangleForward1107.checked
    ⟨i.val, by rw [size1107]; exact i.isLt⟩
  change (entry1107 i).check = true at h
  rcases fields1107 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1108 : OriginalRow227TriangleForward1108.entries.size = 32 := rfl

def entry1108 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1108.entries[i.val]'(by rw [size1108]; exact i.isLt)

theorem fields1108 (i : Fin 32) :
    (entry1108 i).IA = shift ∧ (entry1108 i).ID = S (145 + i.val + 1) ∧
      (entry1108 i).IC = S 82 ∧ (entry1108 i).Inext = T 81 (145 + i.val + 1) ∧
      (entry1108 i).Icur = T 81 (145 + i.val) ∧
      (entry1108 i).output = T 82 (145 + i.val) ∧
      (entry1108 i).charge = charge 81 (145 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1113_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1108 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (145 + i.val)) shift
      (S (145 + i.val + 1)) (S 82) (T 81 (145 + i.val + 1))
      (T 81 (145 + i.val)) (T 82 (145 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1108.entries OriginalRow227TriangleForward1108.checked
    ⟨i.val, by rw [size1108]; exact i.isLt⟩
  change (entry1108 i).check = true at h
  rcases fields1108 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1109 : OriginalRow227TriangleForward1109.entries.size = 32 := rfl

def entry1109 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1109.entries[i.val]'(by rw [size1109]; exact i.isLt)

theorem fields1109 (i : Fin 32) :
    (entry1109 i).IA = shift ∧ (entry1109 i).ID = S (177 + i.val + 1) ∧
      (entry1109 i).IC = S 82 ∧ (entry1109 i).Inext = T 81 (177 + i.val + 1) ∧
      (entry1109 i).Icur = T 81 (177 + i.val) ∧
      (entry1109 i).output = T 82 (177 + i.val) ∧
      (entry1109 i).charge = charge 81 (177 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1114_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1109 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (177 + i.val)) shift
      (S (177 + i.val + 1)) (S 82) (T 81 (177 + i.val + 1))
      (T 81 (177 + i.val)) (T 82 (177 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1109.entries OriginalRow227TriangleForward1109.checked
    ⟨i.val, by rw [size1109]; exact i.isLt⟩
  change (entry1109 i).check = true at h
  rcases fields1109 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1110 : OriginalRow227TriangleForward1110.entries.size = 32 := rfl

def entry1110 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1110.entries[i.val]'(by rw [size1110]; exact i.isLt)

theorem fields1110 (i : Fin 32) :
    (entry1110 i).IA = shift ∧ (entry1110 i).ID = S (209 + i.val + 1) ∧
      (entry1110 i).IC = S 82 ∧ (entry1110 i).Inext = T 81 (209 + i.val + 1) ∧
      (entry1110 i).Icur = T 81 (209 + i.val) ∧
      (entry1110 i).output = T 82 (209 + i.val) ∧
      (entry1110 i).charge = charge 81 (209 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1115_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1110 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (209 + i.val)) shift
      (S (209 + i.val + 1)) (S 82) (T 81 (209 + i.val + 1))
      (T 81 (209 + i.val)) (T 82 (209 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1110.entries OriginalRow227TriangleForward1110.checked
    ⟨i.val, by rw [size1110]; exact i.isLt⟩
  change (entry1110 i).check = true at h
  rcases fields1110 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1111 : OriginalRow227TriangleForward1111.entries.size = 32 := rfl

def entry1111 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1111.entries[i.val]'(by rw [size1111]; exact i.isLt)

theorem fields1111 (i : Fin 32) :
    (entry1111 i).IA = shift ∧ (entry1111 i).ID = S (241 + i.val + 1) ∧
      (entry1111 i).IC = S 82 ∧ (entry1111 i).Inext = T 81 (241 + i.val + 1) ∧
      (entry1111 i).Icur = T 81 (241 + i.val) ∧
      (entry1111 i).output = T 82 (241 + i.val) ∧
      (entry1111 i).charge = charge 81 (241 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1116_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1111 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (241 + i.val)) shift
      (S (241 + i.val + 1)) (S 82) (T 81 (241 + i.val + 1))
      (T 81 (241 + i.val)) (T 82 (241 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1111.entries OriginalRow227TriangleForward1111.checked
    ⟨i.val, by rw [size1111]; exact i.isLt⟩
  change (entry1111 i).check = true at h
  rcases fields1111 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1112 : OriginalRow227TriangleForward1112.entries.size = 32 := rfl

def entry1112 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1112.entries[i.val]'(by rw [size1112]; exact i.isLt)

theorem fields1112 (i : Fin 32) :
    (entry1112 i).IA = shift ∧ (entry1112 i).ID = S (273 + i.val + 1) ∧
      (entry1112 i).IC = S 82 ∧ (entry1112 i).Inext = T 81 (273 + i.val + 1) ∧
      (entry1112 i).Icur = T 81 (273 + i.val) ∧
      (entry1112 i).output = T 82 (273 + i.val) ∧
      (entry1112 i).charge = charge 81 (273 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1117_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1112 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (273 + i.val)) shift
      (S (273 + i.val + 1)) (S 82) (T 81 (273 + i.val + 1))
      (T 81 (273 + i.val)) (T 82 (273 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1112.entries OriginalRow227TriangleForward1112.checked
    ⟨i.val, by rw [size1112]; exact i.isLt⟩
  change (entry1112 i).check = true at h
  rcases fields1112 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1113 : OriginalRow227TriangleForward1113.entries.size = 32 := rfl

def entry1113 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1113.entries[i.val]'(by rw [size1113]; exact i.isLt)

theorem fields1113 (i : Fin 32) :
    (entry1113 i).IA = shift ∧ (entry1113 i).ID = S (305 + i.val + 1) ∧
      (entry1113 i).IC = S 82 ∧ (entry1113 i).Inext = T 81 (305 + i.val + 1) ∧
      (entry1113 i).Icur = T 81 (305 + i.val) ∧
      (entry1113 i).output = T 82 (305 + i.val) ∧
      (entry1113 i).charge = charge 81 (305 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1118_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1113 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (305 + i.val)) shift
      (S (305 + i.val + 1)) (S 82) (T 81 (305 + i.val + 1))
      (T 81 (305 + i.val)) (T 82 (305 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1113.entries OriginalRow227TriangleForward1113.checked
    ⟨i.val, by rw [size1113]; exact i.isLt⟩
  change (entry1113 i).check = true at h
  rcases fields1113 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1114 : OriginalRow227TriangleForward1114.entries.size = 32 := rfl

def entry1114 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1114.entries[i.val]'(by rw [size1114]; exact i.isLt)

theorem fields1114 (i : Fin 32) :
    (entry1114 i).IA = shift ∧ (entry1114 i).ID = S (337 + i.val + 1) ∧
      (entry1114 i).IC = S 82 ∧ (entry1114 i).Inext = T 81 (337 + i.val + 1) ∧
      (entry1114 i).Icur = T 81 (337 + i.val) ∧
      (entry1114 i).output = T 82 (337 + i.val) ∧
      (entry1114 i).charge = charge 81 (337 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1119_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1114 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (337 + i.val)) shift
      (S (337 + i.val + 1)) (S 82) (T 81 (337 + i.val + 1))
      (T 81 (337 + i.val)) (T 82 (337 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1114.entries OriginalRow227TriangleForward1114.checked
    ⟨i.val, by rw [size1114]; exact i.isLt⟩
  change (entry1114 i).check = true at h
  rcases fields1114 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1115 : OriginalRow227TriangleForward1115.entries.size = 32 := rfl

def entry1115 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1115.entries[i.val]'(by rw [size1115]; exact i.isLt)

theorem fields1115 (i : Fin 32) :
    (entry1115 i).IA = shift ∧ (entry1115 i).ID = S (369 + i.val + 1) ∧
      (entry1115 i).IC = S 82 ∧ (entry1115 i).Inext = T 81 (369 + i.val + 1) ∧
      (entry1115 i).Icur = T 81 (369 + i.val) ∧
      (entry1115 i).output = T 82 (369 + i.val) ∧
      (entry1115 i).charge = charge 81 (369 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1120_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1115 (i : Fin 32) :
    forwardStepOK (-768) (charge 81 (369 + i.val)) shift
      (S (369 + i.val + 1)) (S 82) (T 81 (369 + i.val + 1))
      (T 81 (369 + i.val)) (T 82 (369 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1115.entries OriginalRow227TriangleForward1115.checked
    ⟨i.val, by rw [size1115]; exact i.isLt⟩
  change (entry1115 i).check = true at h
  rcases fields1115 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1116 : OriginalRow227TriangleForward1116.entries.size = 19 := rfl

def entry1116 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1116.entries[i.val]'(by rw [size1116]; exact i.isLt)

theorem fields1116 (i : Fin 19) :
    (entry1116 i).IA = shift ∧ (entry1116 i).ID = S (401 + i.val + 1) ∧
      (entry1116 i).IC = S 82 ∧ (entry1116 i).Inext = T 81 (401 + i.val + 1) ∧
      (entry1116 i).Icur = T 81 (401 + i.val) ∧
      (entry1116 i).output = T 82 (401 + i.val) ∧
      (entry1116 i).charge = charge 81 (401 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root82).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow081.block1121_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1116 (i : Fin 19) :
    forwardStepOK (-768) (charge 81 (401 + i.val)) shift
      (S (401 + i.val + 1)) (S 82) (T 81 (401 + i.val + 1))
      (T 81 (401 + i.val)) (T 82 (401 + i.val))
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1116.entries OriginalRow227TriangleForward1116.checked
    ⟨i.val, by rw [size1116]; exact i.isLt⟩
  change (entry1116 i).check = true at h
  rcases fields1116 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 81 ≤ d) (hhi : d < 420) :
    forwardStepOK (-768) (charge 81 d) shift (S (d + 1)) (S 82)
      (T 81 (d + 1)) (T 81 d) (T 82 d)
      (OriginalRow227Roots.root_pos 82 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 81 (by decide)) = true := by
  by_cases h241 : d < 241
  ·
    by_cases h145 : d < 145
    ·
      by_cases h113 : d < 113
      ·
        have hi : d - 81 < 32 := by omega
        have heq : 81 + (d - 81) = d := by omega
        simpa only [heq] using step1106 ⟨d - 81, hi⟩
      ·
        have hi : d - 113 < 32 := by omega
        have heq : 113 + (d - 113) = d := by omega
        simpa only [heq] using step1107 ⟨d - 113, hi⟩
    ·
      by_cases h177 : d < 177
      ·
        have hi : d - 145 < 32 := by omega
        have heq : 145 + (d - 145) = d := by omega
        simpa only [heq] using step1108 ⟨d - 145, hi⟩
      ·
        by_cases h209 : d < 209
        ·
          have hi : d - 177 < 32 := by omega
          have heq : 177 + (d - 177) = d := by omega
          simpa only [heq] using step1109 ⟨d - 177, hi⟩
        ·
          have hi : d - 209 < 32 := by omega
          have heq : 209 + (d - 209) = d := by omega
          simpa only [heq] using step1110 ⟨d - 209, hi⟩
  ·
    by_cases h337 : d < 337
    ·
      by_cases h273 : d < 273
      ·
        have hi : d - 241 < 32 := by omega
        have heq : 241 + (d - 241) = d := by omega
        simpa only [heq] using step1111 ⟨d - 241, hi⟩
      ·
        by_cases h305 : d < 305
        ·
          have hi : d - 273 < 32 := by omega
          have heq : 273 + (d - 273) = d := by omega
          simpa only [heq] using step1112 ⟨d - 273, hi⟩
        ·
          have hi : d - 305 < 32 := by omega
          have heq : 305 + (d - 305) = d := by omega
          simpa only [heq] using step1113 ⟨d - 305, hi⟩
    ·
      by_cases h369 : d < 369
      ·
        have hi : d - 337 < 32 := by omega
        have heq : 337 + (d - 337) = d := by omega
        simpa only [heq] using step1114 ⟨d - 337, hi⟩
      ·
        by_cases h401 : d < 401
        ·
          have hi : d - 369 < 32 := by omega
          have heq : 369 + (d - 369) = d := by omega
          simpa only [heq] using step1115 ⟨d - 369, hi⟩
        ·
          have hi : d - 401 < 19 := by omega
          have heq : 401 + (d - 401) = d := by omega
          simpa only [heq] using step1116 ⟨d - 401, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1106,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1106,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1107,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1107,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1108,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1108,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1109,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1109,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1110,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1110,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1111,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1111,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1112,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1112,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1113,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1113,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1114,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1114,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1115,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1115,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.fields1116,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.step1116,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow082
