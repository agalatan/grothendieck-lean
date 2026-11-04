import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow079
import Grothe.UpperChaos.OriginalRow227TriangleForward1073
import Grothe.UpperChaos.OriginalRow227TriangleForward1074
import Grothe.UpperChaos.OriginalRow227TriangleForward1075
import Grothe.UpperChaos.OriginalRow227TriangleForward1076
import Grothe.UpperChaos.OriginalRow227TriangleForward1077
import Grothe.UpperChaos.OriginalRow227TriangleForward1078
import Grothe.UpperChaos.OriginalRow227TriangleForward1079
import Grothe.UpperChaos.OriginalRow227TriangleForward1080
import Grothe.UpperChaos.OriginalRow227TriangleForward1081
import Grothe.UpperChaos.OriginalRow227TriangleForward1082
import Grothe.UpperChaos.OriginalRow227TriangleForward1083

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1073 : OriginalRow227TriangleForward1073.entries.size = 32 := rfl

def entry1073 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1073.entries[i.val]'(by rw [size1073]; exact i.isLt)

theorem fields1073 (i : Fin 32) :
    (entry1073 i).IA = shift ∧ (entry1073 i).ID = S (78 + i.val + 1) ∧
      (entry1073 i).IC = S 79 ∧ (entry1073 i).Inext = T 78 (78 + i.val + 1) ∧
      (entry1073 i).Icur = T 78 (78 + i.val) ∧
      (entry1073 i).output = T 79 (78 + i.val) ∧
      (entry1073 i).charge = charge 78 (78 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1073 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (78 + i.val)) shift
      (S (78 + i.val + 1)) (S 79) (T 78 (78 + i.val + 1))
      (T 78 (78 + i.val)) (T 79 (78 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1073.entries OriginalRow227TriangleForward1073.checked
    ⟨i.val, by rw [size1073]; exact i.isLt⟩
  change (entry1073 i).check = true at h
  rcases fields1073 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1074 : OriginalRow227TriangleForward1074.entries.size = 32 := rfl

def entry1074 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1074.entries[i.val]'(by rw [size1074]; exact i.isLt)

theorem fields1074 (i : Fin 32) :
    (entry1074 i).IA = shift ∧ (entry1074 i).ID = S (110 + i.val + 1) ∧
      (entry1074 i).IC = S 79 ∧ (entry1074 i).Inext = T 78 (110 + i.val + 1) ∧
      (entry1074 i).Icur = T 78 (110 + i.val) ∧
      (entry1074 i).output = T 79 (110 + i.val) ∧
      (entry1074 i).charge = charge 78 (110 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1074 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (110 + i.val)) shift
      (S (110 + i.val + 1)) (S 79) (T 78 (110 + i.val + 1))
      (T 78 (110 + i.val)) (T 79 (110 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1074.entries OriginalRow227TriangleForward1074.checked
    ⟨i.val, by rw [size1074]; exact i.isLt⟩
  change (entry1074 i).check = true at h
  rcases fields1074 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1075 : OriginalRow227TriangleForward1075.entries.size = 32 := rfl

def entry1075 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1075.entries[i.val]'(by rw [size1075]; exact i.isLt)

theorem fields1075 (i : Fin 32) :
    (entry1075 i).IA = shift ∧ (entry1075 i).ID = S (142 + i.val + 1) ∧
      (entry1075 i).IC = S 79 ∧ (entry1075 i).Inext = T 78 (142 + i.val + 1) ∧
      (entry1075 i).Icur = T 78 (142 + i.val) ∧
      (entry1075 i).output = T 79 (142 + i.val) ∧
      (entry1075 i).charge = charge 78 (142 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1075 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (142 + i.val)) shift
      (S (142 + i.val + 1)) (S 79) (T 78 (142 + i.val + 1))
      (T 78 (142 + i.val)) (T 79 (142 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1075.entries OriginalRow227TriangleForward1075.checked
    ⟨i.val, by rw [size1075]; exact i.isLt⟩
  change (entry1075 i).check = true at h
  rcases fields1075 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1076 : OriginalRow227TriangleForward1076.entries.size = 32 := rfl

def entry1076 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1076.entries[i.val]'(by rw [size1076]; exact i.isLt)

theorem fields1076 (i : Fin 32) :
    (entry1076 i).IA = shift ∧ (entry1076 i).ID = S (174 + i.val + 1) ∧
      (entry1076 i).IC = S 79 ∧ (entry1076 i).Inext = T 78 (174 + i.val + 1) ∧
      (entry1076 i).Icur = T 78 (174 + i.val) ∧
      (entry1076 i).output = T 79 (174 + i.val) ∧
      (entry1076 i).charge = charge 78 (174 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1076 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (174 + i.val)) shift
      (S (174 + i.val + 1)) (S 79) (T 78 (174 + i.val + 1))
      (T 78 (174 + i.val)) (T 79 (174 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1076.entries OriginalRow227TriangleForward1076.checked
    ⟨i.val, by rw [size1076]; exact i.isLt⟩
  change (entry1076 i).check = true at h
  rcases fields1076 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1077 : OriginalRow227TriangleForward1077.entries.size = 32 := rfl

def entry1077 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1077.entries[i.val]'(by rw [size1077]; exact i.isLt)

theorem fields1077 (i : Fin 32) :
    (entry1077 i).IA = shift ∧ (entry1077 i).ID = S (206 + i.val + 1) ∧
      (entry1077 i).IC = S 79 ∧ (entry1077 i).Inext = T 78 (206 + i.val + 1) ∧
      (entry1077 i).Icur = T 78 (206 + i.val) ∧
      (entry1077 i).output = T 79 (206 + i.val) ∧
      (entry1077 i).charge = charge 78 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1077 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 79) (T 78 (206 + i.val + 1))
      (T 78 (206 + i.val)) (T 79 (206 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1077.entries OriginalRow227TriangleForward1077.checked
    ⟨i.val, by rw [size1077]; exact i.isLt⟩
  change (entry1077 i).check = true at h
  rcases fields1077 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1078 : OriginalRow227TriangleForward1078.entries.size = 32 := rfl

def entry1078 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1078.entries[i.val]'(by rw [size1078]; exact i.isLt)

theorem fields1078 (i : Fin 32) :
    (entry1078 i).IA = shift ∧ (entry1078 i).ID = S (238 + i.val + 1) ∧
      (entry1078 i).IC = S 79 ∧ (entry1078 i).Inext = T 78 (238 + i.val + 1) ∧
      (entry1078 i).Icur = T 78 (238 + i.val) ∧
      (entry1078 i).output = T 79 (238 + i.val) ∧
      (entry1078 i).charge = charge 78 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1078 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 79) (T 78 (238 + i.val + 1))
      (T 78 (238 + i.val)) (T 79 (238 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1078.entries OriginalRow227TriangleForward1078.checked
    ⟨i.val, by rw [size1078]; exact i.isLt⟩
  change (entry1078 i).check = true at h
  rcases fields1078 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1079 : OriginalRow227TriangleForward1079.entries.size = 32 := rfl

def entry1079 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1079.entries[i.val]'(by rw [size1079]; exact i.isLt)

theorem fields1079 (i : Fin 32) :
    (entry1079 i).IA = shift ∧ (entry1079 i).ID = S (270 + i.val + 1) ∧
      (entry1079 i).IC = S 79 ∧ (entry1079 i).Inext = T 78 (270 + i.val + 1) ∧
      (entry1079 i).Icur = T 78 (270 + i.val) ∧
      (entry1079 i).output = T 79 (270 + i.val) ∧
      (entry1079 i).charge = charge 78 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1079 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 79) (T 78 (270 + i.val + 1))
      (T 78 (270 + i.val)) (T 79 (270 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1079.entries OriginalRow227TriangleForward1079.checked
    ⟨i.val, by rw [size1079]; exact i.isLt⟩
  change (entry1079 i).check = true at h
  rcases fields1079 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1080 : OriginalRow227TriangleForward1080.entries.size = 32 := rfl

def entry1080 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1080.entries[i.val]'(by rw [size1080]; exact i.isLt)

theorem fields1080 (i : Fin 32) :
    (entry1080 i).IA = shift ∧ (entry1080 i).ID = S (302 + i.val + 1) ∧
      (entry1080 i).IC = S 79 ∧ (entry1080 i).Inext = T 78 (302 + i.val + 1) ∧
      (entry1080 i).Icur = T 78 (302 + i.val) ∧
      (entry1080 i).output = T 79 (302 + i.val) ∧
      (entry1080 i).charge = charge 78 (302 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1080 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (302 + i.val)) shift
      (S (302 + i.val + 1)) (S 79) (T 78 (302 + i.val + 1))
      (T 78 (302 + i.val)) (T 79 (302 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1080.entries OriginalRow227TriangleForward1080.checked
    ⟨i.val, by rw [size1080]; exact i.isLt⟩
  change (entry1080 i).check = true at h
  rcases fields1080 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1081 : OriginalRow227TriangleForward1081.entries.size = 32 := rfl

def entry1081 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1081.entries[i.val]'(by rw [size1081]; exact i.isLt)

theorem fields1081 (i : Fin 32) :
    (entry1081 i).IA = shift ∧ (entry1081 i).ID = S (334 + i.val + 1) ∧
      (entry1081 i).IC = S 79 ∧ (entry1081 i).Inext = T 78 (334 + i.val + 1) ∧
      (entry1081 i).Icur = T 78 (334 + i.val) ∧
      (entry1081 i).output = T 79 (334 + i.val) ∧
      (entry1081 i).charge = charge 78 (334 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1081 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (334 + i.val)) shift
      (S (334 + i.val + 1)) (S 79) (T 78 (334 + i.val + 1))
      (T 78 (334 + i.val)) (T 79 (334 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1081.entries OriginalRow227TriangleForward1081.checked
    ⟨i.val, by rw [size1081]; exact i.isLt⟩
  change (entry1081 i).check = true at h
  rcases fields1081 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1082 : OriginalRow227TriangleForward1082.entries.size = 32 := rfl

def entry1082 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1082.entries[i.val]'(by rw [size1082]; exact i.isLt)

theorem fields1082 (i : Fin 32) :
    (entry1082 i).IA = shift ∧ (entry1082 i).ID = S (366 + i.val + 1) ∧
      (entry1082 i).IC = S 79 ∧ (entry1082 i).Inext = T 78 (366 + i.val + 1) ∧
      (entry1082 i).Icur = T 78 (366 + i.val) ∧
      (entry1082 i).output = T 79 (366 + i.val) ∧
      (entry1082 i).charge = charge 78 (366 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1082 (i : Fin 32) :
    forwardStepOK (-768) (charge 78 (366 + i.val)) shift
      (S (366 + i.val + 1)) (S 79) (T 78 (366 + i.val + 1))
      (T 78 (366 + i.val)) (T 79 (366 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1082.entries OriginalRow227TriangleForward1082.checked
    ⟨i.val, by rw [size1082]; exact i.isLt⟩
  change (entry1082 i).check = true at h
  rcases fields1082 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1083 : OriginalRow227TriangleForward1083.entries.size = 25 := rfl

def entry1083 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1083.entries[i.val]'(by rw [size1083]; exact i.isLt)

theorem fields1083 (i : Fin 25) :
    (entry1083 i).IA = shift ∧ (entry1083 i).ID = S (398 + i.val + 1) ∧
      (entry1083 i).IC = S 79 ∧ (entry1083 i).Inext = T 78 (398 + i.val + 1) ∧
      (entry1083 i).Icur = T 78 (398 + i.val) ∧
      (entry1083 i).output = T 79 (398 + i.val) ∧
      (entry1083 i).charge = charge 78 (398 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root79).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1083 (i : Fin 25) :
    forwardStepOK (-768) (charge 78 (398 + i.val)) shift
      (S (398 + i.val + 1)) (S 79) (T 78 (398 + i.val + 1))
      (T 78 (398 + i.val)) (T 79 (398 + i.val))
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1083.entries OriginalRow227TriangleForward1083.checked
    ⟨i.val, by rw [size1083]; exact i.isLt⟩
  change (entry1083 i).check = true at h
  rcases fields1083 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 78 ≤ d) (hhi : d < 423) :
    forwardStepOK (-768) (charge 78 d) shift (S (d + 1)) (S 79)
      (T 78 (d + 1)) (T 78 d) (T 79 d)
      (OriginalRow227Roots.root_pos 79 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 78 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    by_cases h142 : d < 142
    ·
      by_cases h110 : d < 110
      ·
        have hi : d - 78 < 32 := by omega
        have heq : 78 + (d - 78) = d := by omega
        simpa only [heq] using step1073 ⟨d - 78, hi⟩
      ·
        have hi : d - 110 < 32 := by omega
        have heq : 110 + (d - 110) = d := by omega
        simpa only [heq] using step1074 ⟨d - 110, hi⟩
    ·
      by_cases h174 : d < 174
      ·
        have hi : d - 142 < 32 := by omega
        have heq : 142 + (d - 142) = d := by omega
        simpa only [heq] using step1075 ⟨d - 142, hi⟩
      ·
        by_cases h206 : d < 206
        ·
          have hi : d - 174 < 32 := by omega
          have heq : 174 + (d - 174) = d := by omega
          simpa only [heq] using step1076 ⟨d - 174, hi⟩
        ·
          have hi : d - 206 < 32 := by omega
          have heq : 206 + (d - 206) = d := by omega
          simpa only [heq] using step1077 ⟨d - 206, hi⟩
  ·
    by_cases h334 : d < 334
    ·
      by_cases h270 : d < 270
      ·
        have hi : d - 238 < 32 := by omega
        have heq : 238 + (d - 238) = d := by omega
        simpa only [heq] using step1078 ⟨d - 238, hi⟩
      ·
        by_cases h302 : d < 302
        ·
          have hi : d - 270 < 32 := by omega
          have heq : 270 + (d - 270) = d := by omega
          simpa only [heq] using step1079 ⟨d - 270, hi⟩
        ·
          have hi : d - 302 < 32 := by omega
          have heq : 302 + (d - 302) = d := by omega
          simpa only [heq] using step1080 ⟨d - 302, hi⟩
    ·
      by_cases h366 : d < 366
      ·
        have hi : d - 334 < 32 := by omega
        have heq : 334 + (d - 334) = d := by omega
        simpa only [heq] using step1081 ⟨d - 334, hi⟩
      ·
        by_cases h398 : d < 398
        ·
          have hi : d - 366 < 32 := by omega
          have heq : 366 + (d - 366) = d := by omega
          simpa only [heq] using step1082 ⟨d - 366, hi⟩
        ·
          have hi : d - 398 < 25 := by omega
          have heq : 398 + (d - 398) = d := by omega
          simpa only [heq] using step1083 ⟨d - 398, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1073,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1073,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1074,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1074,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1075,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1075,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1076,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1076,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1077,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1077,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1078,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1078,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1079,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1079,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1080,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1080,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1081,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1081,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1082,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1082,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.fields1083,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.step1083,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow079
