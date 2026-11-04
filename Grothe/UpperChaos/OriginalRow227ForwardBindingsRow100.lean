import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100
import Grothe.UpperChaos.OriginalRow227TriangleForward1296
import Grothe.UpperChaos.OriginalRow227TriangleForward1297
import Grothe.UpperChaos.OriginalRow227TriangleForward1298
import Grothe.UpperChaos.OriginalRow227TriangleForward1299
import Grothe.UpperChaos.OriginalRow227TriangleForward1300
import Grothe.UpperChaos.OriginalRow227TriangleForward1301
import Grothe.UpperChaos.OriginalRow227TriangleForward1302
import Grothe.UpperChaos.OriginalRow227TriangleForward1303
import Grothe.UpperChaos.OriginalRow227TriangleForward1304
import Grothe.UpperChaos.OriginalRow227TriangleForward1305

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1296 : OriginalRow227TriangleForward1296.entries.size = 32 := rfl

def entry1296 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1296.entries[i.val]'(by rw [size1296]; exact i.isLt)

theorem fields1296 (i : Fin 32) :
    (entry1296 i).IA = shift ∧ (entry1296 i).ID = S (99 + i.val + 1) ∧
      (entry1296 i).IC = S 100 ∧ (entry1296 i).Inext = T 99 (99 + i.val + 1) ∧
      (entry1296 i).Icur = T 99 (99 + i.val) ∧
      (entry1296 i).output = T 100 (99 + i.val) ∧
      (entry1296 i).charge = charge 99 (99 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1296 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (99 + i.val)) shift
      (S (99 + i.val + 1)) (S 100) (T 99 (99 + i.val + 1))
      (T 99 (99 + i.val)) (T 100 (99 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1296.entries OriginalRow227TriangleForward1296.checked
    ⟨i.val, by rw [size1296]; exact i.isLt⟩
  change (entry1296 i).check = true at h
  rcases fields1296 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1297 : OriginalRow227TriangleForward1297.entries.size = 32 := rfl

def entry1297 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1297.entries[i.val]'(by rw [size1297]; exact i.isLt)

theorem fields1297 (i : Fin 32) :
    (entry1297 i).IA = shift ∧ (entry1297 i).ID = S (131 + i.val + 1) ∧
      (entry1297 i).IC = S 100 ∧ (entry1297 i).Inext = T 99 (131 + i.val + 1) ∧
      (entry1297 i).Icur = T 99 (131 + i.val) ∧
      (entry1297 i).output = T 100 (131 + i.val) ∧
      (entry1297 i).charge = charge 99 (131 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1297 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (131 + i.val)) shift
      (S (131 + i.val + 1)) (S 100) (T 99 (131 + i.val + 1))
      (T 99 (131 + i.val)) (T 100 (131 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1297.entries OriginalRow227TriangleForward1297.checked
    ⟨i.val, by rw [size1297]; exact i.isLt⟩
  change (entry1297 i).check = true at h
  rcases fields1297 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1298 : OriginalRow227TriangleForward1298.entries.size = 32 := rfl

def entry1298 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1298.entries[i.val]'(by rw [size1298]; exact i.isLt)

theorem fields1298 (i : Fin 32) :
    (entry1298 i).IA = shift ∧ (entry1298 i).ID = S (163 + i.val + 1) ∧
      (entry1298 i).IC = S 100 ∧ (entry1298 i).Inext = T 99 (163 + i.val + 1) ∧
      (entry1298 i).Icur = T 99 (163 + i.val) ∧
      (entry1298 i).output = T 100 (163 + i.val) ∧
      (entry1298 i).charge = charge 99 (163 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1298 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (163 + i.val)) shift
      (S (163 + i.val + 1)) (S 100) (T 99 (163 + i.val + 1))
      (T 99 (163 + i.val)) (T 100 (163 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1298.entries OriginalRow227TriangleForward1298.checked
    ⟨i.val, by rw [size1298]; exact i.isLt⟩
  change (entry1298 i).check = true at h
  rcases fields1298 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1299 : OriginalRow227TriangleForward1299.entries.size = 32 := rfl

def entry1299 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1299.entries[i.val]'(by rw [size1299]; exact i.isLt)

theorem fields1299 (i : Fin 32) :
    (entry1299 i).IA = shift ∧ (entry1299 i).ID = S (195 + i.val + 1) ∧
      (entry1299 i).IC = S 100 ∧ (entry1299 i).Inext = T 99 (195 + i.val + 1) ∧
      (entry1299 i).Icur = T 99 (195 + i.val) ∧
      (entry1299 i).output = T 100 (195 + i.val) ∧
      (entry1299 i).charge = charge 99 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1299 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 100) (T 99 (195 + i.val + 1))
      (T 99 (195 + i.val)) (T 100 (195 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1299.entries OriginalRow227TriangleForward1299.checked
    ⟨i.val, by rw [size1299]; exact i.isLt⟩
  change (entry1299 i).check = true at h
  rcases fields1299 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1300 : OriginalRow227TriangleForward1300.entries.size = 32 := rfl

def entry1300 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1300.entries[i.val]'(by rw [size1300]; exact i.isLt)

theorem fields1300 (i : Fin 32) :
    (entry1300 i).IA = shift ∧ (entry1300 i).ID = S (227 + i.val + 1) ∧
      (entry1300 i).IC = S 100 ∧ (entry1300 i).Inext = T 99 (227 + i.val + 1) ∧
      (entry1300 i).Icur = T 99 (227 + i.val) ∧
      (entry1300 i).output = T 100 (227 + i.val) ∧
      (entry1300 i).charge = charge 99 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1300 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 100) (T 99 (227 + i.val + 1))
      (T 99 (227 + i.val)) (T 100 (227 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1300.entries OriginalRow227TriangleForward1300.checked
    ⟨i.val, by rw [size1300]; exact i.isLt⟩
  change (entry1300 i).check = true at h
  rcases fields1300 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1301 : OriginalRow227TriangleForward1301.entries.size = 32 := rfl

def entry1301 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1301.entries[i.val]'(by rw [size1301]; exact i.isLt)

theorem fields1301 (i : Fin 32) :
    (entry1301 i).IA = shift ∧ (entry1301 i).ID = S (259 + i.val + 1) ∧
      (entry1301 i).IC = S 100 ∧ (entry1301 i).Inext = T 99 (259 + i.val + 1) ∧
      (entry1301 i).Icur = T 99 (259 + i.val) ∧
      (entry1301 i).output = T 100 (259 + i.val) ∧
      (entry1301 i).charge = charge 99 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1301 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 100) (T 99 (259 + i.val + 1))
      (T 99 (259 + i.val)) (T 100 (259 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1301.entries OriginalRow227TriangleForward1301.checked
    ⟨i.val, by rw [size1301]; exact i.isLt⟩
  change (entry1301 i).check = true at h
  rcases fields1301 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1302 : OriginalRow227TriangleForward1302.entries.size = 32 := rfl

def entry1302 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1302.entries[i.val]'(by rw [size1302]; exact i.isLt)

theorem fields1302 (i : Fin 32) :
    (entry1302 i).IA = shift ∧ (entry1302 i).ID = S (291 + i.val + 1) ∧
      (entry1302 i).IC = S 100 ∧ (entry1302 i).Inext = T 99 (291 + i.val + 1) ∧
      (entry1302 i).Icur = T 99 (291 + i.val) ∧
      (entry1302 i).output = T 100 (291 + i.val) ∧
      (entry1302 i).charge = charge 99 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1302 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 100) (T 99 (291 + i.val + 1))
      (T 99 (291 + i.val)) (T 100 (291 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1302.entries OriginalRow227TriangleForward1302.checked
    ⟨i.val, by rw [size1302]; exact i.isLt⟩
  change (entry1302 i).check = true at h
  rcases fields1302 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1303 : OriginalRow227TriangleForward1303.entries.size = 32 := rfl

def entry1303 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1303.entries[i.val]'(by rw [size1303]; exact i.isLt)

theorem fields1303 (i : Fin 32) :
    (entry1303 i).IA = shift ∧ (entry1303 i).ID = S (323 + i.val + 1) ∧
      (entry1303 i).IC = S 100 ∧ (entry1303 i).Inext = T 99 (323 + i.val + 1) ∧
      (entry1303 i).Icur = T 99 (323 + i.val) ∧
      (entry1303 i).output = T 100 (323 + i.val) ∧
      (entry1303 i).charge = charge 99 (323 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1303 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (323 + i.val)) shift
      (S (323 + i.val + 1)) (S 100) (T 99 (323 + i.val + 1))
      (T 99 (323 + i.val)) (T 100 (323 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1303.entries OriginalRow227TriangleForward1303.checked
    ⟨i.val, by rw [size1303]; exact i.isLt⟩
  change (entry1303 i).check = true at h
  rcases fields1303 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1304 : OriginalRow227TriangleForward1304.entries.size = 32 := rfl

def entry1304 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1304.entries[i.val]'(by rw [size1304]; exact i.isLt)

theorem fields1304 (i : Fin 32) :
    (entry1304 i).IA = shift ∧ (entry1304 i).ID = S (355 + i.val + 1) ∧
      (entry1304 i).IC = S 100 ∧ (entry1304 i).Inext = T 99 (355 + i.val + 1) ∧
      (entry1304 i).Icur = T 99 (355 + i.val) ∧
      (entry1304 i).output = T 100 (355 + i.val) ∧
      (entry1304 i).charge = charge 99 (355 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1304 (i : Fin 32) :
    forwardStepOK (-768) (charge 99 (355 + i.val)) shift
      (S (355 + i.val + 1)) (S 100) (T 99 (355 + i.val + 1))
      (T 99 (355 + i.val)) (T 100 (355 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1304.entries OriginalRow227TriangleForward1304.checked
    ⟨i.val, by rw [size1304]; exact i.isLt⟩
  change (entry1304 i).check = true at h
  rcases fields1304 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1305 : OriginalRow227TriangleForward1305.entries.size = 15 := rfl

def entry1305 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1305.entries[i.val]'(by rw [size1305]; exact i.isLt)

theorem fields1305 (i : Fin 15) :
    (entry1305 i).IA = shift ∧ (entry1305 i).ID = S (387 + i.val + 1) ∧
      (entry1305 i).IC = S 100 ∧ (entry1305 i).Inext = T 99 (387 + i.val + 1) ∧
      (entry1305 i).Icur = T 99 (387 + i.val) ∧
      (entry1305 i).output = T 100 (387 + i.val) ∧
      (entry1305 i).charge = charge 99 (387 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings03.S_eq_root100).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1305 (i : Fin 15) :
    forwardStepOK (-768) (charge 99 (387 + i.val)) shift
      (S (387 + i.val + 1)) (S 100) (T 99 (387 + i.val + 1))
      (T 99 (387 + i.val)) (T 100 (387 + i.val))
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1305.entries OriginalRow227TriangleForward1305.checked
    ⟨i.val, by rw [size1305]; exact i.isLt⟩
  change (entry1305 i).check = true at h
  rcases fields1305 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 99 ≤ d) (hhi : d < 402) :
    forwardStepOK (-768) (charge 99 d) shift (S (d + 1)) (S 100)
      (T 99 (d + 1)) (T 99 d) (T 100 d)
      (OriginalRow227Roots.root_pos 100 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 99 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h163 : d < 163
    ·
      by_cases h131 : d < 131
      ·
        have hi : d - 99 < 32 := by omega
        have heq : 99 + (d - 99) = d := by omega
        simpa only [heq] using step1296 ⟨d - 99, hi⟩
      ·
        have hi : d - 131 < 32 := by omega
        have heq : 131 + (d - 131) = d := by omega
        simpa only [heq] using step1297 ⟨d - 131, hi⟩
    ·
      by_cases h195 : d < 195
      ·
        have hi : d - 163 < 32 := by omega
        have heq : 163 + (d - 163) = d := by omega
        simpa only [heq] using step1298 ⟨d - 163, hi⟩
      ·
        by_cases h227 : d < 227
        ·
          have hi : d - 195 < 32 := by omega
          have heq : 195 + (d - 195) = d := by omega
          simpa only [heq] using step1299 ⟨d - 195, hi⟩
        ·
          have hi : d - 227 < 32 := by omega
          have heq : 227 + (d - 227) = d := by omega
          simpa only [heq] using step1300 ⟨d - 227, hi⟩
  ·
    by_cases h323 : d < 323
    ·
      by_cases h291 : d < 291
      ·
        have hi : d - 259 < 32 := by omega
        have heq : 259 + (d - 259) = d := by omega
        simpa only [heq] using step1301 ⟨d - 259, hi⟩
      ·
        have hi : d - 291 < 32 := by omega
        have heq : 291 + (d - 291) = d := by omega
        simpa only [heq] using step1302 ⟨d - 291, hi⟩
    ·
      by_cases h355 : d < 355
      ·
        have hi : d - 323 < 32 := by omega
        have heq : 323 + (d - 323) = d := by omega
        simpa only [heq] using step1303 ⟨d - 323, hi⟩
      ·
        by_cases h387 : d < 387
        ·
          have hi : d - 355 < 32 := by omega
          have heq : 355 + (d - 355) = d := by omega
          simpa only [heq] using step1304 ⟨d - 355, hi⟩
        ·
          have hi : d - 387 < 15 := by omega
          have heq : 387 + (d - 387) = d := by omega
          simpa only [heq] using step1305 ⟨d - 387, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1296,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1296,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1297,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1297,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1298,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1298,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1299,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1299,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1300,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1300,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1301,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1301,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1302,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1302,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1303,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1303,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1304,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1304,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.fields1305,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.step1305,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow100
