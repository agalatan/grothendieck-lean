import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow088
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089
import Grothe.UpperChaos.OriginalRow227TriangleForward1183
import Grothe.UpperChaos.OriginalRow227TriangleForward1184
import Grothe.UpperChaos.OriginalRow227TriangleForward1185
import Grothe.UpperChaos.OriginalRow227TriangleForward1186
import Grothe.UpperChaos.OriginalRow227TriangleForward1187
import Grothe.UpperChaos.OriginalRow227TriangleForward1188
import Grothe.UpperChaos.OriginalRow227TriangleForward1189
import Grothe.UpperChaos.OriginalRow227TriangleForward1190
import Grothe.UpperChaos.OriginalRow227TriangleForward1191
import Grothe.UpperChaos.OriginalRow227TriangleForward1192
import Grothe.UpperChaos.OriginalRow227TriangleForward1193

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1183 : OriginalRow227TriangleForward1183.entries.size = 32 := rfl

def entry1183 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1183.entries[i.val]'(by rw [size1183]; exact i.isLt)

theorem fields1183 (i : Fin 32) :
    (entry1183 i).IA = shift ∧ (entry1183 i).ID = S (88 + i.val + 1) ∧
      (entry1183 i).IC = S 89 ∧ (entry1183 i).Inext = T 88 (88 + i.val + 1) ∧
      (entry1183 i).Icur = T 88 (88 + i.val) ∧
      (entry1183 i).output = T 89 (88 + i.val) ∧
      (entry1183 i).charge = charge 88 (88 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1188_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1183 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (88 + i.val)) shift
      (S (88 + i.val + 1)) (S 89) (T 88 (88 + i.val + 1))
      (T 88 (88 + i.val)) (T 89 (88 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1183.entries OriginalRow227TriangleForward1183.checked
    ⟨i.val, by rw [size1183]; exact i.isLt⟩
  change (entry1183 i).check = true at h
  rcases fields1183 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1184 : OriginalRow227TriangleForward1184.entries.size = 32 := rfl

def entry1184 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1184.entries[i.val]'(by rw [size1184]; exact i.isLt)

theorem fields1184 (i : Fin 32) :
    (entry1184 i).IA = shift ∧ (entry1184 i).ID = S (120 + i.val + 1) ∧
      (entry1184 i).IC = S 89 ∧ (entry1184 i).Inext = T 88 (120 + i.val + 1) ∧
      (entry1184 i).Icur = T 88 (120 + i.val) ∧
      (entry1184 i).output = T 89 (120 + i.val) ∧
      (entry1184 i).charge = charge 88 (120 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1189_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1184 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (120 + i.val)) shift
      (S (120 + i.val + 1)) (S 89) (T 88 (120 + i.val + 1))
      (T 88 (120 + i.val)) (T 89 (120 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1184.entries OriginalRow227TriangleForward1184.checked
    ⟨i.val, by rw [size1184]; exact i.isLt⟩
  change (entry1184 i).check = true at h
  rcases fields1184 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1185 : OriginalRow227TriangleForward1185.entries.size = 32 := rfl

def entry1185 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1185.entries[i.val]'(by rw [size1185]; exact i.isLt)

theorem fields1185 (i : Fin 32) :
    (entry1185 i).IA = shift ∧ (entry1185 i).ID = S (152 + i.val + 1) ∧
      (entry1185 i).IC = S 89 ∧ (entry1185 i).Inext = T 88 (152 + i.val + 1) ∧
      (entry1185 i).Icur = T 88 (152 + i.val) ∧
      (entry1185 i).output = T 89 (152 + i.val) ∧
      (entry1185 i).charge = charge 88 (152 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1190_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1185 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (152 + i.val)) shift
      (S (152 + i.val + 1)) (S 89) (T 88 (152 + i.val + 1))
      (T 88 (152 + i.val)) (T 89 (152 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1185.entries OriginalRow227TriangleForward1185.checked
    ⟨i.val, by rw [size1185]; exact i.isLt⟩
  change (entry1185 i).check = true at h
  rcases fields1185 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1186 : OriginalRow227TriangleForward1186.entries.size = 32 := rfl

def entry1186 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1186.entries[i.val]'(by rw [size1186]; exact i.isLt)

theorem fields1186 (i : Fin 32) :
    (entry1186 i).IA = shift ∧ (entry1186 i).ID = S (184 + i.val + 1) ∧
      (entry1186 i).IC = S 89 ∧ (entry1186 i).Inext = T 88 (184 + i.val + 1) ∧
      (entry1186 i).Icur = T 88 (184 + i.val) ∧
      (entry1186 i).output = T 89 (184 + i.val) ∧
      (entry1186 i).charge = charge 88 (184 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1191_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1186 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (184 + i.val)) shift
      (S (184 + i.val + 1)) (S 89) (T 88 (184 + i.val + 1))
      (T 88 (184 + i.val)) (T 89 (184 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1186.entries OriginalRow227TriangleForward1186.checked
    ⟨i.val, by rw [size1186]; exact i.isLt⟩
  change (entry1186 i).check = true at h
  rcases fields1186 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1187 : OriginalRow227TriangleForward1187.entries.size = 32 := rfl

def entry1187 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1187.entries[i.val]'(by rw [size1187]; exact i.isLt)

theorem fields1187 (i : Fin 32) :
    (entry1187 i).IA = shift ∧ (entry1187 i).ID = S (216 + i.val + 1) ∧
      (entry1187 i).IC = S 89 ∧ (entry1187 i).Inext = T 88 (216 + i.val + 1) ∧
      (entry1187 i).Icur = T 88 (216 + i.val) ∧
      (entry1187 i).output = T 89 (216 + i.val) ∧
      (entry1187 i).charge = charge 88 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1192_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1187 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 89) (T 88 (216 + i.val + 1))
      (T 88 (216 + i.val)) (T 89 (216 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1187.entries OriginalRow227TriangleForward1187.checked
    ⟨i.val, by rw [size1187]; exact i.isLt⟩
  change (entry1187 i).check = true at h
  rcases fields1187 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1188 : OriginalRow227TriangleForward1188.entries.size = 32 := rfl

def entry1188 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1188.entries[i.val]'(by rw [size1188]; exact i.isLt)

theorem fields1188 (i : Fin 32) :
    (entry1188 i).IA = shift ∧ (entry1188 i).ID = S (248 + i.val + 1) ∧
      (entry1188 i).IC = S 89 ∧ (entry1188 i).Inext = T 88 (248 + i.val + 1) ∧
      (entry1188 i).Icur = T 88 (248 + i.val) ∧
      (entry1188 i).output = T 89 (248 + i.val) ∧
      (entry1188 i).charge = charge 88 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1193_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1188 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 89) (T 88 (248 + i.val + 1))
      (T 88 (248 + i.val)) (T 89 (248 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1188.entries OriginalRow227TriangleForward1188.checked
    ⟨i.val, by rw [size1188]; exact i.isLt⟩
  change (entry1188 i).check = true at h
  rcases fields1188 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1189 : OriginalRow227TriangleForward1189.entries.size = 32 := rfl

def entry1189 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1189.entries[i.val]'(by rw [size1189]; exact i.isLt)

theorem fields1189 (i : Fin 32) :
    (entry1189 i).IA = shift ∧ (entry1189 i).ID = S (280 + i.val + 1) ∧
      (entry1189 i).IC = S 89 ∧ (entry1189 i).Inext = T 88 (280 + i.val + 1) ∧
      (entry1189 i).Icur = T 88 (280 + i.val) ∧
      (entry1189 i).output = T 89 (280 + i.val) ∧
      (entry1189 i).charge = charge 88 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1194_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1189 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 89) (T 88 (280 + i.val + 1))
      (T 88 (280 + i.val)) (T 89 (280 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1189.entries OriginalRow227TriangleForward1189.checked
    ⟨i.val, by rw [size1189]; exact i.isLt⟩
  change (entry1189 i).check = true at h
  rcases fields1189 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1190 : OriginalRow227TriangleForward1190.entries.size = 32 := rfl

def entry1190 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1190.entries[i.val]'(by rw [size1190]; exact i.isLt)

theorem fields1190 (i : Fin 32) :
    (entry1190 i).IA = shift ∧ (entry1190 i).ID = S (312 + i.val + 1) ∧
      (entry1190 i).IC = S 89 ∧ (entry1190 i).Inext = T 88 (312 + i.val + 1) ∧
      (entry1190 i).Icur = T 88 (312 + i.val) ∧
      (entry1190 i).output = T 89 (312 + i.val) ∧
      (entry1190 i).charge = charge 88 (312 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1195_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1190 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (312 + i.val)) shift
      (S (312 + i.val + 1)) (S 89) (T 88 (312 + i.val + 1))
      (T 88 (312 + i.val)) (T 89 (312 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1190.entries OriginalRow227TriangleForward1190.checked
    ⟨i.val, by rw [size1190]; exact i.isLt⟩
  change (entry1190 i).check = true at h
  rcases fields1190 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1191 : OriginalRow227TriangleForward1191.entries.size = 32 := rfl

def entry1191 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1191.entries[i.val]'(by rw [size1191]; exact i.isLt)

theorem fields1191 (i : Fin 32) :
    (entry1191 i).IA = shift ∧ (entry1191 i).ID = S (344 + i.val + 1) ∧
      (entry1191 i).IC = S 89 ∧ (entry1191 i).Inext = T 88 (344 + i.val + 1) ∧
      (entry1191 i).Icur = T 88 (344 + i.val) ∧
      (entry1191 i).output = T 89 (344 + i.val) ∧
      (entry1191 i).charge = charge 88 (344 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1196_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1191 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (344 + i.val)) shift
      (S (344 + i.val + 1)) (S 89) (T 88 (344 + i.val + 1))
      (T 88 (344 + i.val)) (T 89 (344 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1191.entries OriginalRow227TriangleForward1191.checked
    ⟨i.val, by rw [size1191]; exact i.isLt⟩
  change (entry1191 i).check = true at h
  rcases fields1191 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1192 : OriginalRow227TriangleForward1192.entries.size = 32 := rfl

def entry1192 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1192.entries[i.val]'(by rw [size1192]; exact i.isLt)

theorem fields1192 (i : Fin 32) :
    (entry1192 i).IA = shift ∧ (entry1192 i).ID = S (376 + i.val + 1) ∧
      (entry1192 i).IC = S 89 ∧ (entry1192 i).Inext = T 88 (376 + i.val + 1) ∧
      (entry1192 i).Icur = T 88 (376 + i.val) ∧
      (entry1192 i).output = T 89 (376 + i.val) ∧
      (entry1192 i).charge = charge 88 (376 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1197_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1192 (i : Fin 32) :
    forwardStepOK (-768) (charge 88 (376 + i.val)) shift
      (S (376 + i.val + 1)) (S 89) (T 88 (376 + i.val + 1))
      (T 88 (376 + i.val)) (T 89 (376 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1192.entries OriginalRow227TriangleForward1192.checked
    ⟨i.val, by rw [size1192]; exact i.isLt⟩
  change (entry1192 i).check = true at h
  rcases fields1192 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1193 : OriginalRow227TriangleForward1193.entries.size = 5 := rfl

def entry1193 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1193.entries[i.val]'(by rw [size1193]; exact i.isLt)

theorem fields1193 (i : Fin 5) :
    (entry1193 i).IA = shift ∧ (entry1193 i).ID = S (408 + i.val + 1) ∧
      (entry1193 i).IC = S 89 ∧ (entry1193 i).Inext = T 88 (408 + i.val + 1) ∧
      (entry1193 i).Icur = T 88 (408 + i.val) ∧
      (entry1193 i).output = T 89 (408 + i.val) ∧
      (entry1193 i).charge = charge 88 (408 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root89).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow088.block1198_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1193 (i : Fin 5) :
    forwardStepOK (-768) (charge 88 (408 + i.val)) shift
      (S (408 + i.val + 1)) (S 89) (T 88 (408 + i.val + 1))
      (T 88 (408 + i.val)) (T 89 (408 + i.val))
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1193.entries OriginalRow227TriangleForward1193.checked
    ⟨i.val, by rw [size1193]; exact i.isLt⟩
  change (entry1193 i).check = true at h
  rcases fields1193 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 88 ≤ d) (hhi : d < 413) :
    forwardStepOK (-768) (charge 88 d) shift (S (d + 1)) (S 89)
      (T 88 (d + 1)) (T 88 d) (T 89 d)
      (OriginalRow227Roots.root_pos 89 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 88 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    by_cases h152 : d < 152
    ·
      by_cases h120 : d < 120
      ·
        have hi : d - 88 < 32 := by omega
        have heq : 88 + (d - 88) = d := by omega
        simpa only [heq] using step1183 ⟨d - 88, hi⟩
      ·
        have hi : d - 120 < 32 := by omega
        have heq : 120 + (d - 120) = d := by omega
        simpa only [heq] using step1184 ⟨d - 120, hi⟩
    ·
      by_cases h184 : d < 184
      ·
        have hi : d - 152 < 32 := by omega
        have heq : 152 + (d - 152) = d := by omega
        simpa only [heq] using step1185 ⟨d - 152, hi⟩
      ·
        by_cases h216 : d < 216
        ·
          have hi : d - 184 < 32 := by omega
          have heq : 184 + (d - 184) = d := by omega
          simpa only [heq] using step1186 ⟨d - 184, hi⟩
        ·
          have hi : d - 216 < 32 := by omega
          have heq : 216 + (d - 216) = d := by omega
          simpa only [heq] using step1187 ⟨d - 216, hi⟩
  ·
    by_cases h344 : d < 344
    ·
      by_cases h280 : d < 280
      ·
        have hi : d - 248 < 32 := by omega
        have heq : 248 + (d - 248) = d := by omega
        simpa only [heq] using step1188 ⟨d - 248, hi⟩
      ·
        by_cases h312 : d < 312
        ·
          have hi : d - 280 < 32 := by omega
          have heq : 280 + (d - 280) = d := by omega
          simpa only [heq] using step1189 ⟨d - 280, hi⟩
        ·
          have hi : d - 312 < 32 := by omega
          have heq : 312 + (d - 312) = d := by omega
          simpa only [heq] using step1190 ⟨d - 312, hi⟩
    ·
      by_cases h376 : d < 376
      ·
        have hi : d - 344 < 32 := by omega
        have heq : 344 + (d - 344) = d := by omega
        simpa only [heq] using step1191 ⟨d - 344, hi⟩
      ·
        by_cases h408 : d < 408
        ·
          have hi : d - 376 < 32 := by omega
          have heq : 376 + (d - 376) = d := by omega
          simpa only [heq] using step1192 ⟨d - 376, hi⟩
        ·
          have hi : d - 408 < 5 := by omega
          have heq : 408 + (d - 408) = d := by omega
          simpa only [heq] using step1193 ⟨d - 408, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1183,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1183,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1184,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1184,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1185,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1185,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1186,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1186,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1187,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1187,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1188,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1188,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1189,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1189,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1190,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1190,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1191,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1191,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1192,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1192,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.fields1193,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.step1193,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow089
