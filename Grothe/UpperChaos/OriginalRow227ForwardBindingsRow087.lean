import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow086
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087
import Grothe.UpperChaos.OriginalRow227TriangleForward1161
import Grothe.UpperChaos.OriginalRow227TriangleForward1162
import Grothe.UpperChaos.OriginalRow227TriangleForward1163
import Grothe.UpperChaos.OriginalRow227TriangleForward1164
import Grothe.UpperChaos.OriginalRow227TriangleForward1165
import Grothe.UpperChaos.OriginalRow227TriangleForward1166
import Grothe.UpperChaos.OriginalRow227TriangleForward1167
import Grothe.UpperChaos.OriginalRow227TriangleForward1168
import Grothe.UpperChaos.OriginalRow227TriangleForward1169
import Grothe.UpperChaos.OriginalRow227TriangleForward1170
import Grothe.UpperChaos.OriginalRow227TriangleForward1171

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1161 : OriginalRow227TriangleForward1161.entries.size = 32 := rfl

def entry1161 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1161.entries[i.val]'(by rw [size1161]; exact i.isLt)

theorem fields1161 (i : Fin 32) :
    (entry1161 i).IA = shift ∧ (entry1161 i).ID = S (86 + i.val + 1) ∧
      (entry1161 i).IC = S 87 ∧ (entry1161 i).Inext = T 86 (86 + i.val + 1) ∧
      (entry1161 i).Icur = T 86 (86 + i.val) ∧
      (entry1161 i).output = T 87 (86 + i.val) ∧
      (entry1161 i).charge = charge 86 (86 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1166_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1161 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (86 + i.val)) shift
      (S (86 + i.val + 1)) (S 87) (T 86 (86 + i.val + 1))
      (T 86 (86 + i.val)) (T 87 (86 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1161.entries OriginalRow227TriangleForward1161.checked
    ⟨i.val, by rw [size1161]; exact i.isLt⟩
  change (entry1161 i).check = true at h
  rcases fields1161 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1162 : OriginalRow227TriangleForward1162.entries.size = 32 := rfl

def entry1162 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1162.entries[i.val]'(by rw [size1162]; exact i.isLt)

theorem fields1162 (i : Fin 32) :
    (entry1162 i).IA = shift ∧ (entry1162 i).ID = S (118 + i.val + 1) ∧
      (entry1162 i).IC = S 87 ∧ (entry1162 i).Inext = T 86 (118 + i.val + 1) ∧
      (entry1162 i).Icur = T 86 (118 + i.val) ∧
      (entry1162 i).output = T 87 (118 + i.val) ∧
      (entry1162 i).charge = charge 86 (118 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1167_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1162 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (118 + i.val)) shift
      (S (118 + i.val + 1)) (S 87) (T 86 (118 + i.val + 1))
      (T 86 (118 + i.val)) (T 87 (118 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1162.entries OriginalRow227TriangleForward1162.checked
    ⟨i.val, by rw [size1162]; exact i.isLt⟩
  change (entry1162 i).check = true at h
  rcases fields1162 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1163 : OriginalRow227TriangleForward1163.entries.size = 32 := rfl

def entry1163 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1163.entries[i.val]'(by rw [size1163]; exact i.isLt)

theorem fields1163 (i : Fin 32) :
    (entry1163 i).IA = shift ∧ (entry1163 i).ID = S (150 + i.val + 1) ∧
      (entry1163 i).IC = S 87 ∧ (entry1163 i).Inext = T 86 (150 + i.val + 1) ∧
      (entry1163 i).Icur = T 86 (150 + i.val) ∧
      (entry1163 i).output = T 87 (150 + i.val) ∧
      (entry1163 i).charge = charge 86 (150 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1168_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1163 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (150 + i.val)) shift
      (S (150 + i.val + 1)) (S 87) (T 86 (150 + i.val + 1))
      (T 86 (150 + i.val)) (T 87 (150 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1163.entries OriginalRow227TriangleForward1163.checked
    ⟨i.val, by rw [size1163]; exact i.isLt⟩
  change (entry1163 i).check = true at h
  rcases fields1163 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1164 : OriginalRow227TriangleForward1164.entries.size = 32 := rfl

def entry1164 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1164.entries[i.val]'(by rw [size1164]; exact i.isLt)

theorem fields1164 (i : Fin 32) :
    (entry1164 i).IA = shift ∧ (entry1164 i).ID = S (182 + i.val + 1) ∧
      (entry1164 i).IC = S 87 ∧ (entry1164 i).Inext = T 86 (182 + i.val + 1) ∧
      (entry1164 i).Icur = T 86 (182 + i.val) ∧
      (entry1164 i).output = T 87 (182 + i.val) ∧
      (entry1164 i).charge = charge 86 (182 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1169_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1164 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (182 + i.val)) shift
      (S (182 + i.val + 1)) (S 87) (T 86 (182 + i.val + 1))
      (T 86 (182 + i.val)) (T 87 (182 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1164.entries OriginalRow227TriangleForward1164.checked
    ⟨i.val, by rw [size1164]; exact i.isLt⟩
  change (entry1164 i).check = true at h
  rcases fields1164 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1165 : OriginalRow227TriangleForward1165.entries.size = 32 := rfl

def entry1165 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1165.entries[i.val]'(by rw [size1165]; exact i.isLt)

theorem fields1165 (i : Fin 32) :
    (entry1165 i).IA = shift ∧ (entry1165 i).ID = S (214 + i.val + 1) ∧
      (entry1165 i).IC = S 87 ∧ (entry1165 i).Inext = T 86 (214 + i.val + 1) ∧
      (entry1165 i).Icur = T 86 (214 + i.val) ∧
      (entry1165 i).output = T 87 (214 + i.val) ∧
      (entry1165 i).charge = charge 86 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1170_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1165 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 87) (T 86 (214 + i.val + 1))
      (T 86 (214 + i.val)) (T 87 (214 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1165.entries OriginalRow227TriangleForward1165.checked
    ⟨i.val, by rw [size1165]; exact i.isLt⟩
  change (entry1165 i).check = true at h
  rcases fields1165 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1166 : OriginalRow227TriangleForward1166.entries.size = 32 := rfl

def entry1166 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1166.entries[i.val]'(by rw [size1166]; exact i.isLt)

theorem fields1166 (i : Fin 32) :
    (entry1166 i).IA = shift ∧ (entry1166 i).ID = S (246 + i.val + 1) ∧
      (entry1166 i).IC = S 87 ∧ (entry1166 i).Inext = T 86 (246 + i.val + 1) ∧
      (entry1166 i).Icur = T 86 (246 + i.val) ∧
      (entry1166 i).output = T 87 (246 + i.val) ∧
      (entry1166 i).charge = charge 86 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1171_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1166 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 87) (T 86 (246 + i.val + 1))
      (T 86 (246 + i.val)) (T 87 (246 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1166.entries OriginalRow227TriangleForward1166.checked
    ⟨i.val, by rw [size1166]; exact i.isLt⟩
  change (entry1166 i).check = true at h
  rcases fields1166 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1167 : OriginalRow227TriangleForward1167.entries.size = 32 := rfl

def entry1167 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1167.entries[i.val]'(by rw [size1167]; exact i.isLt)

theorem fields1167 (i : Fin 32) :
    (entry1167 i).IA = shift ∧ (entry1167 i).ID = S (278 + i.val + 1) ∧
      (entry1167 i).IC = S 87 ∧ (entry1167 i).Inext = T 86 (278 + i.val + 1) ∧
      (entry1167 i).Icur = T 86 (278 + i.val) ∧
      (entry1167 i).output = T 87 (278 + i.val) ∧
      (entry1167 i).charge = charge 86 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1172_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1167 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 87) (T 86 (278 + i.val + 1))
      (T 86 (278 + i.val)) (T 87 (278 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1167.entries OriginalRow227TriangleForward1167.checked
    ⟨i.val, by rw [size1167]; exact i.isLt⟩
  change (entry1167 i).check = true at h
  rcases fields1167 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1168 : OriginalRow227TriangleForward1168.entries.size = 32 := rfl

def entry1168 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1168.entries[i.val]'(by rw [size1168]; exact i.isLt)

theorem fields1168 (i : Fin 32) :
    (entry1168 i).IA = shift ∧ (entry1168 i).ID = S (310 + i.val + 1) ∧
      (entry1168 i).IC = S 87 ∧ (entry1168 i).Inext = T 86 (310 + i.val + 1) ∧
      (entry1168 i).Icur = T 86 (310 + i.val) ∧
      (entry1168 i).output = T 87 (310 + i.val) ∧
      (entry1168 i).charge = charge 86 (310 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1173_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1168 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (310 + i.val)) shift
      (S (310 + i.val + 1)) (S 87) (T 86 (310 + i.val + 1))
      (T 86 (310 + i.val)) (T 87 (310 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1168.entries OriginalRow227TriangleForward1168.checked
    ⟨i.val, by rw [size1168]; exact i.isLt⟩
  change (entry1168 i).check = true at h
  rcases fields1168 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1169 : OriginalRow227TriangleForward1169.entries.size = 32 := rfl

def entry1169 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1169.entries[i.val]'(by rw [size1169]; exact i.isLt)

theorem fields1169 (i : Fin 32) :
    (entry1169 i).IA = shift ∧ (entry1169 i).ID = S (342 + i.val + 1) ∧
      (entry1169 i).IC = S 87 ∧ (entry1169 i).Inext = T 86 (342 + i.val + 1) ∧
      (entry1169 i).Icur = T 86 (342 + i.val) ∧
      (entry1169 i).output = T 87 (342 + i.val) ∧
      (entry1169 i).charge = charge 86 (342 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1174_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1169 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (342 + i.val)) shift
      (S (342 + i.val + 1)) (S 87) (T 86 (342 + i.val + 1))
      (T 86 (342 + i.val)) (T 87 (342 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1169.entries OriginalRow227TriangleForward1169.checked
    ⟨i.val, by rw [size1169]; exact i.isLt⟩
  change (entry1169 i).check = true at h
  rcases fields1169 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1170 : OriginalRow227TriangleForward1170.entries.size = 32 := rfl

def entry1170 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1170.entries[i.val]'(by rw [size1170]; exact i.isLt)

theorem fields1170 (i : Fin 32) :
    (entry1170 i).IA = shift ∧ (entry1170 i).ID = S (374 + i.val + 1) ∧
      (entry1170 i).IC = S 87 ∧ (entry1170 i).Inext = T 86 (374 + i.val + 1) ∧
      (entry1170 i).Icur = T 86 (374 + i.val) ∧
      (entry1170 i).output = T 87 (374 + i.val) ∧
      (entry1170 i).charge = charge 86 (374 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1175_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1170 (i : Fin 32) :
    forwardStepOK (-768) (charge 86 (374 + i.val)) shift
      (S (374 + i.val + 1)) (S 87) (T 86 (374 + i.val + 1))
      (T 86 (374 + i.val)) (T 87 (374 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1170.entries OriginalRow227TriangleForward1170.checked
    ⟨i.val, by rw [size1170]; exact i.isLt⟩
  change (entry1170 i).check = true at h
  rcases fields1170 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1171 : OriginalRow227TriangleForward1171.entries.size = 9 := rfl

def entry1171 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1171.entries[i.val]'(by rw [size1171]; exact i.isLt)

theorem fields1171 (i : Fin 9) :
    (entry1171 i).IA = shift ∧ (entry1171 i).ID = S (406 + i.val + 1) ∧
      (entry1171 i).IC = S 87 ∧ (entry1171 i).Inext = T 86 (406 + i.val + 1) ∧
      (entry1171 i).Icur = T 86 (406 + i.val) ∧
      (entry1171 i).output = T 87 (406 + i.val) ∧
      (entry1171 i).charge = charge 86 (406 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root87).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow086.block1176_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1171 (i : Fin 9) :
    forwardStepOK (-768) (charge 86 (406 + i.val)) shift
      (S (406 + i.val + 1)) (S 87) (T 86 (406 + i.val + 1))
      (T 86 (406 + i.val)) (T 87 (406 + i.val))
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1171.entries OriginalRow227TriangleForward1171.checked
    ⟨i.val, by rw [size1171]; exact i.isLt⟩
  change (entry1171 i).check = true at h
  rcases fields1171 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 86 ≤ d) (hhi : d < 415) :
    forwardStepOK (-768) (charge 86 d) shift (S (d + 1)) (S 87)
      (T 86 (d + 1)) (T 86 d) (T 87 d)
      (OriginalRow227Roots.root_pos 87 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 86 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    by_cases h150 : d < 150
    ·
      by_cases h118 : d < 118
      ·
        have hi : d - 86 < 32 := by omega
        have heq : 86 + (d - 86) = d := by omega
        simpa only [heq] using step1161 ⟨d - 86, hi⟩
      ·
        have hi : d - 118 < 32 := by omega
        have heq : 118 + (d - 118) = d := by omega
        simpa only [heq] using step1162 ⟨d - 118, hi⟩
    ·
      by_cases h182 : d < 182
      ·
        have hi : d - 150 < 32 := by omega
        have heq : 150 + (d - 150) = d := by omega
        simpa only [heq] using step1163 ⟨d - 150, hi⟩
      ·
        by_cases h214 : d < 214
        ·
          have hi : d - 182 < 32 := by omega
          have heq : 182 + (d - 182) = d := by omega
          simpa only [heq] using step1164 ⟨d - 182, hi⟩
        ·
          have hi : d - 214 < 32 := by omega
          have heq : 214 + (d - 214) = d := by omega
          simpa only [heq] using step1165 ⟨d - 214, hi⟩
  ·
    by_cases h342 : d < 342
    ·
      by_cases h278 : d < 278
      ·
        have hi : d - 246 < 32 := by omega
        have heq : 246 + (d - 246) = d := by omega
        simpa only [heq] using step1166 ⟨d - 246, hi⟩
      ·
        by_cases h310 : d < 310
        ·
          have hi : d - 278 < 32 := by omega
          have heq : 278 + (d - 278) = d := by omega
          simpa only [heq] using step1167 ⟨d - 278, hi⟩
        ·
          have hi : d - 310 < 32 := by omega
          have heq : 310 + (d - 310) = d := by omega
          simpa only [heq] using step1168 ⟨d - 310, hi⟩
    ·
      by_cases h374 : d < 374
      ·
        have hi : d - 342 < 32 := by omega
        have heq : 342 + (d - 342) = d := by omega
        simpa only [heq] using step1169 ⟨d - 342, hi⟩
      ·
        by_cases h406 : d < 406
        ·
          have hi : d - 374 < 32 := by omega
          have heq : 374 + (d - 374) = d := by omega
          simpa only [heq] using step1170 ⟨d - 374, hi⟩
        ·
          have hi : d - 406 < 9 := by omega
          have heq : 406 + (d - 406) = d := by omega
          simpa only [heq] using step1171 ⟨d - 406, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1161,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1161,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1162,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1162,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1163,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1163,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1164,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1164,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1165,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1165,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1166,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1166,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1167,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1167,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1168,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1168,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1169,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1169,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1170,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1170,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.fields1171,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.step1171,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow087
