import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow091
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092
import Grothe.UpperChaos.OriginalRow227TriangleForward1216
import Grothe.UpperChaos.OriginalRow227TriangleForward1217
import Grothe.UpperChaos.OriginalRow227TriangleForward1218
import Grothe.UpperChaos.OriginalRow227TriangleForward1219
import Grothe.UpperChaos.OriginalRow227TriangleForward1220
import Grothe.UpperChaos.OriginalRow227TriangleForward1221
import Grothe.UpperChaos.OriginalRow227TriangleForward1222
import Grothe.UpperChaos.OriginalRow227TriangleForward1223
import Grothe.UpperChaos.OriginalRow227TriangleForward1224
import Grothe.UpperChaos.OriginalRow227TriangleForward1225

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1216 : OriginalRow227TriangleForward1216.entries.size = 32 := rfl

def entry1216 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1216.entries[i.val]'(by rw [size1216]; exact i.isLt)

theorem fields1216 (i : Fin 32) :
    (entry1216 i).IA = shift ∧ (entry1216 i).ID = S (91 + i.val + 1) ∧
      (entry1216 i).IC = S 92 ∧ (entry1216 i).Inext = T 91 (91 + i.val + 1) ∧
      (entry1216 i).Icur = T 91 (91 + i.val) ∧
      (entry1216 i).output = T 92 (91 + i.val) ∧
      (entry1216 i).charge = charge 91 (91 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1221_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1216 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (91 + i.val)) shift
      (S (91 + i.val + 1)) (S 92) (T 91 (91 + i.val + 1))
      (T 91 (91 + i.val)) (T 92 (91 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1216.entries OriginalRow227TriangleForward1216.checked
    ⟨i.val, by rw [size1216]; exact i.isLt⟩
  change (entry1216 i).check = true at h
  rcases fields1216 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1217 : OriginalRow227TriangleForward1217.entries.size = 32 := rfl

def entry1217 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1217.entries[i.val]'(by rw [size1217]; exact i.isLt)

theorem fields1217 (i : Fin 32) :
    (entry1217 i).IA = shift ∧ (entry1217 i).ID = S (123 + i.val + 1) ∧
      (entry1217 i).IC = S 92 ∧ (entry1217 i).Inext = T 91 (123 + i.val + 1) ∧
      (entry1217 i).Icur = T 91 (123 + i.val) ∧
      (entry1217 i).output = T 92 (123 + i.val) ∧
      (entry1217 i).charge = charge 91 (123 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1222_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1217 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (123 + i.val)) shift
      (S (123 + i.val + 1)) (S 92) (T 91 (123 + i.val + 1))
      (T 91 (123 + i.val)) (T 92 (123 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1217.entries OriginalRow227TriangleForward1217.checked
    ⟨i.val, by rw [size1217]; exact i.isLt⟩
  change (entry1217 i).check = true at h
  rcases fields1217 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1218 : OriginalRow227TriangleForward1218.entries.size = 32 := rfl

def entry1218 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1218.entries[i.val]'(by rw [size1218]; exact i.isLt)

theorem fields1218 (i : Fin 32) :
    (entry1218 i).IA = shift ∧ (entry1218 i).ID = S (155 + i.val + 1) ∧
      (entry1218 i).IC = S 92 ∧ (entry1218 i).Inext = T 91 (155 + i.val + 1) ∧
      (entry1218 i).Icur = T 91 (155 + i.val) ∧
      (entry1218 i).output = T 92 (155 + i.val) ∧
      (entry1218 i).charge = charge 91 (155 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1223_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1218 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (155 + i.val)) shift
      (S (155 + i.val + 1)) (S 92) (T 91 (155 + i.val + 1))
      (T 91 (155 + i.val)) (T 92 (155 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1218.entries OriginalRow227TriangleForward1218.checked
    ⟨i.val, by rw [size1218]; exact i.isLt⟩
  change (entry1218 i).check = true at h
  rcases fields1218 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1219 : OriginalRow227TriangleForward1219.entries.size = 32 := rfl

def entry1219 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1219.entries[i.val]'(by rw [size1219]; exact i.isLt)

theorem fields1219 (i : Fin 32) :
    (entry1219 i).IA = shift ∧ (entry1219 i).ID = S (187 + i.val + 1) ∧
      (entry1219 i).IC = S 92 ∧ (entry1219 i).Inext = T 91 (187 + i.val + 1) ∧
      (entry1219 i).Icur = T 91 (187 + i.val) ∧
      (entry1219 i).output = T 92 (187 + i.val) ∧
      (entry1219 i).charge = charge 91 (187 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1224_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1219 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (187 + i.val)) shift
      (S (187 + i.val + 1)) (S 92) (T 91 (187 + i.val + 1))
      (T 91 (187 + i.val)) (T 92 (187 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1219.entries OriginalRow227TriangleForward1219.checked
    ⟨i.val, by rw [size1219]; exact i.isLt⟩
  change (entry1219 i).check = true at h
  rcases fields1219 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1220 : OriginalRow227TriangleForward1220.entries.size = 32 := rfl

def entry1220 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1220.entries[i.val]'(by rw [size1220]; exact i.isLt)

theorem fields1220 (i : Fin 32) :
    (entry1220 i).IA = shift ∧ (entry1220 i).ID = S (219 + i.val + 1) ∧
      (entry1220 i).IC = S 92 ∧ (entry1220 i).Inext = T 91 (219 + i.val + 1) ∧
      (entry1220 i).Icur = T 91 (219 + i.val) ∧
      (entry1220 i).output = T 92 (219 + i.val) ∧
      (entry1220 i).charge = charge 91 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1225_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1220 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 92) (T 91 (219 + i.val + 1))
      (T 91 (219 + i.val)) (T 92 (219 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1220.entries OriginalRow227TriangleForward1220.checked
    ⟨i.val, by rw [size1220]; exact i.isLt⟩
  change (entry1220 i).check = true at h
  rcases fields1220 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1221 : OriginalRow227TriangleForward1221.entries.size = 32 := rfl

def entry1221 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1221.entries[i.val]'(by rw [size1221]; exact i.isLt)

theorem fields1221 (i : Fin 32) :
    (entry1221 i).IA = shift ∧ (entry1221 i).ID = S (251 + i.val + 1) ∧
      (entry1221 i).IC = S 92 ∧ (entry1221 i).Inext = T 91 (251 + i.val + 1) ∧
      (entry1221 i).Icur = T 91 (251 + i.val) ∧
      (entry1221 i).output = T 92 (251 + i.val) ∧
      (entry1221 i).charge = charge 91 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1226_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1221 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 92) (T 91 (251 + i.val + 1))
      (T 91 (251 + i.val)) (T 92 (251 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1221.entries OriginalRow227TriangleForward1221.checked
    ⟨i.val, by rw [size1221]; exact i.isLt⟩
  change (entry1221 i).check = true at h
  rcases fields1221 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1222 : OriginalRow227TriangleForward1222.entries.size = 32 := rfl

def entry1222 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1222.entries[i.val]'(by rw [size1222]; exact i.isLt)

theorem fields1222 (i : Fin 32) :
    (entry1222 i).IA = shift ∧ (entry1222 i).ID = S (283 + i.val + 1) ∧
      (entry1222 i).IC = S 92 ∧ (entry1222 i).Inext = T 91 (283 + i.val + 1) ∧
      (entry1222 i).Icur = T 91 (283 + i.val) ∧
      (entry1222 i).output = T 92 (283 + i.val) ∧
      (entry1222 i).charge = charge 91 (283 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1227_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1222 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (283 + i.val)) shift
      (S (283 + i.val + 1)) (S 92) (T 91 (283 + i.val + 1))
      (T 91 (283 + i.val)) (T 92 (283 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1222.entries OriginalRow227TriangleForward1222.checked
    ⟨i.val, by rw [size1222]; exact i.isLt⟩
  change (entry1222 i).check = true at h
  rcases fields1222 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1223 : OriginalRow227TriangleForward1223.entries.size = 32 := rfl

def entry1223 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1223.entries[i.val]'(by rw [size1223]; exact i.isLt)

theorem fields1223 (i : Fin 32) :
    (entry1223 i).IA = shift ∧ (entry1223 i).ID = S (315 + i.val + 1) ∧
      (entry1223 i).IC = S 92 ∧ (entry1223 i).Inext = T 91 (315 + i.val + 1) ∧
      (entry1223 i).Icur = T 91 (315 + i.val) ∧
      (entry1223 i).output = T 92 (315 + i.val) ∧
      (entry1223 i).charge = charge 91 (315 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1228_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1223 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (315 + i.val)) shift
      (S (315 + i.val + 1)) (S 92) (T 91 (315 + i.val + 1))
      (T 91 (315 + i.val)) (T 92 (315 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1223.entries OriginalRow227TriangleForward1223.checked
    ⟨i.val, by rw [size1223]; exact i.isLt⟩
  change (entry1223 i).check = true at h
  rcases fields1223 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1224 : OriginalRow227TriangleForward1224.entries.size = 32 := rfl

def entry1224 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1224.entries[i.val]'(by rw [size1224]; exact i.isLt)

theorem fields1224 (i : Fin 32) :
    (entry1224 i).IA = shift ∧ (entry1224 i).ID = S (347 + i.val + 1) ∧
      (entry1224 i).IC = S 92 ∧ (entry1224 i).Inext = T 91 (347 + i.val + 1) ∧
      (entry1224 i).Icur = T 91 (347 + i.val) ∧
      (entry1224 i).output = T 92 (347 + i.val) ∧
      (entry1224 i).charge = charge 91 (347 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1229_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1224 (i : Fin 32) :
    forwardStepOK (-768) (charge 91 (347 + i.val)) shift
      (S (347 + i.val + 1)) (S 92) (T 91 (347 + i.val + 1))
      (T 91 (347 + i.val)) (T 92 (347 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1224.entries OriginalRow227TriangleForward1224.checked
    ⟨i.val, by rw [size1224]; exact i.isLt⟩
  change (entry1224 i).check = true at h
  rcases fields1224 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1225 : OriginalRow227TriangleForward1225.entries.size = 31 := rfl

def entry1225 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1225.entries[i.val]'(by rw [size1225]; exact i.isLt)

theorem fields1225 (i : Fin 31) :
    (entry1225 i).IA = shift ∧ (entry1225 i).ID = S (379 + i.val + 1) ∧
      (entry1225 i).IC = S 92 ∧ (entry1225 i).Inext = T 91 (379 + i.val + 1) ∧
      (entry1225 i).Icur = T 91 (379 + i.val) ∧
      (entry1225 i).output = T 92 (379 + i.val) ∧
      (entry1225 i).charge = charge 91 (379 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root92).symm,
      (OriginalRow227TriangleBindingsRow091.block1231_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow091.block1230_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1225 (i : Fin 31) :
    forwardStepOK (-768) (charge 91 (379 + i.val)) shift
      (S (379 + i.val + 1)) (S 92) (T 91 (379 + i.val + 1))
      (T 91 (379 + i.val)) (T 92 (379 + i.val))
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1225.entries OriginalRow227TriangleForward1225.checked
    ⟨i.val, by rw [size1225]; exact i.isLt⟩
  change (entry1225 i).check = true at h
  rcases fields1225 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 91 ≤ d) (hhi : d < 410) :
    forwardStepOK (-768) (charge 91 d) shift (S (d + 1)) (S 92)
      (T 91 (d + 1)) (T 91 d) (T 92 d)
      (OriginalRow227Roots.root_pos 92 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 91 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    by_cases h155 : d < 155
    ·
      by_cases h123 : d < 123
      ·
        have hi : d - 91 < 32 := by omega
        have heq : 91 + (d - 91) = d := by omega
        simpa only [heq] using step1216 ⟨d - 91, hi⟩
      ·
        have hi : d - 123 < 32 := by omega
        have heq : 123 + (d - 123) = d := by omega
        simpa only [heq] using step1217 ⟨d - 123, hi⟩
    ·
      by_cases h187 : d < 187
      ·
        have hi : d - 155 < 32 := by omega
        have heq : 155 + (d - 155) = d := by omega
        simpa only [heq] using step1218 ⟨d - 155, hi⟩
      ·
        by_cases h219 : d < 219
        ·
          have hi : d - 187 < 32 := by omega
          have heq : 187 + (d - 187) = d := by omega
          simpa only [heq] using step1219 ⟨d - 187, hi⟩
        ·
          have hi : d - 219 < 32 := by omega
          have heq : 219 + (d - 219) = d := by omega
          simpa only [heq] using step1220 ⟨d - 219, hi⟩
  ·
    by_cases h315 : d < 315
    ·
      by_cases h283 : d < 283
      ·
        have hi : d - 251 < 32 := by omega
        have heq : 251 + (d - 251) = d := by omega
        simpa only [heq] using step1221 ⟨d - 251, hi⟩
      ·
        have hi : d - 283 < 32 := by omega
        have heq : 283 + (d - 283) = d := by omega
        simpa only [heq] using step1222 ⟨d - 283, hi⟩
    ·
      by_cases h347 : d < 347
      ·
        have hi : d - 315 < 32 := by omega
        have heq : 315 + (d - 315) = d := by omega
        simpa only [heq] using step1223 ⟨d - 315, hi⟩
      ·
        by_cases h379 : d < 379
        ·
          have hi : d - 347 < 32 := by omega
          have heq : 347 + (d - 347) = d := by omega
          simpa only [heq] using step1224 ⟨d - 347, hi⟩
        ·
          have hi : d - 379 < 31 := by omega
          have heq : 379 + (d - 379) = d := by omega
          simpa only [heq] using step1225 ⟨d - 379, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1216,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1216,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1217,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1217,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1218,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1218,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1219,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1219,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1220,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1220,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1221,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1221,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1222,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1222,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1223,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1223,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1224,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1224,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.fields1225,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.step1225,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow092
