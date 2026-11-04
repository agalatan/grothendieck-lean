import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow079
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow080
import Grothe.UpperChaos.OriginalRow227TriangleForward1084
import Grothe.UpperChaos.OriginalRow227TriangleForward1085
import Grothe.UpperChaos.OriginalRow227TriangleForward1086
import Grothe.UpperChaos.OriginalRow227TriangleForward1087
import Grothe.UpperChaos.OriginalRow227TriangleForward1088
import Grothe.UpperChaos.OriginalRow227TriangleForward1089
import Grothe.UpperChaos.OriginalRow227TriangleForward1090
import Grothe.UpperChaos.OriginalRow227TriangleForward1091
import Grothe.UpperChaos.OriginalRow227TriangleForward1092
import Grothe.UpperChaos.OriginalRow227TriangleForward1093
import Grothe.UpperChaos.OriginalRow227TriangleForward1094

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1084 : OriginalRow227TriangleForward1084.entries.size = 32 := rfl

def entry1084 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1084.entries[i.val]'(by rw [size1084]; exact i.isLt)

theorem fields1084 (i : Fin 32) :
    (entry1084 i).IA = shift ∧ (entry1084 i).ID = S (79 + i.val + 1) ∧
      (entry1084 i).IC = S 80 ∧ (entry1084 i).Inext = T 79 (79 + i.val + 1) ∧
      (entry1084 i).Icur = T 79 (79 + i.val) ∧
      (entry1084 i).output = T 80 (79 + i.val) ∧
      (entry1084 i).charge = charge 79 (79 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1089_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1100_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1084 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (79 + i.val)) shift
      (S (79 + i.val + 1)) (S 80) (T 79 (79 + i.val + 1))
      (T 79 (79 + i.val)) (T 80 (79 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1084.entries OriginalRow227TriangleForward1084.checked
    ⟨i.val, by rw [size1084]; exact i.isLt⟩
  change (entry1084 i).check = true at h
  rcases fields1084 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1085 : OriginalRow227TriangleForward1085.entries.size = 32 := rfl

def entry1085 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1085.entries[i.val]'(by rw [size1085]; exact i.isLt)

theorem fields1085 (i : Fin 32) :
    (entry1085 i).IA = shift ∧ (entry1085 i).ID = S (111 + i.val + 1) ∧
      (entry1085 i).IC = S 80 ∧ (entry1085 i).Inext = T 79 (111 + i.val + 1) ∧
      (entry1085 i).Icur = T 79 (111 + i.val) ∧
      (entry1085 i).output = T 80 (111 + i.val) ∧
      (entry1085 i).charge = charge 79 (111 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1090_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1101_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1085 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (111 + i.val)) shift
      (S (111 + i.val + 1)) (S 80) (T 79 (111 + i.val + 1))
      (T 79 (111 + i.val)) (T 80 (111 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1085.entries OriginalRow227TriangleForward1085.checked
    ⟨i.val, by rw [size1085]; exact i.isLt⟩
  change (entry1085 i).check = true at h
  rcases fields1085 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1086 : OriginalRow227TriangleForward1086.entries.size = 32 := rfl

def entry1086 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1086.entries[i.val]'(by rw [size1086]; exact i.isLt)

theorem fields1086 (i : Fin 32) :
    (entry1086 i).IA = shift ∧ (entry1086 i).ID = S (143 + i.val + 1) ∧
      (entry1086 i).IC = S 80 ∧ (entry1086 i).Inext = T 79 (143 + i.val + 1) ∧
      (entry1086 i).Icur = T 79 (143 + i.val) ∧
      (entry1086 i).output = T 80 (143 + i.val) ∧
      (entry1086 i).charge = charge 79 (143 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1091_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1102_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1086 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (143 + i.val)) shift
      (S (143 + i.val + 1)) (S 80) (T 79 (143 + i.val + 1))
      (T 79 (143 + i.val)) (T 80 (143 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1086.entries OriginalRow227TriangleForward1086.checked
    ⟨i.val, by rw [size1086]; exact i.isLt⟩
  change (entry1086 i).check = true at h
  rcases fields1086 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1087 : OriginalRow227TriangleForward1087.entries.size = 32 := rfl

def entry1087 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1087.entries[i.val]'(by rw [size1087]; exact i.isLt)

theorem fields1087 (i : Fin 32) :
    (entry1087 i).IA = shift ∧ (entry1087 i).ID = S (175 + i.val + 1) ∧
      (entry1087 i).IC = S 80 ∧ (entry1087 i).Inext = T 79 (175 + i.val + 1) ∧
      (entry1087 i).Icur = T 79 (175 + i.val) ∧
      (entry1087 i).output = T 80 (175 + i.val) ∧
      (entry1087 i).charge = charge 79 (175 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1092_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1103_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1087 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (175 + i.val)) shift
      (S (175 + i.val + 1)) (S 80) (T 79 (175 + i.val + 1))
      (T 79 (175 + i.val)) (T 80 (175 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1087.entries OriginalRow227TriangleForward1087.checked
    ⟨i.val, by rw [size1087]; exact i.isLt⟩
  change (entry1087 i).check = true at h
  rcases fields1087 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1088 : OriginalRow227TriangleForward1088.entries.size = 32 := rfl

def entry1088 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1088.entries[i.val]'(by rw [size1088]; exact i.isLt)

theorem fields1088 (i : Fin 32) :
    (entry1088 i).IA = shift ∧ (entry1088 i).ID = S (207 + i.val + 1) ∧
      (entry1088 i).IC = S 80 ∧ (entry1088 i).Inext = T 79 (207 + i.val + 1) ∧
      (entry1088 i).Icur = T 79 (207 + i.val) ∧
      (entry1088 i).output = T 80 (207 + i.val) ∧
      (entry1088 i).charge = charge 79 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1093_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1104_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1088 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 80) (T 79 (207 + i.val + 1))
      (T 79 (207 + i.val)) (T 80 (207 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1088.entries OriginalRow227TriangleForward1088.checked
    ⟨i.val, by rw [size1088]; exact i.isLt⟩
  change (entry1088 i).check = true at h
  rcases fields1088 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1089 : OriginalRow227TriangleForward1089.entries.size = 32 := rfl

def entry1089 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1089.entries[i.val]'(by rw [size1089]; exact i.isLt)

theorem fields1089 (i : Fin 32) :
    (entry1089 i).IA = shift ∧ (entry1089 i).ID = S (239 + i.val + 1) ∧
      (entry1089 i).IC = S 80 ∧ (entry1089 i).Inext = T 79 (239 + i.val + 1) ∧
      (entry1089 i).Icur = T 79 (239 + i.val) ∧
      (entry1089 i).output = T 80 (239 + i.val) ∧
      (entry1089 i).charge = charge 79 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1094_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1105_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1089 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 80) (T 79 (239 + i.val + 1))
      (T 79 (239 + i.val)) (T 80 (239 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1089.entries OriginalRow227TriangleForward1089.checked
    ⟨i.val, by rw [size1089]; exact i.isLt⟩
  change (entry1089 i).check = true at h
  rcases fields1089 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1090 : OriginalRow227TriangleForward1090.entries.size = 32 := rfl

def entry1090 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1090.entries[i.val]'(by rw [size1090]; exact i.isLt)

theorem fields1090 (i : Fin 32) :
    (entry1090 i).IA = shift ∧ (entry1090 i).ID = S (271 + i.val + 1) ∧
      (entry1090 i).IC = S 80 ∧ (entry1090 i).Inext = T 79 (271 + i.val + 1) ∧
      (entry1090 i).Icur = T 79 (271 + i.val) ∧
      (entry1090 i).output = T 80 (271 + i.val) ∧
      (entry1090 i).charge = charge 79 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1095_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1106_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1090 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 80) (T 79 (271 + i.val + 1))
      (T 79 (271 + i.val)) (T 80 (271 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1090.entries OriginalRow227TriangleForward1090.checked
    ⟨i.val, by rw [size1090]; exact i.isLt⟩
  change (entry1090 i).check = true at h
  rcases fields1090 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1091 : OriginalRow227TriangleForward1091.entries.size = 32 := rfl

def entry1091 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1091.entries[i.val]'(by rw [size1091]; exact i.isLt)

theorem fields1091 (i : Fin 32) :
    (entry1091 i).IA = shift ∧ (entry1091 i).ID = S (303 + i.val + 1) ∧
      (entry1091 i).IC = S 80 ∧ (entry1091 i).Inext = T 79 (303 + i.val + 1) ∧
      (entry1091 i).Icur = T 79 (303 + i.val) ∧
      (entry1091 i).output = T 80 (303 + i.val) ∧
      (entry1091 i).charge = charge 79 (303 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1096_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1107_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1091 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (303 + i.val)) shift
      (S (303 + i.val + 1)) (S 80) (T 79 (303 + i.val + 1))
      (T 79 (303 + i.val)) (T 80 (303 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1091.entries OriginalRow227TriangleForward1091.checked
    ⟨i.val, by rw [size1091]; exact i.isLt⟩
  change (entry1091 i).check = true at h
  rcases fields1091 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1092 : OriginalRow227TriangleForward1092.entries.size = 32 := rfl

def entry1092 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1092.entries[i.val]'(by rw [size1092]; exact i.isLt)

theorem fields1092 (i : Fin 32) :
    (entry1092 i).IA = shift ∧ (entry1092 i).ID = S (335 + i.val + 1) ∧
      (entry1092 i).IC = S 80 ∧ (entry1092 i).Inext = T 79 (335 + i.val + 1) ∧
      (entry1092 i).Icur = T 79 (335 + i.val) ∧
      (entry1092 i).output = T 80 (335 + i.val) ∧
      (entry1092 i).charge = charge 79 (335 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1097_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1108_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1092 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (335 + i.val)) shift
      (S (335 + i.val + 1)) (S 80) (T 79 (335 + i.val + 1))
      (T 79 (335 + i.val)) (T 80 (335 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1092.entries OriginalRow227TriangleForward1092.checked
    ⟨i.val, by rw [size1092]; exact i.isLt⟩
  change (entry1092 i).check = true at h
  rcases fields1092 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1093 : OriginalRow227TriangleForward1093.entries.size = 32 := rfl

def entry1093 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1093.entries[i.val]'(by rw [size1093]; exact i.isLt)

theorem fields1093 (i : Fin 32) :
    (entry1093 i).IA = shift ∧ (entry1093 i).ID = S (367 + i.val + 1) ∧
      (entry1093 i).IC = S 80 ∧ (entry1093 i).Inext = T 79 (367 + i.val + 1) ∧
      (entry1093 i).Icur = T 79 (367 + i.val) ∧
      (entry1093 i).output = T 80 (367 + i.val) ∧
      (entry1093 i).charge = charge 79 (367 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1098_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1109_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1093 (i : Fin 32) :
    forwardStepOK (-768) (charge 79 (367 + i.val)) shift
      (S (367 + i.val + 1)) (S 80) (T 79 (367 + i.val + 1))
      (T 79 (367 + i.val)) (T 80 (367 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1093.entries OriginalRow227TriangleForward1093.checked
    ⟨i.val, by rw [size1093]; exact i.isLt⟩
  change (entry1093 i).check = true at h
  rcases fields1093 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1094 : OriginalRow227TriangleForward1094.entries.size = 23 := rfl

def entry1094 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1094.entries[i.val]'(by rw [size1094]; exact i.isLt)

theorem fields1094 (i : Fin 23) :
    (entry1094 i).IA = shift ∧ (entry1094 i).ID = S (399 + i.val + 1) ∧
      (entry1094 i).IC = S 80 ∧ (entry1094 i).Inext = T 79 (399 + i.val + 1) ∧
      (entry1094 i).Icur = T 79 (399 + i.val) ∧
      (entry1094 i).output = T 80 (399 + i.val) ∧
      (entry1094 i).charge = charge 79 (399 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root80).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow079.block1099_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow080.block1110_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1094 (i : Fin 23) :
    forwardStepOK (-768) (charge 79 (399 + i.val)) shift
      (S (399 + i.val + 1)) (S 80) (T 79 (399 + i.val + 1))
      (T 79 (399 + i.val)) (T 80 (399 + i.val))
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1094.entries OriginalRow227TriangleForward1094.checked
    ⟨i.val, by rw [size1094]; exact i.isLt⟩
  change (entry1094 i).check = true at h
  rcases fields1094 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 79 ≤ d) (hhi : d < 422) :
    forwardStepOK (-768) (charge 79 d) shift (S (d + 1)) (S 80)
      (T 79 (d + 1)) (T 79 d) (T 80 d)
      (OriginalRow227Roots.root_pos 80 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 79 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    by_cases h143 : d < 143
    ·
      by_cases h111 : d < 111
      ·
        have hi : d - 79 < 32 := by omega
        have heq : 79 + (d - 79) = d := by omega
        simpa only [heq] using step1084 ⟨d - 79, hi⟩
      ·
        have hi : d - 111 < 32 := by omega
        have heq : 111 + (d - 111) = d := by omega
        simpa only [heq] using step1085 ⟨d - 111, hi⟩
    ·
      by_cases h175 : d < 175
      ·
        have hi : d - 143 < 32 := by omega
        have heq : 143 + (d - 143) = d := by omega
        simpa only [heq] using step1086 ⟨d - 143, hi⟩
      ·
        by_cases h207 : d < 207
        ·
          have hi : d - 175 < 32 := by omega
          have heq : 175 + (d - 175) = d := by omega
          simpa only [heq] using step1087 ⟨d - 175, hi⟩
        ·
          have hi : d - 207 < 32 := by omega
          have heq : 207 + (d - 207) = d := by omega
          simpa only [heq] using step1088 ⟨d - 207, hi⟩
  ·
    by_cases h335 : d < 335
    ·
      by_cases h271 : d < 271
      ·
        have hi : d - 239 < 32 := by omega
        have heq : 239 + (d - 239) = d := by omega
        simpa only [heq] using step1089 ⟨d - 239, hi⟩
      ·
        by_cases h303 : d < 303
        ·
          have hi : d - 271 < 32 := by omega
          have heq : 271 + (d - 271) = d := by omega
          simpa only [heq] using step1090 ⟨d - 271, hi⟩
        ·
          have hi : d - 303 < 32 := by omega
          have heq : 303 + (d - 303) = d := by omega
          simpa only [heq] using step1091 ⟨d - 303, hi⟩
    ·
      by_cases h367 : d < 367
      ·
        have hi : d - 335 < 32 := by omega
        have heq : 335 + (d - 335) = d := by omega
        simpa only [heq] using step1092 ⟨d - 335, hi⟩
      ·
        by_cases h399 : d < 399
        ·
          have hi : d - 367 < 32 := by omega
          have heq : 367 + (d - 367) = d := by omega
          simpa only [heq] using step1093 ⟨d - 367, hi⟩
        ·
          have hi : d - 399 < 23 := by omega
          have heq : 399 + (d - 399) = d := by omega
          simpa only [heq] using step1094 ⟨d - 399, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1084,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1084,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1085,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1085,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1086,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1086,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1087,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1087,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1088,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1088,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1089,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1089,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1090,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1090,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1091,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1091,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1092,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1092,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1093,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1093,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.fields1094,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.step1094,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow080
