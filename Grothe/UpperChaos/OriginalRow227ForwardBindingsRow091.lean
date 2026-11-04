import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow090
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091
import Grothe.UpperChaos.OriginalRow227TriangleForward1205
import Grothe.UpperChaos.OriginalRow227TriangleForward1206
import Grothe.UpperChaos.OriginalRow227TriangleForward1207
import Grothe.UpperChaos.OriginalRow227TriangleForward1208
import Grothe.UpperChaos.OriginalRow227TriangleForward1209
import Grothe.UpperChaos.OriginalRow227TriangleForward1210
import Grothe.UpperChaos.OriginalRow227TriangleForward1211
import Grothe.UpperChaos.OriginalRow227TriangleForward1212
import Grothe.UpperChaos.OriginalRow227TriangleForward1213
import Grothe.UpperChaos.OriginalRow227TriangleForward1214
import Grothe.UpperChaos.OriginalRow227TriangleForward1215

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1205 : OriginalRow227TriangleForward1205.entries.size = 32 := rfl

def entry1205 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1205.entries[i.val]'(by rw [size1205]; exact i.isLt)

theorem fields1205 (i : Fin 32) :
    (entry1205 i).IA = shift ∧ (entry1205 i).ID = S (90 + i.val + 1) ∧
      (entry1205 i).IC = S 91 ∧ (entry1205 i).Inext = T 90 (90 + i.val + 1) ∧
      (entry1205 i).Icur = T 90 (90 + i.val) ∧
      (entry1205 i).output = T 91 (90 + i.val) ∧
      (entry1205 i).charge = charge 90 (90 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1210_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1205 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (90 + i.val)) shift
      (S (90 + i.val + 1)) (S 91) (T 90 (90 + i.val + 1))
      (T 90 (90 + i.val)) (T 91 (90 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1205.entries OriginalRow227TriangleForward1205.checked
    ⟨i.val, by rw [size1205]; exact i.isLt⟩
  change (entry1205 i).check = true at h
  rcases fields1205 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1206 : OriginalRow227TriangleForward1206.entries.size = 32 := rfl

def entry1206 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1206.entries[i.val]'(by rw [size1206]; exact i.isLt)

theorem fields1206 (i : Fin 32) :
    (entry1206 i).IA = shift ∧ (entry1206 i).ID = S (122 + i.val + 1) ∧
      (entry1206 i).IC = S 91 ∧ (entry1206 i).Inext = T 90 (122 + i.val + 1) ∧
      (entry1206 i).Icur = T 90 (122 + i.val) ∧
      (entry1206 i).output = T 91 (122 + i.val) ∧
      (entry1206 i).charge = charge 90 (122 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1211_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1206 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (122 + i.val)) shift
      (S (122 + i.val + 1)) (S 91) (T 90 (122 + i.val + 1))
      (T 90 (122 + i.val)) (T 91 (122 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1206.entries OriginalRow227TriangleForward1206.checked
    ⟨i.val, by rw [size1206]; exact i.isLt⟩
  change (entry1206 i).check = true at h
  rcases fields1206 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1207 : OriginalRow227TriangleForward1207.entries.size = 32 := rfl

def entry1207 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1207.entries[i.val]'(by rw [size1207]; exact i.isLt)

theorem fields1207 (i : Fin 32) :
    (entry1207 i).IA = shift ∧ (entry1207 i).ID = S (154 + i.val + 1) ∧
      (entry1207 i).IC = S 91 ∧ (entry1207 i).Inext = T 90 (154 + i.val + 1) ∧
      (entry1207 i).Icur = T 90 (154 + i.val) ∧
      (entry1207 i).output = T 91 (154 + i.val) ∧
      (entry1207 i).charge = charge 90 (154 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1212_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1207 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (154 + i.val)) shift
      (S (154 + i.val + 1)) (S 91) (T 90 (154 + i.val + 1))
      (T 90 (154 + i.val)) (T 91 (154 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1207.entries OriginalRow227TriangleForward1207.checked
    ⟨i.val, by rw [size1207]; exact i.isLt⟩
  change (entry1207 i).check = true at h
  rcases fields1207 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1208 : OriginalRow227TriangleForward1208.entries.size = 32 := rfl

def entry1208 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1208.entries[i.val]'(by rw [size1208]; exact i.isLt)

theorem fields1208 (i : Fin 32) :
    (entry1208 i).IA = shift ∧ (entry1208 i).ID = S (186 + i.val + 1) ∧
      (entry1208 i).IC = S 91 ∧ (entry1208 i).Inext = T 90 (186 + i.val + 1) ∧
      (entry1208 i).Icur = T 90 (186 + i.val) ∧
      (entry1208 i).output = T 91 (186 + i.val) ∧
      (entry1208 i).charge = charge 90 (186 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1213_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1208 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (186 + i.val)) shift
      (S (186 + i.val + 1)) (S 91) (T 90 (186 + i.val + 1))
      (T 90 (186 + i.val)) (T 91 (186 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1208.entries OriginalRow227TriangleForward1208.checked
    ⟨i.val, by rw [size1208]; exact i.isLt⟩
  change (entry1208 i).check = true at h
  rcases fields1208 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1209 : OriginalRow227TriangleForward1209.entries.size = 32 := rfl

def entry1209 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1209.entries[i.val]'(by rw [size1209]; exact i.isLt)

theorem fields1209 (i : Fin 32) :
    (entry1209 i).IA = shift ∧ (entry1209 i).ID = S (218 + i.val + 1) ∧
      (entry1209 i).IC = S 91 ∧ (entry1209 i).Inext = T 90 (218 + i.val + 1) ∧
      (entry1209 i).Icur = T 90 (218 + i.val) ∧
      (entry1209 i).output = T 91 (218 + i.val) ∧
      (entry1209 i).charge = charge 90 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1214_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1209 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 91) (T 90 (218 + i.val + 1))
      (T 90 (218 + i.val)) (T 91 (218 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1209.entries OriginalRow227TriangleForward1209.checked
    ⟨i.val, by rw [size1209]; exact i.isLt⟩
  change (entry1209 i).check = true at h
  rcases fields1209 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1210 : OriginalRow227TriangleForward1210.entries.size = 32 := rfl

def entry1210 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1210.entries[i.val]'(by rw [size1210]; exact i.isLt)

theorem fields1210 (i : Fin 32) :
    (entry1210 i).IA = shift ∧ (entry1210 i).ID = S (250 + i.val + 1) ∧
      (entry1210 i).IC = S 91 ∧ (entry1210 i).Inext = T 90 (250 + i.val + 1) ∧
      (entry1210 i).Icur = T 90 (250 + i.val) ∧
      (entry1210 i).output = T 91 (250 + i.val) ∧
      (entry1210 i).charge = charge 90 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1215_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1210 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 91) (T 90 (250 + i.val + 1))
      (T 90 (250 + i.val)) (T 91 (250 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1210.entries OriginalRow227TriangleForward1210.checked
    ⟨i.val, by rw [size1210]; exact i.isLt⟩
  change (entry1210 i).check = true at h
  rcases fields1210 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1211 : OriginalRow227TriangleForward1211.entries.size = 32 := rfl

def entry1211 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1211.entries[i.val]'(by rw [size1211]; exact i.isLt)

theorem fields1211 (i : Fin 32) :
    (entry1211 i).IA = shift ∧ (entry1211 i).ID = S (282 + i.val + 1) ∧
      (entry1211 i).IC = S 91 ∧ (entry1211 i).Inext = T 90 (282 + i.val + 1) ∧
      (entry1211 i).Icur = T 90 (282 + i.val) ∧
      (entry1211 i).output = T 91 (282 + i.val) ∧
      (entry1211 i).charge = charge 90 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1216_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1211 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 91) (T 90 (282 + i.val + 1))
      (T 90 (282 + i.val)) (T 91 (282 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1211.entries OriginalRow227TriangleForward1211.checked
    ⟨i.val, by rw [size1211]; exact i.isLt⟩
  change (entry1211 i).check = true at h
  rcases fields1211 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1212 : OriginalRow227TriangleForward1212.entries.size = 32 := rfl

def entry1212 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1212.entries[i.val]'(by rw [size1212]; exact i.isLt)

theorem fields1212 (i : Fin 32) :
    (entry1212 i).IA = shift ∧ (entry1212 i).ID = S (314 + i.val + 1) ∧
      (entry1212 i).IC = S 91 ∧ (entry1212 i).Inext = T 90 (314 + i.val + 1) ∧
      (entry1212 i).Icur = T 90 (314 + i.val) ∧
      (entry1212 i).output = T 91 (314 + i.val) ∧
      (entry1212 i).charge = charge 90 (314 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1217_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1212 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (314 + i.val)) shift
      (S (314 + i.val + 1)) (S 91) (T 90 (314 + i.val + 1))
      (T 90 (314 + i.val)) (T 91 (314 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1212.entries OriginalRow227TriangleForward1212.checked
    ⟨i.val, by rw [size1212]; exact i.isLt⟩
  change (entry1212 i).check = true at h
  rcases fields1212 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1213 : OriginalRow227TriangleForward1213.entries.size = 32 := rfl

def entry1213 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1213.entries[i.val]'(by rw [size1213]; exact i.isLt)

theorem fields1213 (i : Fin 32) :
    (entry1213 i).IA = shift ∧ (entry1213 i).ID = S (346 + i.val + 1) ∧
      (entry1213 i).IC = S 91 ∧ (entry1213 i).Inext = T 90 (346 + i.val + 1) ∧
      (entry1213 i).Icur = T 90 (346 + i.val) ∧
      (entry1213 i).output = T 91 (346 + i.val) ∧
      (entry1213 i).charge = charge 90 (346 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1218_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1213 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (346 + i.val)) shift
      (S (346 + i.val + 1)) (S 91) (T 90 (346 + i.val + 1))
      (T 90 (346 + i.val)) (T 91 (346 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1213.entries OriginalRow227TriangleForward1213.checked
    ⟨i.val, by rw [size1213]; exact i.isLt⟩
  change (entry1213 i).check = true at h
  rcases fields1213 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1214 : OriginalRow227TriangleForward1214.entries.size = 32 := rfl

def entry1214 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1214.entries[i.val]'(by rw [size1214]; exact i.isLt)

theorem fields1214 (i : Fin 32) :
    (entry1214 i).IA = shift ∧ (entry1214 i).ID = S (378 + i.val + 1) ∧
      (entry1214 i).IC = S 91 ∧ (entry1214 i).Inext = T 90 (378 + i.val + 1) ∧
      (entry1214 i).Icur = T 90 (378 + i.val) ∧
      (entry1214 i).output = T 91 (378 + i.val) ∧
      (entry1214 i).charge = charge 90 (378 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1219_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1214 (i : Fin 32) :
    forwardStepOK (-768) (charge 90 (378 + i.val)) shift
      (S (378 + i.val + 1)) (S 91) (T 90 (378 + i.val + 1))
      (T 90 (378 + i.val)) (T 91 (378 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1214.entries OriginalRow227TriangleForward1214.checked
    ⟨i.val, by rw [size1214]; exact i.isLt⟩
  change (entry1214 i).check = true at h
  rcases fields1214 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1215 : OriginalRow227TriangleForward1215.entries.size = 1 := rfl

def entry1215 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1215.entries[i.val]'(by rw [size1215]; exact i.isLt)

theorem fields1215 (i : Fin 1) :
    (entry1215 i).IA = shift ∧ (entry1215 i).ID = S (410 + i.val + 1) ∧
      (entry1215 i).IC = S 91 ∧ (entry1215 i).Inext = T 90 (410 + i.val + 1) ∧
      (entry1215 i).Icur = T 90 (410 + i.val) ∧
      (entry1215 i).output = T 91 (410 + i.val) ∧
      (entry1215 i).charge = charge 90 (410 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root91).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow090.block1220_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1231_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1215 (i : Fin 1) :
    forwardStepOK (-768) (charge 90 (410 + i.val)) shift
      (S (410 + i.val + 1)) (S 91) (T 90 (410 + i.val + 1))
      (T 90 (410 + i.val)) (T 91 (410 + i.val))
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1215.entries OriginalRow227TriangleForward1215.checked
    ⟨i.val, by rw [size1215]; exact i.isLt⟩
  change (entry1215 i).check = true at h
  rcases fields1215 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 90 ≤ d) (hhi : d < 411) :
    forwardStepOK (-768) (charge 90 d) shift (S (d + 1)) (S 91)
      (T 90 (d + 1)) (T 90 d) (T 91 d)
      (OriginalRow227Roots.root_pos 91 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 90 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    by_cases h154 : d < 154
    ·
      by_cases h122 : d < 122
      ·
        have hi : d - 90 < 32 := by omega
        have heq : 90 + (d - 90) = d := by omega
        simpa only [heq] using step1205 ⟨d - 90, hi⟩
      ·
        have hi : d - 122 < 32 := by omega
        have heq : 122 + (d - 122) = d := by omega
        simpa only [heq] using step1206 ⟨d - 122, hi⟩
    ·
      by_cases h186 : d < 186
      ·
        have hi : d - 154 < 32 := by omega
        have heq : 154 + (d - 154) = d := by omega
        simpa only [heq] using step1207 ⟨d - 154, hi⟩
      ·
        by_cases h218 : d < 218
        ·
          have hi : d - 186 < 32 := by omega
          have heq : 186 + (d - 186) = d := by omega
          simpa only [heq] using step1208 ⟨d - 186, hi⟩
        ·
          have hi : d - 218 < 32 := by omega
          have heq : 218 + (d - 218) = d := by omega
          simpa only [heq] using step1209 ⟨d - 218, hi⟩
  ·
    by_cases h346 : d < 346
    ·
      by_cases h282 : d < 282
      ·
        have hi : d - 250 < 32 := by omega
        have heq : 250 + (d - 250) = d := by omega
        simpa only [heq] using step1210 ⟨d - 250, hi⟩
      ·
        by_cases h314 : d < 314
        ·
          have hi : d - 282 < 32 := by omega
          have heq : 282 + (d - 282) = d := by omega
          simpa only [heq] using step1211 ⟨d - 282, hi⟩
        ·
          have hi : d - 314 < 32 := by omega
          have heq : 314 + (d - 314) = d := by omega
          simpa only [heq] using step1212 ⟨d - 314, hi⟩
    ·
      by_cases h378 : d < 378
      ·
        have hi : d - 346 < 32 := by omega
        have heq : 346 + (d - 346) = d := by omega
        simpa only [heq] using step1213 ⟨d - 346, hi⟩
      ·
        by_cases h410 : d < 410
        ·
          have hi : d - 378 < 32 := by omega
          have heq : 378 + (d - 378) = d := by omega
          simpa only [heq] using step1214 ⟨d - 378, hi⟩
        ·
          have hi : d - 410 < 1 := by omega
          have heq : 410 + (d - 410) = d := by omega
          simpa only [heq] using step1215 ⟨d - 410, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1205,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1205,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1206,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1206,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1207,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1207,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1208,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1208,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1209,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1209,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1210,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1210,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1211,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1211,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1212,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1212,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1213,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1213,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1214,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1214,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.fields1215,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.step1215,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow091
