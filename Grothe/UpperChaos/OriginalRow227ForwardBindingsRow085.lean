import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085
import Grothe.UpperChaos.OriginalRow227TriangleForward1139
import Grothe.UpperChaos.OriginalRow227TriangleForward1140
import Grothe.UpperChaos.OriginalRow227TriangleForward1141
import Grothe.UpperChaos.OriginalRow227TriangleForward1142
import Grothe.UpperChaos.OriginalRow227TriangleForward1143
import Grothe.UpperChaos.OriginalRow227TriangleForward1144
import Grothe.UpperChaos.OriginalRow227TriangleForward1145
import Grothe.UpperChaos.OriginalRow227TriangleForward1146
import Grothe.UpperChaos.OriginalRow227TriangleForward1147
import Grothe.UpperChaos.OriginalRow227TriangleForward1148
import Grothe.UpperChaos.OriginalRow227TriangleForward1149

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1139 : OriginalRow227TriangleForward1139.entries.size = 32 := rfl

def entry1139 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1139.entries[i.val]'(by rw [size1139]; exact i.isLt)

theorem fields1139 (i : Fin 32) :
    (entry1139 i).IA = shift ∧ (entry1139 i).ID = S (84 + i.val + 1) ∧
      (entry1139 i).IC = S 85 ∧ (entry1139 i).Inext = T 84 (84 + i.val + 1) ∧
      (entry1139 i).Icur = T 84 (84 + i.val) ∧
      (entry1139 i).output = T 85 (84 + i.val) ∧
      (entry1139 i).charge = charge 84 (84 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1139 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (84 + i.val)) shift
      (S (84 + i.val + 1)) (S 85) (T 84 (84 + i.val + 1))
      (T 84 (84 + i.val)) (T 85 (84 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1139.entries OriginalRow227TriangleForward1139.checked
    ⟨i.val, by rw [size1139]; exact i.isLt⟩
  change (entry1139 i).check = true at h
  rcases fields1139 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1140 : OriginalRow227TriangleForward1140.entries.size = 32 := rfl

def entry1140 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1140.entries[i.val]'(by rw [size1140]; exact i.isLt)

theorem fields1140 (i : Fin 32) :
    (entry1140 i).IA = shift ∧ (entry1140 i).ID = S (116 + i.val + 1) ∧
      (entry1140 i).IC = S 85 ∧ (entry1140 i).Inext = T 84 (116 + i.val + 1) ∧
      (entry1140 i).Icur = T 84 (116 + i.val) ∧
      (entry1140 i).output = T 85 (116 + i.val) ∧
      (entry1140 i).charge = charge 84 (116 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1140 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (116 + i.val)) shift
      (S (116 + i.val + 1)) (S 85) (T 84 (116 + i.val + 1))
      (T 84 (116 + i.val)) (T 85 (116 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1140.entries OriginalRow227TriangleForward1140.checked
    ⟨i.val, by rw [size1140]; exact i.isLt⟩
  change (entry1140 i).check = true at h
  rcases fields1140 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1141 : OriginalRow227TriangleForward1141.entries.size = 32 := rfl

def entry1141 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1141.entries[i.val]'(by rw [size1141]; exact i.isLt)

theorem fields1141 (i : Fin 32) :
    (entry1141 i).IA = shift ∧ (entry1141 i).ID = S (148 + i.val + 1) ∧
      (entry1141 i).IC = S 85 ∧ (entry1141 i).Inext = T 84 (148 + i.val + 1) ∧
      (entry1141 i).Icur = T 84 (148 + i.val) ∧
      (entry1141 i).output = T 85 (148 + i.val) ∧
      (entry1141 i).charge = charge 84 (148 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1141 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (148 + i.val)) shift
      (S (148 + i.val + 1)) (S 85) (T 84 (148 + i.val + 1))
      (T 84 (148 + i.val)) (T 85 (148 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1141.entries OriginalRow227TriangleForward1141.checked
    ⟨i.val, by rw [size1141]; exact i.isLt⟩
  change (entry1141 i).check = true at h
  rcases fields1141 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1142 : OriginalRow227TriangleForward1142.entries.size = 32 := rfl

def entry1142 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1142.entries[i.val]'(by rw [size1142]; exact i.isLt)

theorem fields1142 (i : Fin 32) :
    (entry1142 i).IA = shift ∧ (entry1142 i).ID = S (180 + i.val + 1) ∧
      (entry1142 i).IC = S 85 ∧ (entry1142 i).Inext = T 84 (180 + i.val + 1) ∧
      (entry1142 i).Icur = T 84 (180 + i.val) ∧
      (entry1142 i).output = T 85 (180 + i.val) ∧
      (entry1142 i).charge = charge 84 (180 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1142 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (180 + i.val)) shift
      (S (180 + i.val + 1)) (S 85) (T 84 (180 + i.val + 1))
      (T 84 (180 + i.val)) (T 85 (180 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1142.entries OriginalRow227TriangleForward1142.checked
    ⟨i.val, by rw [size1142]; exact i.isLt⟩
  change (entry1142 i).check = true at h
  rcases fields1142 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1143 : OriginalRow227TriangleForward1143.entries.size = 32 := rfl

def entry1143 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1143.entries[i.val]'(by rw [size1143]; exact i.isLt)

theorem fields1143 (i : Fin 32) :
    (entry1143 i).IA = shift ∧ (entry1143 i).ID = S (212 + i.val + 1) ∧
      (entry1143 i).IC = S 85 ∧ (entry1143 i).Inext = T 84 (212 + i.val + 1) ∧
      (entry1143 i).Icur = T 84 (212 + i.val) ∧
      (entry1143 i).output = T 85 (212 + i.val) ∧
      (entry1143 i).charge = charge 84 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1143 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 85) (T 84 (212 + i.val + 1))
      (T 84 (212 + i.val)) (T 85 (212 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1143.entries OriginalRow227TriangleForward1143.checked
    ⟨i.val, by rw [size1143]; exact i.isLt⟩
  change (entry1143 i).check = true at h
  rcases fields1143 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1144 : OriginalRow227TriangleForward1144.entries.size = 32 := rfl

def entry1144 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1144.entries[i.val]'(by rw [size1144]; exact i.isLt)

theorem fields1144 (i : Fin 32) :
    (entry1144 i).IA = shift ∧ (entry1144 i).ID = S (244 + i.val + 1) ∧
      (entry1144 i).IC = S 85 ∧ (entry1144 i).Inext = T 84 (244 + i.val + 1) ∧
      (entry1144 i).Icur = T 84 (244 + i.val) ∧
      (entry1144 i).output = T 85 (244 + i.val) ∧
      (entry1144 i).charge = charge 84 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1144 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 85) (T 84 (244 + i.val + 1))
      (T 84 (244 + i.val)) (T 85 (244 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1144.entries OriginalRow227TriangleForward1144.checked
    ⟨i.val, by rw [size1144]; exact i.isLt⟩
  change (entry1144 i).check = true at h
  rcases fields1144 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1145 : OriginalRow227TriangleForward1145.entries.size = 32 := rfl

def entry1145 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1145.entries[i.val]'(by rw [size1145]; exact i.isLt)

theorem fields1145 (i : Fin 32) :
    (entry1145 i).IA = shift ∧ (entry1145 i).ID = S (276 + i.val + 1) ∧
      (entry1145 i).IC = S 85 ∧ (entry1145 i).Inext = T 84 (276 + i.val + 1) ∧
      (entry1145 i).Icur = T 84 (276 + i.val) ∧
      (entry1145 i).output = T 85 (276 + i.val) ∧
      (entry1145 i).charge = charge 84 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1145 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 85) (T 84 (276 + i.val + 1))
      (T 84 (276 + i.val)) (T 85 (276 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1145.entries OriginalRow227TriangleForward1145.checked
    ⟨i.val, by rw [size1145]; exact i.isLt⟩
  change (entry1145 i).check = true at h
  rcases fields1145 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1146 : OriginalRow227TriangleForward1146.entries.size = 32 := rfl

def entry1146 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1146.entries[i.val]'(by rw [size1146]; exact i.isLt)

theorem fields1146 (i : Fin 32) :
    (entry1146 i).IA = shift ∧ (entry1146 i).ID = S (308 + i.val + 1) ∧
      (entry1146 i).IC = S 85 ∧ (entry1146 i).Inext = T 84 (308 + i.val + 1) ∧
      (entry1146 i).Icur = T 84 (308 + i.val) ∧
      (entry1146 i).output = T 85 (308 + i.val) ∧
      (entry1146 i).charge = charge 84 (308 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1146 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (308 + i.val)) shift
      (S (308 + i.val + 1)) (S 85) (T 84 (308 + i.val + 1))
      (T 84 (308 + i.val)) (T 85 (308 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1146.entries OriginalRow227TriangleForward1146.checked
    ⟨i.val, by rw [size1146]; exact i.isLt⟩
  change (entry1146 i).check = true at h
  rcases fields1146 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1147 : OriginalRow227TriangleForward1147.entries.size = 32 := rfl

def entry1147 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1147.entries[i.val]'(by rw [size1147]; exact i.isLt)

theorem fields1147 (i : Fin 32) :
    (entry1147 i).IA = shift ∧ (entry1147 i).ID = S (340 + i.val + 1) ∧
      (entry1147 i).IC = S 85 ∧ (entry1147 i).Inext = T 84 (340 + i.val + 1) ∧
      (entry1147 i).Icur = T 84 (340 + i.val) ∧
      (entry1147 i).output = T 85 (340 + i.val) ∧
      (entry1147 i).charge = charge 84 (340 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1147 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (340 + i.val)) shift
      (S (340 + i.val + 1)) (S 85) (T 84 (340 + i.val + 1))
      (T 84 (340 + i.val)) (T 85 (340 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1147.entries OriginalRow227TriangleForward1147.checked
    ⟨i.val, by rw [size1147]; exact i.isLt⟩
  change (entry1147 i).check = true at h
  rcases fields1147 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1148 : OriginalRow227TriangleForward1148.entries.size = 32 := rfl

def entry1148 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1148.entries[i.val]'(by rw [size1148]; exact i.isLt)

theorem fields1148 (i : Fin 32) :
    (entry1148 i).IA = shift ∧ (entry1148 i).ID = S (372 + i.val + 1) ∧
      (entry1148 i).IC = S 85 ∧ (entry1148 i).Inext = T 84 (372 + i.val + 1) ∧
      (entry1148 i).Icur = T 84 (372 + i.val) ∧
      (entry1148 i).output = T 85 (372 + i.val) ∧
      (entry1148 i).charge = charge 84 (372 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1148 (i : Fin 32) :
    forwardStepOK (-768) (charge 84 (372 + i.val)) shift
      (S (372 + i.val + 1)) (S 85) (T 84 (372 + i.val + 1))
      (T 84 (372 + i.val)) (T 85 (372 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1148.entries OriginalRow227TriangleForward1148.checked
    ⟨i.val, by rw [size1148]; exact i.isLt⟩
  change (entry1148 i).check = true at h
  rcases fields1148 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1149 : OriginalRow227TriangleForward1149.entries.size = 13 := rfl

def entry1149 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1149.entries[i.val]'(by rw [size1149]; exact i.isLt)

theorem fields1149 (i : Fin 13) :
    (entry1149 i).IA = shift ∧ (entry1149 i).ID = S (404 + i.val + 1) ∧
      (entry1149 i).IC = S 85 ∧ (entry1149 i).Inext = T 84 (404 + i.val + 1) ∧
      (entry1149 i).Icur = T 84 (404 + i.val) ∧
      (entry1149 i).output = T 85 (404 + i.val) ∧
      (entry1149 i).charge = charge 84 (404 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root85).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1149 (i : Fin 13) :
    forwardStepOK (-768) (charge 84 (404 + i.val)) shift
      (S (404 + i.val + 1)) (S 85) (T 84 (404 + i.val + 1))
      (T 84 (404 + i.val)) (T 85 (404 + i.val))
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1149.entries OriginalRow227TriangleForward1149.checked
    ⟨i.val, by rw [size1149]; exact i.isLt⟩
  change (entry1149 i).check = true at h
  rcases fields1149 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 84 ≤ d) (hhi : d < 417) :
    forwardStepOK (-768) (charge 84 d) shift (S (d + 1)) (S 85)
      (T 84 (d + 1)) (T 84 d) (T 85 d)
      (OriginalRow227Roots.root_pos 85 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 84 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    by_cases h148 : d < 148
    ·
      by_cases h116 : d < 116
      ·
        have hi : d - 84 < 32 := by omega
        have heq : 84 + (d - 84) = d := by omega
        simpa only [heq] using step1139 ⟨d - 84, hi⟩
      ·
        have hi : d - 116 < 32 := by omega
        have heq : 116 + (d - 116) = d := by omega
        simpa only [heq] using step1140 ⟨d - 116, hi⟩
    ·
      by_cases h180 : d < 180
      ·
        have hi : d - 148 < 32 := by omega
        have heq : 148 + (d - 148) = d := by omega
        simpa only [heq] using step1141 ⟨d - 148, hi⟩
      ·
        by_cases h212 : d < 212
        ·
          have hi : d - 180 < 32 := by omega
          have heq : 180 + (d - 180) = d := by omega
          simpa only [heq] using step1142 ⟨d - 180, hi⟩
        ·
          have hi : d - 212 < 32 := by omega
          have heq : 212 + (d - 212) = d := by omega
          simpa only [heq] using step1143 ⟨d - 212, hi⟩
  ·
    by_cases h340 : d < 340
    ·
      by_cases h276 : d < 276
      ·
        have hi : d - 244 < 32 := by omega
        have heq : 244 + (d - 244) = d := by omega
        simpa only [heq] using step1144 ⟨d - 244, hi⟩
      ·
        by_cases h308 : d < 308
        ·
          have hi : d - 276 < 32 := by omega
          have heq : 276 + (d - 276) = d := by omega
          simpa only [heq] using step1145 ⟨d - 276, hi⟩
        ·
          have hi : d - 308 < 32 := by omega
          have heq : 308 + (d - 308) = d := by omega
          simpa only [heq] using step1146 ⟨d - 308, hi⟩
    ·
      by_cases h372 : d < 372
      ·
        have hi : d - 340 < 32 := by omega
        have heq : 340 + (d - 340) = d := by omega
        simpa only [heq] using step1147 ⟨d - 340, hi⟩
      ·
        by_cases h404 : d < 404
        ·
          have hi : d - 372 < 32 := by omega
          have heq : 372 + (d - 372) = d := by omega
          simpa only [heq] using step1148 ⟨d - 372, hi⟩
        ·
          have hi : d - 404 < 13 := by omega
          have heq : 404 + (d - 404) = d := by omega
          simpa only [heq] using step1149 ⟨d - 404, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1139,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1139,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1140,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1140,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1141,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1141,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1142,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1142,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1143,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1143,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1144,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1144,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1145,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1145,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1146,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1146,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1147,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1147,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1148,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1148,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.fields1149,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.step1149,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow085
