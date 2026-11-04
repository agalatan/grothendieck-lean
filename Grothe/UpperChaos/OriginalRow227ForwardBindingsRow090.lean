import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow089
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090
import Grothe.UpperChaos.OriginalRow227TriangleForward1194
import Grothe.UpperChaos.OriginalRow227TriangleForward1195
import Grothe.UpperChaos.OriginalRow227TriangleForward1196
import Grothe.UpperChaos.OriginalRow227TriangleForward1197
import Grothe.UpperChaos.OriginalRow227TriangleForward1198
import Grothe.UpperChaos.OriginalRow227TriangleForward1199
import Grothe.UpperChaos.OriginalRow227TriangleForward1200
import Grothe.UpperChaos.OriginalRow227TriangleForward1201
import Grothe.UpperChaos.OriginalRow227TriangleForward1202
import Grothe.UpperChaos.OriginalRow227TriangleForward1203
import Grothe.UpperChaos.OriginalRow227TriangleForward1204

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1194 : OriginalRow227TriangleForward1194.entries.size = 32 := rfl

def entry1194 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1194.entries[i.val]'(by rw [size1194]; exact i.isLt)

theorem fields1194 (i : Fin 32) :
    (entry1194 i).IA = shift ∧ (entry1194 i).ID = S (89 + i.val + 1) ∧
      (entry1194 i).IC = S 90 ∧ (entry1194 i).Inext = T 89 (89 + i.val + 1) ∧
      (entry1194 i).Icur = T 89 (89 + i.val) ∧
      (entry1194 i).output = T 90 (89 + i.val) ∧
      (entry1194 i).charge = charge 89 (89 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1199_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1194 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (89 + i.val)) shift
      (S (89 + i.val + 1)) (S 90) (T 89 (89 + i.val + 1))
      (T 89 (89 + i.val)) (T 90 (89 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1194.entries OriginalRow227TriangleForward1194.checked
    ⟨i.val, by rw [size1194]; exact i.isLt⟩
  change (entry1194 i).check = true at h
  rcases fields1194 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1195 : OriginalRow227TriangleForward1195.entries.size = 32 := rfl

def entry1195 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1195.entries[i.val]'(by rw [size1195]; exact i.isLt)

theorem fields1195 (i : Fin 32) :
    (entry1195 i).IA = shift ∧ (entry1195 i).ID = S (121 + i.val + 1) ∧
      (entry1195 i).IC = S 90 ∧ (entry1195 i).Inext = T 89 (121 + i.val + 1) ∧
      (entry1195 i).Icur = T 89 (121 + i.val) ∧
      (entry1195 i).output = T 90 (121 + i.val) ∧
      (entry1195 i).charge = charge 89 (121 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1200_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1195 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (121 + i.val)) shift
      (S (121 + i.val + 1)) (S 90) (T 89 (121 + i.val + 1))
      (T 89 (121 + i.val)) (T 90 (121 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1195.entries OriginalRow227TriangleForward1195.checked
    ⟨i.val, by rw [size1195]; exact i.isLt⟩
  change (entry1195 i).check = true at h
  rcases fields1195 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1196 : OriginalRow227TriangleForward1196.entries.size = 32 := rfl

def entry1196 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1196.entries[i.val]'(by rw [size1196]; exact i.isLt)

theorem fields1196 (i : Fin 32) :
    (entry1196 i).IA = shift ∧ (entry1196 i).ID = S (153 + i.val + 1) ∧
      (entry1196 i).IC = S 90 ∧ (entry1196 i).Inext = T 89 (153 + i.val + 1) ∧
      (entry1196 i).Icur = T 89 (153 + i.val) ∧
      (entry1196 i).output = T 90 (153 + i.val) ∧
      (entry1196 i).charge = charge 89 (153 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1201_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1196 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (153 + i.val)) shift
      (S (153 + i.val + 1)) (S 90) (T 89 (153 + i.val + 1))
      (T 89 (153 + i.val)) (T 90 (153 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1196.entries OriginalRow227TriangleForward1196.checked
    ⟨i.val, by rw [size1196]; exact i.isLt⟩
  change (entry1196 i).check = true at h
  rcases fields1196 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1197 : OriginalRow227TriangleForward1197.entries.size = 32 := rfl

def entry1197 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1197.entries[i.val]'(by rw [size1197]; exact i.isLt)

theorem fields1197 (i : Fin 32) :
    (entry1197 i).IA = shift ∧ (entry1197 i).ID = S (185 + i.val + 1) ∧
      (entry1197 i).IC = S 90 ∧ (entry1197 i).Inext = T 89 (185 + i.val + 1) ∧
      (entry1197 i).Icur = T 89 (185 + i.val) ∧
      (entry1197 i).output = T 90 (185 + i.val) ∧
      (entry1197 i).charge = charge 89 (185 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1202_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1197 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (185 + i.val)) shift
      (S (185 + i.val + 1)) (S 90) (T 89 (185 + i.val + 1))
      (T 89 (185 + i.val)) (T 90 (185 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1197.entries OriginalRow227TriangleForward1197.checked
    ⟨i.val, by rw [size1197]; exact i.isLt⟩
  change (entry1197 i).check = true at h
  rcases fields1197 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1198 : OriginalRow227TriangleForward1198.entries.size = 32 := rfl

def entry1198 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1198.entries[i.val]'(by rw [size1198]; exact i.isLt)

theorem fields1198 (i : Fin 32) :
    (entry1198 i).IA = shift ∧ (entry1198 i).ID = S (217 + i.val + 1) ∧
      (entry1198 i).IC = S 90 ∧ (entry1198 i).Inext = T 89 (217 + i.val + 1) ∧
      (entry1198 i).Icur = T 89 (217 + i.val) ∧
      (entry1198 i).output = T 90 (217 + i.val) ∧
      (entry1198 i).charge = charge 89 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1203_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1198 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 90) (T 89 (217 + i.val + 1))
      (T 89 (217 + i.val)) (T 90 (217 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1198.entries OriginalRow227TriangleForward1198.checked
    ⟨i.val, by rw [size1198]; exact i.isLt⟩
  change (entry1198 i).check = true at h
  rcases fields1198 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1199 : OriginalRow227TriangleForward1199.entries.size = 32 := rfl

def entry1199 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1199.entries[i.val]'(by rw [size1199]; exact i.isLt)

theorem fields1199 (i : Fin 32) :
    (entry1199 i).IA = shift ∧ (entry1199 i).ID = S (249 + i.val + 1) ∧
      (entry1199 i).IC = S 90 ∧ (entry1199 i).Inext = T 89 (249 + i.val + 1) ∧
      (entry1199 i).Icur = T 89 (249 + i.val) ∧
      (entry1199 i).output = T 90 (249 + i.val) ∧
      (entry1199 i).charge = charge 89 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1204_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1199 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 90) (T 89 (249 + i.val + 1))
      (T 89 (249 + i.val)) (T 90 (249 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1199.entries OriginalRow227TriangleForward1199.checked
    ⟨i.val, by rw [size1199]; exact i.isLt⟩
  change (entry1199 i).check = true at h
  rcases fields1199 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1200 : OriginalRow227TriangleForward1200.entries.size = 32 := rfl

def entry1200 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1200.entries[i.val]'(by rw [size1200]; exact i.isLt)

theorem fields1200 (i : Fin 32) :
    (entry1200 i).IA = shift ∧ (entry1200 i).ID = S (281 + i.val + 1) ∧
      (entry1200 i).IC = S 90 ∧ (entry1200 i).Inext = T 89 (281 + i.val + 1) ∧
      (entry1200 i).Icur = T 89 (281 + i.val) ∧
      (entry1200 i).output = T 90 (281 + i.val) ∧
      (entry1200 i).charge = charge 89 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1205_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1200 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 90) (T 89 (281 + i.val + 1))
      (T 89 (281 + i.val)) (T 90 (281 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1200.entries OriginalRow227TriangleForward1200.checked
    ⟨i.val, by rw [size1200]; exact i.isLt⟩
  change (entry1200 i).check = true at h
  rcases fields1200 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1201 : OriginalRow227TriangleForward1201.entries.size = 32 := rfl

def entry1201 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1201.entries[i.val]'(by rw [size1201]; exact i.isLt)

theorem fields1201 (i : Fin 32) :
    (entry1201 i).IA = shift ∧ (entry1201 i).ID = S (313 + i.val + 1) ∧
      (entry1201 i).IC = S 90 ∧ (entry1201 i).Inext = T 89 (313 + i.val + 1) ∧
      (entry1201 i).Icur = T 89 (313 + i.val) ∧
      (entry1201 i).output = T 90 (313 + i.val) ∧
      (entry1201 i).charge = charge 89 (313 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1206_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1201 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (313 + i.val)) shift
      (S (313 + i.val + 1)) (S 90) (T 89 (313 + i.val + 1))
      (T 89 (313 + i.val)) (T 90 (313 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1201.entries OriginalRow227TriangleForward1201.checked
    ⟨i.val, by rw [size1201]; exact i.isLt⟩
  change (entry1201 i).check = true at h
  rcases fields1201 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1202 : OriginalRow227TriangleForward1202.entries.size = 32 := rfl

def entry1202 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1202.entries[i.val]'(by rw [size1202]; exact i.isLt)

theorem fields1202 (i : Fin 32) :
    (entry1202 i).IA = shift ∧ (entry1202 i).ID = S (345 + i.val + 1) ∧
      (entry1202 i).IC = S 90 ∧ (entry1202 i).Inext = T 89 (345 + i.val + 1) ∧
      (entry1202 i).Icur = T 89 (345 + i.val) ∧
      (entry1202 i).output = T 90 (345 + i.val) ∧
      (entry1202 i).charge = charge 89 (345 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1207_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1202 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (345 + i.val)) shift
      (S (345 + i.val + 1)) (S 90) (T 89 (345 + i.val + 1))
      (T 89 (345 + i.val)) (T 90 (345 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1202.entries OriginalRow227TriangleForward1202.checked
    ⟨i.val, by rw [size1202]; exact i.isLt⟩
  change (entry1202 i).check = true at h
  rcases fields1202 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1203 : OriginalRow227TriangleForward1203.entries.size = 32 := rfl

def entry1203 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1203.entries[i.val]'(by rw [size1203]; exact i.isLt)

theorem fields1203 (i : Fin 32) :
    (entry1203 i).IA = shift ∧ (entry1203 i).ID = S (377 + i.val + 1) ∧
      (entry1203 i).IC = S 90 ∧ (entry1203 i).Inext = T 89 (377 + i.val + 1) ∧
      (entry1203 i).Icur = T 89 (377 + i.val) ∧
      (entry1203 i).output = T 90 (377 + i.val) ∧
      (entry1203 i).charge = charge 89 (377 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1208_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1203 (i : Fin 32) :
    forwardStepOK (-768) (charge 89 (377 + i.val)) shift
      (S (377 + i.val + 1)) (S 90) (T 89 (377 + i.val + 1))
      (T 89 (377 + i.val)) (T 90 (377 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1203.entries OriginalRow227TriangleForward1203.checked
    ⟨i.val, by rw [size1203]; exact i.isLt⟩
  change (entry1203 i).check = true at h
  rcases fields1203 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1204 : OriginalRow227TriangleForward1204.entries.size = 3 := rfl

def entry1204 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1204.entries[i.val]'(by rw [size1204]; exact i.isLt)

theorem fields1204 (i : Fin 3) :
    (entry1204 i).IA = shift ∧ (entry1204 i).ID = S (409 + i.val + 1) ∧
      (entry1204 i).IC = S 90 ∧ (entry1204 i).Inext = T 89 (409 + i.val + 1) ∧
      (entry1204 i).Icur = T 89 (409 + i.val) ∧
      (entry1204 i).output = T 90 (409 + i.val) ∧
      (entry1204 i).charge = charge 89 (409 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root90).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow089.block1209_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1204 (i : Fin 3) :
    forwardStepOK (-768) (charge 89 (409 + i.val)) shift
      (S (409 + i.val + 1)) (S 90) (T 89 (409 + i.val + 1))
      (T 89 (409 + i.val)) (T 90 (409 + i.val))
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1204.entries OriginalRow227TriangleForward1204.checked
    ⟨i.val, by rw [size1204]; exact i.isLt⟩
  change (entry1204 i).check = true at h
  rcases fields1204 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 89 ≤ d) (hhi : d < 412) :
    forwardStepOK (-768) (charge 89 d) shift (S (d + 1)) (S 90)
      (T 89 (d + 1)) (T 89 d) (T 90 d)
      (OriginalRow227Roots.root_pos 90 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 89 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    by_cases h153 : d < 153
    ·
      by_cases h121 : d < 121
      ·
        have hi : d - 89 < 32 := by omega
        have heq : 89 + (d - 89) = d := by omega
        simpa only [heq] using step1194 ⟨d - 89, hi⟩
      ·
        have hi : d - 121 < 32 := by omega
        have heq : 121 + (d - 121) = d := by omega
        simpa only [heq] using step1195 ⟨d - 121, hi⟩
    ·
      by_cases h185 : d < 185
      ·
        have hi : d - 153 < 32 := by omega
        have heq : 153 + (d - 153) = d := by omega
        simpa only [heq] using step1196 ⟨d - 153, hi⟩
      ·
        by_cases h217 : d < 217
        ·
          have hi : d - 185 < 32 := by omega
          have heq : 185 + (d - 185) = d := by omega
          simpa only [heq] using step1197 ⟨d - 185, hi⟩
        ·
          have hi : d - 217 < 32 := by omega
          have heq : 217 + (d - 217) = d := by omega
          simpa only [heq] using step1198 ⟨d - 217, hi⟩
  ·
    by_cases h345 : d < 345
    ·
      by_cases h281 : d < 281
      ·
        have hi : d - 249 < 32 := by omega
        have heq : 249 + (d - 249) = d := by omega
        simpa only [heq] using step1199 ⟨d - 249, hi⟩
      ·
        by_cases h313 : d < 313
        ·
          have hi : d - 281 < 32 := by omega
          have heq : 281 + (d - 281) = d := by omega
          simpa only [heq] using step1200 ⟨d - 281, hi⟩
        ·
          have hi : d - 313 < 32 := by omega
          have heq : 313 + (d - 313) = d := by omega
          simpa only [heq] using step1201 ⟨d - 313, hi⟩
    ·
      by_cases h377 : d < 377
      ·
        have hi : d - 345 < 32 := by omega
        have heq : 345 + (d - 345) = d := by omega
        simpa only [heq] using step1202 ⟨d - 345, hi⟩
      ·
        by_cases h409 : d < 409
        ·
          have hi : d - 377 < 32 := by omega
          have heq : 377 + (d - 377) = d := by omega
          simpa only [heq] using step1203 ⟨d - 377, hi⟩
        ·
          have hi : d - 409 < 3 := by omega
          have heq : 409 + (d - 409) = d := by omega
          simpa only [heq] using step1204 ⟨d - 409, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1194,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1194,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1195,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1195,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1196,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1196,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1197,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1197,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1198,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1198,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1199,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1199,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1200,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1200,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1201,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1201,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1202,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1202,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1203,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1203,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.fields1204,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.step1204,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow090
