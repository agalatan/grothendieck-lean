import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow085
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086
import Grothe.UpperChaos.OriginalRow227TriangleForward1150
import Grothe.UpperChaos.OriginalRow227TriangleForward1151
import Grothe.UpperChaos.OriginalRow227TriangleForward1152
import Grothe.UpperChaos.OriginalRow227TriangleForward1153
import Grothe.UpperChaos.OriginalRow227TriangleForward1154
import Grothe.UpperChaos.OriginalRow227TriangleForward1155
import Grothe.UpperChaos.OriginalRow227TriangleForward1156
import Grothe.UpperChaos.OriginalRow227TriangleForward1157
import Grothe.UpperChaos.OriginalRow227TriangleForward1158
import Grothe.UpperChaos.OriginalRow227TriangleForward1159
import Grothe.UpperChaos.OriginalRow227TriangleForward1160

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1150 : OriginalRow227TriangleForward1150.entries.size = 32 := rfl

def entry1150 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1150.entries[i.val]'(by rw [size1150]; exact i.isLt)

theorem fields1150 (i : Fin 32) :
    (entry1150 i).IA = shift ∧ (entry1150 i).ID = S (85 + i.val + 1) ∧
      (entry1150 i).IC = S 86 ∧ (entry1150 i).Inext = T 85 (85 + i.val + 1) ∧
      (entry1150 i).Icur = T 85 (85 + i.val) ∧
      (entry1150 i).output = T 86 (85 + i.val) ∧
      (entry1150 i).charge = charge 85 (85 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1155_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1150 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (85 + i.val)) shift
      (S (85 + i.val + 1)) (S 86) (T 85 (85 + i.val + 1))
      (T 85 (85 + i.val)) (T 86 (85 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1150.entries OriginalRow227TriangleForward1150.checked
    ⟨i.val, by rw [size1150]; exact i.isLt⟩
  change (entry1150 i).check = true at h
  rcases fields1150 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1151 : OriginalRow227TriangleForward1151.entries.size = 32 := rfl

def entry1151 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1151.entries[i.val]'(by rw [size1151]; exact i.isLt)

theorem fields1151 (i : Fin 32) :
    (entry1151 i).IA = shift ∧ (entry1151 i).ID = S (117 + i.val + 1) ∧
      (entry1151 i).IC = S 86 ∧ (entry1151 i).Inext = T 85 (117 + i.val + 1) ∧
      (entry1151 i).Icur = T 85 (117 + i.val) ∧
      (entry1151 i).output = T 86 (117 + i.val) ∧
      (entry1151 i).charge = charge 85 (117 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1156_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1151 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (117 + i.val)) shift
      (S (117 + i.val + 1)) (S 86) (T 85 (117 + i.val + 1))
      (T 85 (117 + i.val)) (T 86 (117 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1151.entries OriginalRow227TriangleForward1151.checked
    ⟨i.val, by rw [size1151]; exact i.isLt⟩
  change (entry1151 i).check = true at h
  rcases fields1151 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1152 : OriginalRow227TriangleForward1152.entries.size = 32 := rfl

def entry1152 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1152.entries[i.val]'(by rw [size1152]; exact i.isLt)

theorem fields1152 (i : Fin 32) :
    (entry1152 i).IA = shift ∧ (entry1152 i).ID = S (149 + i.val + 1) ∧
      (entry1152 i).IC = S 86 ∧ (entry1152 i).Inext = T 85 (149 + i.val + 1) ∧
      (entry1152 i).Icur = T 85 (149 + i.val) ∧
      (entry1152 i).output = T 86 (149 + i.val) ∧
      (entry1152 i).charge = charge 85 (149 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1157_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1152 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (149 + i.val)) shift
      (S (149 + i.val + 1)) (S 86) (T 85 (149 + i.val + 1))
      (T 85 (149 + i.val)) (T 86 (149 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1152.entries OriginalRow227TriangleForward1152.checked
    ⟨i.val, by rw [size1152]; exact i.isLt⟩
  change (entry1152 i).check = true at h
  rcases fields1152 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1153 : OriginalRow227TriangleForward1153.entries.size = 32 := rfl

def entry1153 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1153.entries[i.val]'(by rw [size1153]; exact i.isLt)

theorem fields1153 (i : Fin 32) :
    (entry1153 i).IA = shift ∧ (entry1153 i).ID = S (181 + i.val + 1) ∧
      (entry1153 i).IC = S 86 ∧ (entry1153 i).Inext = T 85 (181 + i.val + 1) ∧
      (entry1153 i).Icur = T 85 (181 + i.val) ∧
      (entry1153 i).output = T 86 (181 + i.val) ∧
      (entry1153 i).charge = charge 85 (181 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1158_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1153 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (181 + i.val)) shift
      (S (181 + i.val + 1)) (S 86) (T 85 (181 + i.val + 1))
      (T 85 (181 + i.val)) (T 86 (181 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1153.entries OriginalRow227TriangleForward1153.checked
    ⟨i.val, by rw [size1153]; exact i.isLt⟩
  change (entry1153 i).check = true at h
  rcases fields1153 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1154 : OriginalRow227TriangleForward1154.entries.size = 32 := rfl

def entry1154 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1154.entries[i.val]'(by rw [size1154]; exact i.isLt)

theorem fields1154 (i : Fin 32) :
    (entry1154 i).IA = shift ∧ (entry1154 i).ID = S (213 + i.val + 1) ∧
      (entry1154 i).IC = S 86 ∧ (entry1154 i).Inext = T 85 (213 + i.val + 1) ∧
      (entry1154 i).Icur = T 85 (213 + i.val) ∧
      (entry1154 i).output = T 86 (213 + i.val) ∧
      (entry1154 i).charge = charge 85 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1159_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1154 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 86) (T 85 (213 + i.val + 1))
      (T 85 (213 + i.val)) (T 86 (213 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1154.entries OriginalRow227TriangleForward1154.checked
    ⟨i.val, by rw [size1154]; exact i.isLt⟩
  change (entry1154 i).check = true at h
  rcases fields1154 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1155 : OriginalRow227TriangleForward1155.entries.size = 32 := rfl

def entry1155 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1155.entries[i.val]'(by rw [size1155]; exact i.isLt)

theorem fields1155 (i : Fin 32) :
    (entry1155 i).IA = shift ∧ (entry1155 i).ID = S (245 + i.val + 1) ∧
      (entry1155 i).IC = S 86 ∧ (entry1155 i).Inext = T 85 (245 + i.val + 1) ∧
      (entry1155 i).Icur = T 85 (245 + i.val) ∧
      (entry1155 i).output = T 86 (245 + i.val) ∧
      (entry1155 i).charge = charge 85 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1160_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1155 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 86) (T 85 (245 + i.val + 1))
      (T 85 (245 + i.val)) (T 86 (245 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1155.entries OriginalRow227TriangleForward1155.checked
    ⟨i.val, by rw [size1155]; exact i.isLt⟩
  change (entry1155 i).check = true at h
  rcases fields1155 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1156 : OriginalRow227TriangleForward1156.entries.size = 32 := rfl

def entry1156 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1156.entries[i.val]'(by rw [size1156]; exact i.isLt)

theorem fields1156 (i : Fin 32) :
    (entry1156 i).IA = shift ∧ (entry1156 i).ID = S (277 + i.val + 1) ∧
      (entry1156 i).IC = S 86 ∧ (entry1156 i).Inext = T 85 (277 + i.val + 1) ∧
      (entry1156 i).Icur = T 85 (277 + i.val) ∧
      (entry1156 i).output = T 86 (277 + i.val) ∧
      (entry1156 i).charge = charge 85 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1161_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1156 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 86) (T 85 (277 + i.val + 1))
      (T 85 (277 + i.val)) (T 86 (277 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1156.entries OriginalRow227TriangleForward1156.checked
    ⟨i.val, by rw [size1156]; exact i.isLt⟩
  change (entry1156 i).check = true at h
  rcases fields1156 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1157 : OriginalRow227TriangleForward1157.entries.size = 32 := rfl

def entry1157 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1157.entries[i.val]'(by rw [size1157]; exact i.isLt)

theorem fields1157 (i : Fin 32) :
    (entry1157 i).IA = shift ∧ (entry1157 i).ID = S (309 + i.val + 1) ∧
      (entry1157 i).IC = S 86 ∧ (entry1157 i).Inext = T 85 (309 + i.val + 1) ∧
      (entry1157 i).Icur = T 85 (309 + i.val) ∧
      (entry1157 i).output = T 86 (309 + i.val) ∧
      (entry1157 i).charge = charge 85 (309 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1162_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1157 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (309 + i.val)) shift
      (S (309 + i.val + 1)) (S 86) (T 85 (309 + i.val + 1))
      (T 85 (309 + i.val)) (T 86 (309 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1157.entries OriginalRow227TriangleForward1157.checked
    ⟨i.val, by rw [size1157]; exact i.isLt⟩
  change (entry1157 i).check = true at h
  rcases fields1157 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1158 : OriginalRow227TriangleForward1158.entries.size = 32 := rfl

def entry1158 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1158.entries[i.val]'(by rw [size1158]; exact i.isLt)

theorem fields1158 (i : Fin 32) :
    (entry1158 i).IA = shift ∧ (entry1158 i).ID = S (341 + i.val + 1) ∧
      (entry1158 i).IC = S 86 ∧ (entry1158 i).Inext = T 85 (341 + i.val + 1) ∧
      (entry1158 i).Icur = T 85 (341 + i.val) ∧
      (entry1158 i).output = T 86 (341 + i.val) ∧
      (entry1158 i).charge = charge 85 (341 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1163_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1158 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (341 + i.val)) shift
      (S (341 + i.val + 1)) (S 86) (T 85 (341 + i.val + 1))
      (T 85 (341 + i.val)) (T 86 (341 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1158.entries OriginalRow227TriangleForward1158.checked
    ⟨i.val, by rw [size1158]; exact i.isLt⟩
  change (entry1158 i).check = true at h
  rcases fields1158 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1159 : OriginalRow227TriangleForward1159.entries.size = 32 := rfl

def entry1159 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1159.entries[i.val]'(by rw [size1159]; exact i.isLt)

theorem fields1159 (i : Fin 32) :
    (entry1159 i).IA = shift ∧ (entry1159 i).ID = S (373 + i.val + 1) ∧
      (entry1159 i).IC = S 86 ∧ (entry1159 i).Inext = T 85 (373 + i.val + 1) ∧
      (entry1159 i).Icur = T 85 (373 + i.val) ∧
      (entry1159 i).output = T 86 (373 + i.val) ∧
      (entry1159 i).charge = charge 85 (373 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1164_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1159 (i : Fin 32) :
    forwardStepOK (-768) (charge 85 (373 + i.val)) shift
      (S (373 + i.val + 1)) (S 86) (T 85 (373 + i.val + 1))
      (T 85 (373 + i.val)) (T 86 (373 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1159.entries OriginalRow227TriangleForward1159.checked
    ⟨i.val, by rw [size1159]; exact i.isLt⟩
  change (entry1159 i).check = true at h
  rcases fields1159 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1160 : OriginalRow227TriangleForward1160.entries.size = 11 := rfl

def entry1160 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1160.entries[i.val]'(by rw [size1160]; exact i.isLt)

theorem fields1160 (i : Fin 11) :
    (entry1160 i).IA = shift ∧ (entry1160 i).ID = S (405 + i.val + 1) ∧
      (entry1160 i).IC = S 86 ∧ (entry1160 i).Inext = T 85 (405 + i.val + 1) ∧
      (entry1160 i).Icur = T 85 (405 + i.val) ∧
      (entry1160 i).output = T 86 (405 + i.val) ∧
      (entry1160 i).charge = charge 85 (405 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root86).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow085.block1165_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1160 (i : Fin 11) :
    forwardStepOK (-768) (charge 85 (405 + i.val)) shift
      (S (405 + i.val + 1)) (S 86) (T 85 (405 + i.val + 1))
      (T 85 (405 + i.val)) (T 86 (405 + i.val))
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1160.entries OriginalRow227TriangleForward1160.checked
    ⟨i.val, by rw [size1160]; exact i.isLt⟩
  change (entry1160 i).check = true at h
  rcases fields1160 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 85 ≤ d) (hhi : d < 416) :
    forwardStepOK (-768) (charge 85 d) shift (S (d + 1)) (S 86)
      (T 85 (d + 1)) (T 85 d) (T 86 d)
      (OriginalRow227Roots.root_pos 86 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 85 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    by_cases h149 : d < 149
    ·
      by_cases h117 : d < 117
      ·
        have hi : d - 85 < 32 := by omega
        have heq : 85 + (d - 85) = d := by omega
        simpa only [heq] using step1150 ⟨d - 85, hi⟩
      ·
        have hi : d - 117 < 32 := by omega
        have heq : 117 + (d - 117) = d := by omega
        simpa only [heq] using step1151 ⟨d - 117, hi⟩
    ·
      by_cases h181 : d < 181
      ·
        have hi : d - 149 < 32 := by omega
        have heq : 149 + (d - 149) = d := by omega
        simpa only [heq] using step1152 ⟨d - 149, hi⟩
      ·
        by_cases h213 : d < 213
        ·
          have hi : d - 181 < 32 := by omega
          have heq : 181 + (d - 181) = d := by omega
          simpa only [heq] using step1153 ⟨d - 181, hi⟩
        ·
          have hi : d - 213 < 32 := by omega
          have heq : 213 + (d - 213) = d := by omega
          simpa only [heq] using step1154 ⟨d - 213, hi⟩
  ·
    by_cases h341 : d < 341
    ·
      by_cases h277 : d < 277
      ·
        have hi : d - 245 < 32 := by omega
        have heq : 245 + (d - 245) = d := by omega
        simpa only [heq] using step1155 ⟨d - 245, hi⟩
      ·
        by_cases h309 : d < 309
        ·
          have hi : d - 277 < 32 := by omega
          have heq : 277 + (d - 277) = d := by omega
          simpa only [heq] using step1156 ⟨d - 277, hi⟩
        ·
          have hi : d - 309 < 32 := by omega
          have heq : 309 + (d - 309) = d := by omega
          simpa only [heq] using step1157 ⟨d - 309, hi⟩
    ·
      by_cases h373 : d < 373
      ·
        have hi : d - 341 < 32 := by omega
        have heq : 341 + (d - 341) = d := by omega
        simpa only [heq] using step1158 ⟨d - 341, hi⟩
      ·
        by_cases h405 : d < 405
        ·
          have hi : d - 373 < 32 := by omega
          have heq : 373 + (d - 373) = d := by omega
          simpa only [heq] using step1159 ⟨d - 373, hi⟩
        ·
          have hi : d - 405 < 11 := by omega
          have heq : 405 + (d - 405) = d := by omega
          simpa only [heq] using step1160 ⟨d - 405, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1150,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1150,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1151,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1151,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1152,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1152,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1153,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1153,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1154,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1154,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1155,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1155,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1156,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1156,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1157,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1157,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1158,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1158,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1159,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1159,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.fields1160,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.step1160,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow086
