import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow078
import Grothe.UpperChaos.OriginalRow227TriangleForward1062
import Grothe.UpperChaos.OriginalRow227TriangleForward1063
import Grothe.UpperChaos.OriginalRow227TriangleForward1064
import Grothe.UpperChaos.OriginalRow227TriangleForward1065
import Grothe.UpperChaos.OriginalRow227TriangleForward1066
import Grothe.UpperChaos.OriginalRow227TriangleForward1067
import Grothe.UpperChaos.OriginalRow227TriangleForward1068
import Grothe.UpperChaos.OriginalRow227TriangleForward1069
import Grothe.UpperChaos.OriginalRow227TriangleForward1070
import Grothe.UpperChaos.OriginalRow227TriangleForward1071
import Grothe.UpperChaos.OriginalRow227TriangleForward1072

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1062 : OriginalRow227TriangleForward1062.entries.size = 32 := rfl

def entry1062 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1062.entries[i.val]'(by rw [size1062]; exact i.isLt)

theorem fields1062 (i : Fin 32) :
    (entry1062 i).IA = shift ∧ (entry1062 i).ID = S (77 + i.val + 1) ∧
      (entry1062 i).IC = S 78 ∧ (entry1062 i).Inext = T 77 (77 + i.val + 1) ∧
      (entry1062 i).Icur = T 77 (77 + i.val) ∧
      (entry1062 i).output = T 78 (77 + i.val) ∧
      (entry1062 i).charge = charge 77 (77 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1078_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1062 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (77 + i.val)) shift
      (S (77 + i.val + 1)) (S 78) (T 77 (77 + i.val + 1))
      (T 77 (77 + i.val)) (T 78 (77 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1062.entries OriginalRow227TriangleForward1062.checked
    ⟨i.val, by rw [size1062]; exact i.isLt⟩
  change (entry1062 i).check = true at h
  rcases fields1062 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1063 : OriginalRow227TriangleForward1063.entries.size = 32 := rfl

def entry1063 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1063.entries[i.val]'(by rw [size1063]; exact i.isLt)

theorem fields1063 (i : Fin 32) :
    (entry1063 i).IA = shift ∧ (entry1063 i).ID = S (109 + i.val + 1) ∧
      (entry1063 i).IC = S 78 ∧ (entry1063 i).Inext = T 77 (109 + i.val + 1) ∧
      (entry1063 i).Icur = T 77 (109 + i.val) ∧
      (entry1063 i).output = T 78 (109 + i.val) ∧
      (entry1063 i).charge = charge 77 (109 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1079_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1063 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (109 + i.val)) shift
      (S (109 + i.val + 1)) (S 78) (T 77 (109 + i.val + 1))
      (T 77 (109 + i.val)) (T 78 (109 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1063.entries OriginalRow227TriangleForward1063.checked
    ⟨i.val, by rw [size1063]; exact i.isLt⟩
  change (entry1063 i).check = true at h
  rcases fields1063 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1064 : OriginalRow227TriangleForward1064.entries.size = 32 := rfl

def entry1064 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1064.entries[i.val]'(by rw [size1064]; exact i.isLt)

theorem fields1064 (i : Fin 32) :
    (entry1064 i).IA = shift ∧ (entry1064 i).ID = S (141 + i.val + 1) ∧
      (entry1064 i).IC = S 78 ∧ (entry1064 i).Inext = T 77 (141 + i.val + 1) ∧
      (entry1064 i).Icur = T 77 (141 + i.val) ∧
      (entry1064 i).output = T 78 (141 + i.val) ∧
      (entry1064 i).charge = charge 77 (141 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1080_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1064 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (141 + i.val)) shift
      (S (141 + i.val + 1)) (S 78) (T 77 (141 + i.val + 1))
      (T 77 (141 + i.val)) (T 78 (141 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1064.entries OriginalRow227TriangleForward1064.checked
    ⟨i.val, by rw [size1064]; exact i.isLt⟩
  change (entry1064 i).check = true at h
  rcases fields1064 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1065 : OriginalRow227TriangleForward1065.entries.size = 32 := rfl

def entry1065 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1065.entries[i.val]'(by rw [size1065]; exact i.isLt)

theorem fields1065 (i : Fin 32) :
    (entry1065 i).IA = shift ∧ (entry1065 i).ID = S (173 + i.val + 1) ∧
      (entry1065 i).IC = S 78 ∧ (entry1065 i).Inext = T 77 (173 + i.val + 1) ∧
      (entry1065 i).Icur = T 77 (173 + i.val) ∧
      (entry1065 i).output = T 78 (173 + i.val) ∧
      (entry1065 i).charge = charge 77 (173 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1081_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1065 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (173 + i.val)) shift
      (S (173 + i.val + 1)) (S 78) (T 77 (173 + i.val + 1))
      (T 77 (173 + i.val)) (T 78 (173 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1065.entries OriginalRow227TriangleForward1065.checked
    ⟨i.val, by rw [size1065]; exact i.isLt⟩
  change (entry1065 i).check = true at h
  rcases fields1065 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1066 : OriginalRow227TriangleForward1066.entries.size = 32 := rfl

def entry1066 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1066.entries[i.val]'(by rw [size1066]; exact i.isLt)

theorem fields1066 (i : Fin 32) :
    (entry1066 i).IA = shift ∧ (entry1066 i).ID = S (205 + i.val + 1) ∧
      (entry1066 i).IC = S 78 ∧ (entry1066 i).Inext = T 77 (205 + i.val + 1) ∧
      (entry1066 i).Icur = T 77 (205 + i.val) ∧
      (entry1066 i).output = T 78 (205 + i.val) ∧
      (entry1066 i).charge = charge 77 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1082_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1066 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 78) (T 77 (205 + i.val + 1))
      (T 77 (205 + i.val)) (T 78 (205 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1066.entries OriginalRow227TriangleForward1066.checked
    ⟨i.val, by rw [size1066]; exact i.isLt⟩
  change (entry1066 i).check = true at h
  rcases fields1066 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1067 : OriginalRow227TriangleForward1067.entries.size = 32 := rfl

def entry1067 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1067.entries[i.val]'(by rw [size1067]; exact i.isLt)

theorem fields1067 (i : Fin 32) :
    (entry1067 i).IA = shift ∧ (entry1067 i).ID = S (237 + i.val + 1) ∧
      (entry1067 i).IC = S 78 ∧ (entry1067 i).Inext = T 77 (237 + i.val + 1) ∧
      (entry1067 i).Icur = T 77 (237 + i.val) ∧
      (entry1067 i).output = T 78 (237 + i.val) ∧
      (entry1067 i).charge = charge 77 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1083_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1067 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 78) (T 77 (237 + i.val + 1))
      (T 77 (237 + i.val)) (T 78 (237 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1067.entries OriginalRow227TriangleForward1067.checked
    ⟨i.val, by rw [size1067]; exact i.isLt⟩
  change (entry1067 i).check = true at h
  rcases fields1067 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1068 : OriginalRow227TriangleForward1068.entries.size = 32 := rfl

def entry1068 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1068.entries[i.val]'(by rw [size1068]; exact i.isLt)

theorem fields1068 (i : Fin 32) :
    (entry1068 i).IA = shift ∧ (entry1068 i).ID = S (269 + i.val + 1) ∧
      (entry1068 i).IC = S 78 ∧ (entry1068 i).Inext = T 77 (269 + i.val + 1) ∧
      (entry1068 i).Icur = T 77 (269 + i.val) ∧
      (entry1068 i).output = T 78 (269 + i.val) ∧
      (entry1068 i).charge = charge 77 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1084_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1068 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 78) (T 77 (269 + i.val + 1))
      (T 77 (269 + i.val)) (T 78 (269 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1068.entries OriginalRow227TriangleForward1068.checked
    ⟨i.val, by rw [size1068]; exact i.isLt⟩
  change (entry1068 i).check = true at h
  rcases fields1068 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1069 : OriginalRow227TriangleForward1069.entries.size = 32 := rfl

def entry1069 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1069.entries[i.val]'(by rw [size1069]; exact i.isLt)

theorem fields1069 (i : Fin 32) :
    (entry1069 i).IA = shift ∧ (entry1069 i).ID = S (301 + i.val + 1) ∧
      (entry1069 i).IC = S 78 ∧ (entry1069 i).Inext = T 77 (301 + i.val + 1) ∧
      (entry1069 i).Icur = T 77 (301 + i.val) ∧
      (entry1069 i).output = T 78 (301 + i.val) ∧
      (entry1069 i).charge = charge 77 (301 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1085_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1069 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (301 + i.val)) shift
      (S (301 + i.val + 1)) (S 78) (T 77 (301 + i.val + 1))
      (T 77 (301 + i.val)) (T 78 (301 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1069.entries OriginalRow227TriangleForward1069.checked
    ⟨i.val, by rw [size1069]; exact i.isLt⟩
  change (entry1069 i).check = true at h
  rcases fields1069 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1070 : OriginalRow227TriangleForward1070.entries.size = 32 := rfl

def entry1070 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1070.entries[i.val]'(by rw [size1070]; exact i.isLt)

theorem fields1070 (i : Fin 32) :
    (entry1070 i).IA = shift ∧ (entry1070 i).ID = S (333 + i.val + 1) ∧
      (entry1070 i).IC = S 78 ∧ (entry1070 i).Inext = T 77 (333 + i.val + 1) ∧
      (entry1070 i).Icur = T 77 (333 + i.val) ∧
      (entry1070 i).output = T 78 (333 + i.val) ∧
      (entry1070 i).charge = charge 77 (333 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1086_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1070 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (333 + i.val)) shift
      (S (333 + i.val + 1)) (S 78) (T 77 (333 + i.val + 1))
      (T 77 (333 + i.val)) (T 78 (333 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1070.entries OriginalRow227TriangleForward1070.checked
    ⟨i.val, by rw [size1070]; exact i.isLt⟩
  change (entry1070 i).check = true at h
  rcases fields1070 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1071 : OriginalRow227TriangleForward1071.entries.size = 32 := rfl

def entry1071 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1071.entries[i.val]'(by rw [size1071]; exact i.isLt)

theorem fields1071 (i : Fin 32) :
    (entry1071 i).IA = shift ∧ (entry1071 i).ID = S (365 + i.val + 1) ∧
      (entry1071 i).IC = S 78 ∧ (entry1071 i).Inext = T 77 (365 + i.val + 1) ∧
      (entry1071 i).Icur = T 77 (365 + i.val) ∧
      (entry1071 i).output = T 78 (365 + i.val) ∧
      (entry1071 i).charge = charge 77 (365 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1087_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1071 (i : Fin 32) :
    forwardStepOK (-768) (charge 77 (365 + i.val)) shift
      (S (365 + i.val + 1)) (S 78) (T 77 (365 + i.val + 1))
      (T 77 (365 + i.val)) (T 78 (365 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1071.entries OriginalRow227TriangleForward1071.checked
    ⟨i.val, by rw [size1071]; exact i.isLt⟩
  change (entry1071 i).check = true at h
  rcases fields1071 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1072 : OriginalRow227TriangleForward1072.entries.size = 27 := rfl

def entry1072 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1072.entries[i.val]'(by rw [size1072]; exact i.isLt)

theorem fields1072 (i : Fin 27) :
    (entry1072 i).IA = shift ∧ (entry1072 i).ID = S (397 + i.val + 1) ∧
      (entry1072 i).IC = S 78 ∧ (entry1072 i).Inext = T 77 (397 + i.val + 1) ∧
      (entry1072 i).Icur = T 77 (397 + i.val) ∧
      (entry1072 i).output = T 78 (397 + i.val) ∧
      (entry1072 i).charge = charge 77 (397 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root78).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow078.block1088_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1072 (i : Fin 27) :
    forwardStepOK (-768) (charge 77 (397 + i.val)) shift
      (S (397 + i.val + 1)) (S 78) (T 77 (397 + i.val + 1))
      (T 77 (397 + i.val)) (T 78 (397 + i.val))
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1072.entries OriginalRow227TriangleForward1072.checked
    ⟨i.val, by rw [size1072]; exact i.isLt⟩
  change (entry1072 i).check = true at h
  rcases fields1072 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 77 ≤ d) (hhi : d < 424) :
    forwardStepOK (-768) (charge 77 d) shift (S (d + 1)) (S 78)
      (T 77 (d + 1)) (T 77 d) (T 78 d)
      (OriginalRow227Roots.root_pos 78 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 77 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    by_cases h141 : d < 141
    ·
      by_cases h109 : d < 109
      ·
        have hi : d - 77 < 32 := by omega
        have heq : 77 + (d - 77) = d := by omega
        simpa only [heq] using step1062 ⟨d - 77, hi⟩
      ·
        have hi : d - 109 < 32 := by omega
        have heq : 109 + (d - 109) = d := by omega
        simpa only [heq] using step1063 ⟨d - 109, hi⟩
    ·
      by_cases h173 : d < 173
      ·
        have hi : d - 141 < 32 := by omega
        have heq : 141 + (d - 141) = d := by omega
        simpa only [heq] using step1064 ⟨d - 141, hi⟩
      ·
        by_cases h205 : d < 205
        ·
          have hi : d - 173 < 32 := by omega
          have heq : 173 + (d - 173) = d := by omega
          simpa only [heq] using step1065 ⟨d - 173, hi⟩
        ·
          have hi : d - 205 < 32 := by omega
          have heq : 205 + (d - 205) = d := by omega
          simpa only [heq] using step1066 ⟨d - 205, hi⟩
  ·
    by_cases h333 : d < 333
    ·
      by_cases h269 : d < 269
      ·
        have hi : d - 237 < 32 := by omega
        have heq : 237 + (d - 237) = d := by omega
        simpa only [heq] using step1067 ⟨d - 237, hi⟩
      ·
        by_cases h301 : d < 301
        ·
          have hi : d - 269 < 32 := by omega
          have heq : 269 + (d - 269) = d := by omega
          simpa only [heq] using step1068 ⟨d - 269, hi⟩
        ·
          have hi : d - 301 < 32 := by omega
          have heq : 301 + (d - 301) = d := by omega
          simpa only [heq] using step1069 ⟨d - 301, hi⟩
    ·
      by_cases h365 : d < 365
      ·
        have hi : d - 333 < 32 := by omega
        have heq : 333 + (d - 333) = d := by omega
        simpa only [heq] using step1070 ⟨d - 333, hi⟩
      ·
        by_cases h397 : d < 397
        ·
          have hi : d - 365 < 32 := by omega
          have heq : 365 + (d - 365) = d := by omega
          simpa only [heq] using step1071 ⟨d - 365, hi⟩
        ·
          have hi : d - 397 < 27 := by omega
          have heq : 397 + (d - 397) = d := by omega
          simpa only [heq] using step1072 ⟨d - 397, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1062,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1062,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1063,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1063,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1064,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1064,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1065,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1065,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1066,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1066,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1067,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1067,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1068,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1068,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1069,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1069,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1070,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1070,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1071,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1071,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.fields1072,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.step1072,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow078
