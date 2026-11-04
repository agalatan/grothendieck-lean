import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow087
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow088
import Grothe.UpperChaos.OriginalRow227TriangleForward1172
import Grothe.UpperChaos.OriginalRow227TriangleForward1173
import Grothe.UpperChaos.OriginalRow227TriangleForward1174
import Grothe.UpperChaos.OriginalRow227TriangleForward1175
import Grothe.UpperChaos.OriginalRow227TriangleForward1176
import Grothe.UpperChaos.OriginalRow227TriangleForward1177
import Grothe.UpperChaos.OriginalRow227TriangleForward1178
import Grothe.UpperChaos.OriginalRow227TriangleForward1179
import Grothe.UpperChaos.OriginalRow227TriangleForward1180
import Grothe.UpperChaos.OriginalRow227TriangleForward1181
import Grothe.UpperChaos.OriginalRow227TriangleForward1182

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1172 : OriginalRow227TriangleForward1172.entries.size = 32 := rfl

def entry1172 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1172.entries[i.val]'(by rw [size1172]; exact i.isLt)

theorem fields1172 (i : Fin 32) :
    (entry1172 i).IA = shift ∧ (entry1172 i).ID = S (87 + i.val + 1) ∧
      (entry1172 i).IC = S 88 ∧ (entry1172 i).Inext = T 87 (87 + i.val + 1) ∧
      (entry1172 i).Icur = T 87 (87 + i.val) ∧
      (entry1172 i).output = T 88 (87 + i.val) ∧
      (entry1172 i).charge = charge 87 (87 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1177_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1172 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (87 + i.val)) shift
      (S (87 + i.val + 1)) (S 88) (T 87 (87 + i.val + 1))
      (T 87 (87 + i.val)) (T 88 (87 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1172.entries OriginalRow227TriangleForward1172.checked
    ⟨i.val, by rw [size1172]; exact i.isLt⟩
  change (entry1172 i).check = true at h
  rcases fields1172 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1173 : OriginalRow227TriangleForward1173.entries.size = 32 := rfl

def entry1173 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1173.entries[i.val]'(by rw [size1173]; exact i.isLt)

theorem fields1173 (i : Fin 32) :
    (entry1173 i).IA = shift ∧ (entry1173 i).ID = S (119 + i.val + 1) ∧
      (entry1173 i).IC = S 88 ∧ (entry1173 i).Inext = T 87 (119 + i.val + 1) ∧
      (entry1173 i).Icur = T 87 (119 + i.val) ∧
      (entry1173 i).output = T 88 (119 + i.val) ∧
      (entry1173 i).charge = charge 87 (119 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1178_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1173 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (119 + i.val)) shift
      (S (119 + i.val + 1)) (S 88) (T 87 (119 + i.val + 1))
      (T 87 (119 + i.val)) (T 88 (119 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1173.entries OriginalRow227TriangleForward1173.checked
    ⟨i.val, by rw [size1173]; exact i.isLt⟩
  change (entry1173 i).check = true at h
  rcases fields1173 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1174 : OriginalRow227TriangleForward1174.entries.size = 32 := rfl

def entry1174 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1174.entries[i.val]'(by rw [size1174]; exact i.isLt)

theorem fields1174 (i : Fin 32) :
    (entry1174 i).IA = shift ∧ (entry1174 i).ID = S (151 + i.val + 1) ∧
      (entry1174 i).IC = S 88 ∧ (entry1174 i).Inext = T 87 (151 + i.val + 1) ∧
      (entry1174 i).Icur = T 87 (151 + i.val) ∧
      (entry1174 i).output = T 88 (151 + i.val) ∧
      (entry1174 i).charge = charge 87 (151 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1179_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1174 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (151 + i.val)) shift
      (S (151 + i.val + 1)) (S 88) (T 87 (151 + i.val + 1))
      (T 87 (151 + i.val)) (T 88 (151 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1174.entries OriginalRow227TriangleForward1174.checked
    ⟨i.val, by rw [size1174]; exact i.isLt⟩
  change (entry1174 i).check = true at h
  rcases fields1174 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1175 : OriginalRow227TriangleForward1175.entries.size = 32 := rfl

def entry1175 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1175.entries[i.val]'(by rw [size1175]; exact i.isLt)

theorem fields1175 (i : Fin 32) :
    (entry1175 i).IA = shift ∧ (entry1175 i).ID = S (183 + i.val + 1) ∧
      (entry1175 i).IC = S 88 ∧ (entry1175 i).Inext = T 87 (183 + i.val + 1) ∧
      (entry1175 i).Icur = T 87 (183 + i.val) ∧
      (entry1175 i).output = T 88 (183 + i.val) ∧
      (entry1175 i).charge = charge 87 (183 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1180_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1175 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (183 + i.val)) shift
      (S (183 + i.val + 1)) (S 88) (T 87 (183 + i.val + 1))
      (T 87 (183 + i.val)) (T 88 (183 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1175.entries OriginalRow227TriangleForward1175.checked
    ⟨i.val, by rw [size1175]; exact i.isLt⟩
  change (entry1175 i).check = true at h
  rcases fields1175 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1176 : OriginalRow227TriangleForward1176.entries.size = 32 := rfl

def entry1176 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1176.entries[i.val]'(by rw [size1176]; exact i.isLt)

theorem fields1176 (i : Fin 32) :
    (entry1176 i).IA = shift ∧ (entry1176 i).ID = S (215 + i.val + 1) ∧
      (entry1176 i).IC = S 88 ∧ (entry1176 i).Inext = T 87 (215 + i.val + 1) ∧
      (entry1176 i).Icur = T 87 (215 + i.val) ∧
      (entry1176 i).output = T 88 (215 + i.val) ∧
      (entry1176 i).charge = charge 87 (215 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1181_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1176 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (215 + i.val)) shift
      (S (215 + i.val + 1)) (S 88) (T 87 (215 + i.val + 1))
      (T 87 (215 + i.val)) (T 88 (215 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1176.entries OriginalRow227TriangleForward1176.checked
    ⟨i.val, by rw [size1176]; exact i.isLt⟩
  change (entry1176 i).check = true at h
  rcases fields1176 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1177 : OriginalRow227TriangleForward1177.entries.size = 32 := rfl

def entry1177 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1177.entries[i.val]'(by rw [size1177]; exact i.isLt)

theorem fields1177 (i : Fin 32) :
    (entry1177 i).IA = shift ∧ (entry1177 i).ID = S (247 + i.val + 1) ∧
      (entry1177 i).IC = S 88 ∧ (entry1177 i).Inext = T 87 (247 + i.val + 1) ∧
      (entry1177 i).Icur = T 87 (247 + i.val) ∧
      (entry1177 i).output = T 88 (247 + i.val) ∧
      (entry1177 i).charge = charge 87 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1182_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1177 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 88) (T 87 (247 + i.val + 1))
      (T 87 (247 + i.val)) (T 88 (247 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1177.entries OriginalRow227TriangleForward1177.checked
    ⟨i.val, by rw [size1177]; exact i.isLt⟩
  change (entry1177 i).check = true at h
  rcases fields1177 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1178 : OriginalRow227TriangleForward1178.entries.size = 32 := rfl

def entry1178 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1178.entries[i.val]'(by rw [size1178]; exact i.isLt)

theorem fields1178 (i : Fin 32) :
    (entry1178 i).IA = shift ∧ (entry1178 i).ID = S (279 + i.val + 1) ∧
      (entry1178 i).IC = S 88 ∧ (entry1178 i).Inext = T 87 (279 + i.val + 1) ∧
      (entry1178 i).Icur = T 87 (279 + i.val) ∧
      (entry1178 i).output = T 88 (279 + i.val) ∧
      (entry1178 i).charge = charge 87 (279 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1183_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1178 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (279 + i.val)) shift
      (S (279 + i.val + 1)) (S 88) (T 87 (279 + i.val + 1))
      (T 87 (279 + i.val)) (T 88 (279 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1178.entries OriginalRow227TriangleForward1178.checked
    ⟨i.val, by rw [size1178]; exact i.isLt⟩
  change (entry1178 i).check = true at h
  rcases fields1178 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1179 : OriginalRow227TriangleForward1179.entries.size = 32 := rfl

def entry1179 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1179.entries[i.val]'(by rw [size1179]; exact i.isLt)

theorem fields1179 (i : Fin 32) :
    (entry1179 i).IA = shift ∧ (entry1179 i).ID = S (311 + i.val + 1) ∧
      (entry1179 i).IC = S 88 ∧ (entry1179 i).Inext = T 87 (311 + i.val + 1) ∧
      (entry1179 i).Icur = T 87 (311 + i.val) ∧
      (entry1179 i).output = T 88 (311 + i.val) ∧
      (entry1179 i).charge = charge 87 (311 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1184_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1179 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (311 + i.val)) shift
      (S (311 + i.val + 1)) (S 88) (T 87 (311 + i.val + 1))
      (T 87 (311 + i.val)) (T 88 (311 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1179.entries OriginalRow227TriangleForward1179.checked
    ⟨i.val, by rw [size1179]; exact i.isLt⟩
  change (entry1179 i).check = true at h
  rcases fields1179 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1180 : OriginalRow227TriangleForward1180.entries.size = 32 := rfl

def entry1180 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1180.entries[i.val]'(by rw [size1180]; exact i.isLt)

theorem fields1180 (i : Fin 32) :
    (entry1180 i).IA = shift ∧ (entry1180 i).ID = S (343 + i.val + 1) ∧
      (entry1180 i).IC = S 88 ∧ (entry1180 i).Inext = T 87 (343 + i.val + 1) ∧
      (entry1180 i).Icur = T 87 (343 + i.val) ∧
      (entry1180 i).output = T 88 (343 + i.val) ∧
      (entry1180 i).charge = charge 87 (343 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1185_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1180 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (343 + i.val)) shift
      (S (343 + i.val + 1)) (S 88) (T 87 (343 + i.val + 1))
      (T 87 (343 + i.val)) (T 88 (343 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1180.entries OriginalRow227TriangleForward1180.checked
    ⟨i.val, by rw [size1180]; exact i.isLt⟩
  change (entry1180 i).check = true at h
  rcases fields1180 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1181 : OriginalRow227TriangleForward1181.entries.size = 32 := rfl

def entry1181 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1181.entries[i.val]'(by rw [size1181]; exact i.isLt)

theorem fields1181 (i : Fin 32) :
    (entry1181 i).IA = shift ∧ (entry1181 i).ID = S (375 + i.val + 1) ∧
      (entry1181 i).IC = S 88 ∧ (entry1181 i).Inext = T 87 (375 + i.val + 1) ∧
      (entry1181 i).Icur = T 87 (375 + i.val) ∧
      (entry1181 i).output = T 88 (375 + i.val) ∧
      (entry1181 i).charge = charge 87 (375 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1186_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1181 (i : Fin 32) :
    forwardStepOK (-768) (charge 87 (375 + i.val)) shift
      (S (375 + i.val + 1)) (S 88) (T 87 (375 + i.val + 1))
      (T 87 (375 + i.val)) (T 88 (375 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1181.entries OriginalRow227TriangleForward1181.checked
    ⟨i.val, by rw [size1181]; exact i.isLt⟩
  change (entry1181 i).check = true at h
  rcases fields1181 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1182 : OriginalRow227TriangleForward1182.entries.size = 7 := rfl

def entry1182 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1182.entries[i.val]'(by rw [size1182]; exact i.isLt)

theorem fields1182 (i : Fin 7) :
    (entry1182 i).IA = shift ∧ (entry1182 i).ID = S (407 + i.val + 1) ∧
      (entry1182 i).IC = S 88 ∧ (entry1182 i).Inext = T 87 (407 + i.val + 1) ∧
      (entry1182 i).Icur = T 87 (407 + i.val) ∧
      (entry1182 i).output = T 88 (407 + i.val) ∧
      (entry1182 i).charge = charge 87 (407 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root88).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow087.block1187_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1182 (i : Fin 7) :
    forwardStepOK (-768) (charge 87 (407 + i.val)) shift
      (S (407 + i.val + 1)) (S 88) (T 87 (407 + i.val + 1))
      (T 87 (407 + i.val)) (T 88 (407 + i.val))
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1182.entries OriginalRow227TriangleForward1182.checked
    ⟨i.val, by rw [size1182]; exact i.isLt⟩
  change (entry1182 i).check = true at h
  rcases fields1182 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 87 ≤ d) (hhi : d < 414) :
    forwardStepOK (-768) (charge 87 d) shift (S (d + 1)) (S 88)
      (T 87 (d + 1)) (T 87 d) (T 88 d)
      (OriginalRow227Roots.root_pos 88 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 87 (by decide)) = true := by
  by_cases h247 : d < 247
  ·
    by_cases h151 : d < 151
    ·
      by_cases h119 : d < 119
      ·
        have hi : d - 87 < 32 := by omega
        have heq : 87 + (d - 87) = d := by omega
        simpa only [heq] using step1172 ⟨d - 87, hi⟩
      ·
        have hi : d - 119 < 32 := by omega
        have heq : 119 + (d - 119) = d := by omega
        simpa only [heq] using step1173 ⟨d - 119, hi⟩
    ·
      by_cases h183 : d < 183
      ·
        have hi : d - 151 < 32 := by omega
        have heq : 151 + (d - 151) = d := by omega
        simpa only [heq] using step1174 ⟨d - 151, hi⟩
      ·
        by_cases h215 : d < 215
        ·
          have hi : d - 183 < 32 := by omega
          have heq : 183 + (d - 183) = d := by omega
          simpa only [heq] using step1175 ⟨d - 183, hi⟩
        ·
          have hi : d - 215 < 32 := by omega
          have heq : 215 + (d - 215) = d := by omega
          simpa only [heq] using step1176 ⟨d - 215, hi⟩
  ·
    by_cases h343 : d < 343
    ·
      by_cases h279 : d < 279
      ·
        have hi : d - 247 < 32 := by omega
        have heq : 247 + (d - 247) = d := by omega
        simpa only [heq] using step1177 ⟨d - 247, hi⟩
      ·
        by_cases h311 : d < 311
        ·
          have hi : d - 279 < 32 := by omega
          have heq : 279 + (d - 279) = d := by omega
          simpa only [heq] using step1178 ⟨d - 279, hi⟩
        ·
          have hi : d - 311 < 32 := by omega
          have heq : 311 + (d - 311) = d := by omega
          simpa only [heq] using step1179 ⟨d - 311, hi⟩
    ·
      by_cases h375 : d < 375
      ·
        have hi : d - 343 < 32 := by omega
        have heq : 343 + (d - 343) = d := by omega
        simpa only [heq] using step1180 ⟨d - 343, hi⟩
      ·
        by_cases h407 : d < 407
        ·
          have hi : d - 375 < 32 := by omega
          have heq : 375 + (d - 375) = d := by omega
          simpa only [heq] using step1181 ⟨d - 375, hi⟩
        ·
          have hi : d - 407 < 7 := by omega
          have heq : 407 + (d - 407) = d := by omega
          simpa only [heq] using step1182 ⟨d - 407, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1172,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1172,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1173,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1173,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1174,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1174,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1175,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1175,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1176,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1176,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1177,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1177,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1178,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1178,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1179,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1179,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1180,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1180,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1181,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1181,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.fields1182,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.step1182,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow088
