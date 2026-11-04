import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102
import Grothe.UpperChaos.OriginalRow227TriangleForward1316
import Grothe.UpperChaos.OriginalRow227TriangleForward1317
import Grothe.UpperChaos.OriginalRow227TriangleForward1318
import Grothe.UpperChaos.OriginalRow227TriangleForward1319
import Grothe.UpperChaos.OriginalRow227TriangleForward1320
import Grothe.UpperChaos.OriginalRow227TriangleForward1321
import Grothe.UpperChaos.OriginalRow227TriangleForward1322
import Grothe.UpperChaos.OriginalRow227TriangleForward1323
import Grothe.UpperChaos.OriginalRow227TriangleForward1324
import Grothe.UpperChaos.OriginalRow227TriangleForward1325

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1316 : OriginalRow227TriangleForward1316.entries.size = 32 := rfl

def entry1316 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1316.entries[i.val]'(by rw [size1316]; exact i.isLt)

theorem fields1316 (i : Fin 32) :
    (entry1316 i).IA = shift ∧ (entry1316 i).ID = S (101 + i.val + 1) ∧
      (entry1316 i).IC = S 102 ∧ (entry1316 i).Inext = T 101 (101 + i.val + 1) ∧
      (entry1316 i).Icur = T 101 (101 + i.val) ∧
      (entry1316 i).output = T 102 (101 + i.val) ∧
      (entry1316 i).charge = charge 101 (101 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1316 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (101 + i.val)) shift
      (S (101 + i.val + 1)) (S 102) (T 101 (101 + i.val + 1))
      (T 101 (101 + i.val)) (T 102 (101 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1316.entries OriginalRow227TriangleForward1316.checked
    ⟨i.val, by rw [size1316]; exact i.isLt⟩
  change (entry1316 i).check = true at h
  rcases fields1316 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1317 : OriginalRow227TriangleForward1317.entries.size = 32 := rfl

def entry1317 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1317.entries[i.val]'(by rw [size1317]; exact i.isLt)

theorem fields1317 (i : Fin 32) :
    (entry1317 i).IA = shift ∧ (entry1317 i).ID = S (133 + i.val + 1) ∧
      (entry1317 i).IC = S 102 ∧ (entry1317 i).Inext = T 101 (133 + i.val + 1) ∧
      (entry1317 i).Icur = T 101 (133 + i.val) ∧
      (entry1317 i).output = T 102 (133 + i.val) ∧
      (entry1317 i).charge = charge 101 (133 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1317 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (133 + i.val)) shift
      (S (133 + i.val + 1)) (S 102) (T 101 (133 + i.val + 1))
      (T 101 (133 + i.val)) (T 102 (133 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1317.entries OriginalRow227TriangleForward1317.checked
    ⟨i.val, by rw [size1317]; exact i.isLt⟩
  change (entry1317 i).check = true at h
  rcases fields1317 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1318 : OriginalRow227TriangleForward1318.entries.size = 32 := rfl

def entry1318 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1318.entries[i.val]'(by rw [size1318]; exact i.isLt)

theorem fields1318 (i : Fin 32) :
    (entry1318 i).IA = shift ∧ (entry1318 i).ID = S (165 + i.val + 1) ∧
      (entry1318 i).IC = S 102 ∧ (entry1318 i).Inext = T 101 (165 + i.val + 1) ∧
      (entry1318 i).Icur = T 101 (165 + i.val) ∧
      (entry1318 i).output = T 102 (165 + i.val) ∧
      (entry1318 i).charge = charge 101 (165 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1318 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (165 + i.val)) shift
      (S (165 + i.val + 1)) (S 102) (T 101 (165 + i.val + 1))
      (T 101 (165 + i.val)) (T 102 (165 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1318.entries OriginalRow227TriangleForward1318.checked
    ⟨i.val, by rw [size1318]; exact i.isLt⟩
  change (entry1318 i).check = true at h
  rcases fields1318 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1319 : OriginalRow227TriangleForward1319.entries.size = 32 := rfl

def entry1319 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1319.entries[i.val]'(by rw [size1319]; exact i.isLt)

theorem fields1319 (i : Fin 32) :
    (entry1319 i).IA = shift ∧ (entry1319 i).ID = S (197 + i.val + 1) ∧
      (entry1319 i).IC = S 102 ∧ (entry1319 i).Inext = T 101 (197 + i.val + 1) ∧
      (entry1319 i).Icur = T 101 (197 + i.val) ∧
      (entry1319 i).output = T 102 (197 + i.val) ∧
      (entry1319 i).charge = charge 101 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1319 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 102) (T 101 (197 + i.val + 1))
      (T 101 (197 + i.val)) (T 102 (197 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1319.entries OriginalRow227TriangleForward1319.checked
    ⟨i.val, by rw [size1319]; exact i.isLt⟩
  change (entry1319 i).check = true at h
  rcases fields1319 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1320 : OriginalRow227TriangleForward1320.entries.size = 32 := rfl

def entry1320 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1320.entries[i.val]'(by rw [size1320]; exact i.isLt)

theorem fields1320 (i : Fin 32) :
    (entry1320 i).IA = shift ∧ (entry1320 i).ID = S (229 + i.val + 1) ∧
      (entry1320 i).IC = S 102 ∧ (entry1320 i).Inext = T 101 (229 + i.val + 1) ∧
      (entry1320 i).Icur = T 101 (229 + i.val) ∧
      (entry1320 i).output = T 102 (229 + i.val) ∧
      (entry1320 i).charge = charge 101 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1320 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 102) (T 101 (229 + i.val + 1))
      (T 101 (229 + i.val)) (T 102 (229 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1320.entries OriginalRow227TriangleForward1320.checked
    ⟨i.val, by rw [size1320]; exact i.isLt⟩
  change (entry1320 i).check = true at h
  rcases fields1320 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1321 : OriginalRow227TriangleForward1321.entries.size = 32 := rfl

def entry1321 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1321.entries[i.val]'(by rw [size1321]; exact i.isLt)

theorem fields1321 (i : Fin 32) :
    (entry1321 i).IA = shift ∧ (entry1321 i).ID = S (261 + i.val + 1) ∧
      (entry1321 i).IC = S 102 ∧ (entry1321 i).Inext = T 101 (261 + i.val + 1) ∧
      (entry1321 i).Icur = T 101 (261 + i.val) ∧
      (entry1321 i).output = T 102 (261 + i.val) ∧
      (entry1321 i).charge = charge 101 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1321 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 102) (T 101 (261 + i.val + 1))
      (T 101 (261 + i.val)) (T 102 (261 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1321.entries OriginalRow227TriangleForward1321.checked
    ⟨i.val, by rw [size1321]; exact i.isLt⟩
  change (entry1321 i).check = true at h
  rcases fields1321 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1322 : OriginalRow227TriangleForward1322.entries.size = 32 := rfl

def entry1322 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1322.entries[i.val]'(by rw [size1322]; exact i.isLt)

theorem fields1322 (i : Fin 32) :
    (entry1322 i).IA = shift ∧ (entry1322 i).ID = S (293 + i.val + 1) ∧
      (entry1322 i).IC = S 102 ∧ (entry1322 i).Inext = T 101 (293 + i.val + 1) ∧
      (entry1322 i).Icur = T 101 (293 + i.val) ∧
      (entry1322 i).output = T 102 (293 + i.val) ∧
      (entry1322 i).charge = charge 101 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1322 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 102) (T 101 (293 + i.val + 1))
      (T 101 (293 + i.val)) (T 102 (293 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1322.entries OriginalRow227TriangleForward1322.checked
    ⟨i.val, by rw [size1322]; exact i.isLt⟩
  change (entry1322 i).check = true at h
  rcases fields1322 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1323 : OriginalRow227TriangleForward1323.entries.size = 32 := rfl

def entry1323 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1323.entries[i.val]'(by rw [size1323]; exact i.isLt)

theorem fields1323 (i : Fin 32) :
    (entry1323 i).IA = shift ∧ (entry1323 i).ID = S (325 + i.val + 1) ∧
      (entry1323 i).IC = S 102 ∧ (entry1323 i).Inext = T 101 (325 + i.val + 1) ∧
      (entry1323 i).Icur = T 101 (325 + i.val) ∧
      (entry1323 i).output = T 102 (325 + i.val) ∧
      (entry1323 i).charge = charge 101 (325 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1323 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (325 + i.val)) shift
      (S (325 + i.val + 1)) (S 102) (T 101 (325 + i.val + 1))
      (T 101 (325 + i.val)) (T 102 (325 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1323.entries OriginalRow227TriangleForward1323.checked
    ⟨i.val, by rw [size1323]; exact i.isLt⟩
  change (entry1323 i).check = true at h
  rcases fields1323 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1324 : OriginalRow227TriangleForward1324.entries.size = 32 := rfl

def entry1324 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1324.entries[i.val]'(by rw [size1324]; exact i.isLt)

theorem fields1324 (i : Fin 32) :
    (entry1324 i).IA = shift ∧ (entry1324 i).ID = S (357 + i.val + 1) ∧
      (entry1324 i).IC = S 102 ∧ (entry1324 i).Inext = T 101 (357 + i.val + 1) ∧
      (entry1324 i).Icur = T 101 (357 + i.val) ∧
      (entry1324 i).output = T 102 (357 + i.val) ∧
      (entry1324 i).charge = charge 101 (357 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1324 (i : Fin 32) :
    forwardStepOK (-768) (charge 101 (357 + i.val)) shift
      (S (357 + i.val + 1)) (S 102) (T 101 (357 + i.val + 1))
      (T 101 (357 + i.val)) (T 102 (357 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1324.entries OriginalRow227TriangleForward1324.checked
    ⟨i.val, by rw [size1324]; exact i.isLt⟩
  change (entry1324 i).check = true at h
  rcases fields1324 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1325 : OriginalRow227TriangleForward1325.entries.size = 11 := rfl

def entry1325 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1325.entries[i.val]'(by rw [size1325]; exact i.isLt)

theorem fields1325 (i : Fin 11) :
    (entry1325 i).IA = shift ∧ (entry1325 i).ID = S (389 + i.val + 1) ∧
      (entry1325 i).IC = S 102 ∧ (entry1325 i).Inext = T 101 (389 + i.val + 1) ∧
      (entry1325 i).Icur = T 101 (389 + i.val) ∧
      (entry1325 i).output = T 102 (389 + i.val) ∧
      (entry1325 i).charge = charge 101 (389 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings03.S_eq_root102).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1325 (i : Fin 11) :
    forwardStepOK (-768) (charge 101 (389 + i.val)) shift
      (S (389 + i.val + 1)) (S 102) (T 101 (389 + i.val + 1))
      (T 101 (389 + i.val)) (T 102 (389 + i.val))
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1325.entries OriginalRow227TriangleForward1325.checked
    ⟨i.val, by rw [size1325]; exact i.isLt⟩
  change (entry1325 i).check = true at h
  rcases fields1325 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 101 ≤ d) (hhi : d < 400) :
    forwardStepOK (-768) (charge 101 d) shift (S (d + 1)) (S 102)
      (T 101 (d + 1)) (T 101 d) (T 102 d)
      (OriginalRow227Roots.root_pos 102 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 101 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h165 : d < 165
    ·
      by_cases h133 : d < 133
      ·
        have hi : d - 101 < 32 := by omega
        have heq : 101 + (d - 101) = d := by omega
        simpa only [heq] using step1316 ⟨d - 101, hi⟩
      ·
        have hi : d - 133 < 32 := by omega
        have heq : 133 + (d - 133) = d := by omega
        simpa only [heq] using step1317 ⟨d - 133, hi⟩
    ·
      by_cases h197 : d < 197
      ·
        have hi : d - 165 < 32 := by omega
        have heq : 165 + (d - 165) = d := by omega
        simpa only [heq] using step1318 ⟨d - 165, hi⟩
      ·
        by_cases h229 : d < 229
        ·
          have hi : d - 197 < 32 := by omega
          have heq : 197 + (d - 197) = d := by omega
          simpa only [heq] using step1319 ⟨d - 197, hi⟩
        ·
          have hi : d - 229 < 32 := by omega
          have heq : 229 + (d - 229) = d := by omega
          simpa only [heq] using step1320 ⟨d - 229, hi⟩
  ·
    by_cases h325 : d < 325
    ·
      by_cases h293 : d < 293
      ·
        have hi : d - 261 < 32 := by omega
        have heq : 261 + (d - 261) = d := by omega
        simpa only [heq] using step1321 ⟨d - 261, hi⟩
      ·
        have hi : d - 293 < 32 := by omega
        have heq : 293 + (d - 293) = d := by omega
        simpa only [heq] using step1322 ⟨d - 293, hi⟩
    ·
      by_cases h357 : d < 357
      ·
        have hi : d - 325 < 32 := by omega
        have heq : 325 + (d - 325) = d := by omega
        simpa only [heq] using step1323 ⟨d - 325, hi⟩
      ·
        by_cases h389 : d < 389
        ·
          have hi : d - 357 < 32 := by omega
          have heq : 357 + (d - 357) = d := by omega
          simpa only [heq] using step1324 ⟨d - 357, hi⟩
        ·
          have hi : d - 389 < 11 := by omega
          have heq : 389 + (d - 389) = d := by omega
          simpa only [heq] using step1325 ⟨d - 389, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1316,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1316,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1317,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1317,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1318,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1318,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1319,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1319,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1320,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1320,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1321,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1321,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1322,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1322,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1323,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1323,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1324,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1324,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.fields1325,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.step1325,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow102
