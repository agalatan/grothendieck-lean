import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow102
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103
import Grothe.UpperChaos.OriginalRow227TriangleForward1326
import Grothe.UpperChaos.OriginalRow227TriangleForward1327
import Grothe.UpperChaos.OriginalRow227TriangleForward1328
import Grothe.UpperChaos.OriginalRow227TriangleForward1329
import Grothe.UpperChaos.OriginalRow227TriangleForward1330
import Grothe.UpperChaos.OriginalRow227TriangleForward1331
import Grothe.UpperChaos.OriginalRow227TriangleForward1332
import Grothe.UpperChaos.OriginalRow227TriangleForward1333
import Grothe.UpperChaos.OriginalRow227TriangleForward1334
import Grothe.UpperChaos.OriginalRow227TriangleForward1335

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1326 : OriginalRow227TriangleForward1326.entries.size = 32 := rfl

def entry1326 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1326.entries[i.val]'(by rw [size1326]; exact i.isLt)

theorem fields1326 (i : Fin 32) :
    (entry1326 i).IA = shift ∧ (entry1326 i).ID = S (102 + i.val + 1) ∧
      (entry1326 i).IC = S 103 ∧ (entry1326 i).Inext = T 102 (102 + i.val + 1) ∧
      (entry1326 i).Icur = T 102 (102 + i.val) ∧
      (entry1326 i).output = T 103 (102 + i.val) ∧
      (entry1326 i).charge = charge 102 (102 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1332_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1326 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (102 + i.val)) shift
      (S (102 + i.val + 1)) (S 103) (T 102 (102 + i.val + 1))
      (T 102 (102 + i.val)) (T 103 (102 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1326.entries OriginalRow227TriangleForward1326.checked
    ⟨i.val, by rw [size1326]; exact i.isLt⟩
  change (entry1326 i).check = true at h
  rcases fields1326 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1327 : OriginalRow227TriangleForward1327.entries.size = 32 := rfl

def entry1327 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1327.entries[i.val]'(by rw [size1327]; exact i.isLt)

theorem fields1327 (i : Fin 32) :
    (entry1327 i).IA = shift ∧ (entry1327 i).ID = S (134 + i.val + 1) ∧
      (entry1327 i).IC = S 103 ∧ (entry1327 i).Inext = T 102 (134 + i.val + 1) ∧
      (entry1327 i).Icur = T 102 (134 + i.val) ∧
      (entry1327 i).output = T 103 (134 + i.val) ∧
      (entry1327 i).charge = charge 102 (134 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1333_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1327 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (134 + i.val)) shift
      (S (134 + i.val + 1)) (S 103) (T 102 (134 + i.val + 1))
      (T 102 (134 + i.val)) (T 103 (134 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1327.entries OriginalRow227TriangleForward1327.checked
    ⟨i.val, by rw [size1327]; exact i.isLt⟩
  change (entry1327 i).check = true at h
  rcases fields1327 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1328 : OriginalRow227TriangleForward1328.entries.size = 32 := rfl

def entry1328 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1328.entries[i.val]'(by rw [size1328]; exact i.isLt)

theorem fields1328 (i : Fin 32) :
    (entry1328 i).IA = shift ∧ (entry1328 i).ID = S (166 + i.val + 1) ∧
      (entry1328 i).IC = S 103 ∧ (entry1328 i).Inext = T 102 (166 + i.val + 1) ∧
      (entry1328 i).Icur = T 102 (166 + i.val) ∧
      (entry1328 i).output = T 103 (166 + i.val) ∧
      (entry1328 i).charge = charge 102 (166 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1334_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1328 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (166 + i.val)) shift
      (S (166 + i.val + 1)) (S 103) (T 102 (166 + i.val + 1))
      (T 102 (166 + i.val)) (T 103 (166 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1328.entries OriginalRow227TriangleForward1328.checked
    ⟨i.val, by rw [size1328]; exact i.isLt⟩
  change (entry1328 i).check = true at h
  rcases fields1328 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1329 : OriginalRow227TriangleForward1329.entries.size = 32 := rfl

def entry1329 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1329.entries[i.val]'(by rw [size1329]; exact i.isLt)

theorem fields1329 (i : Fin 32) :
    (entry1329 i).IA = shift ∧ (entry1329 i).ID = S (198 + i.val + 1) ∧
      (entry1329 i).IC = S 103 ∧ (entry1329 i).Inext = T 102 (198 + i.val + 1) ∧
      (entry1329 i).Icur = T 102 (198 + i.val) ∧
      (entry1329 i).output = T 103 (198 + i.val) ∧
      (entry1329 i).charge = charge 102 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1335_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1329 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 103) (T 102 (198 + i.val + 1))
      (T 102 (198 + i.val)) (T 103 (198 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1329.entries OriginalRow227TriangleForward1329.checked
    ⟨i.val, by rw [size1329]; exact i.isLt⟩
  change (entry1329 i).check = true at h
  rcases fields1329 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1330 : OriginalRow227TriangleForward1330.entries.size = 32 := rfl

def entry1330 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1330.entries[i.val]'(by rw [size1330]; exact i.isLt)

theorem fields1330 (i : Fin 32) :
    (entry1330 i).IA = shift ∧ (entry1330 i).ID = S (230 + i.val + 1) ∧
      (entry1330 i).IC = S 103 ∧ (entry1330 i).Inext = T 102 (230 + i.val + 1) ∧
      (entry1330 i).Icur = T 102 (230 + i.val) ∧
      (entry1330 i).output = T 103 (230 + i.val) ∧
      (entry1330 i).charge = charge 102 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1336_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1330 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 103) (T 102 (230 + i.val + 1))
      (T 102 (230 + i.val)) (T 103 (230 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1330.entries OriginalRow227TriangleForward1330.checked
    ⟨i.val, by rw [size1330]; exact i.isLt⟩
  change (entry1330 i).check = true at h
  rcases fields1330 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1331 : OriginalRow227TriangleForward1331.entries.size = 32 := rfl

def entry1331 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1331.entries[i.val]'(by rw [size1331]; exact i.isLt)

theorem fields1331 (i : Fin 32) :
    (entry1331 i).IA = shift ∧ (entry1331 i).ID = S (262 + i.val + 1) ∧
      (entry1331 i).IC = S 103 ∧ (entry1331 i).Inext = T 102 (262 + i.val + 1) ∧
      (entry1331 i).Icur = T 102 (262 + i.val) ∧
      (entry1331 i).output = T 103 (262 + i.val) ∧
      (entry1331 i).charge = charge 102 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1337_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1331 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 103) (T 102 (262 + i.val + 1))
      (T 102 (262 + i.val)) (T 103 (262 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1331.entries OriginalRow227TriangleForward1331.checked
    ⟨i.val, by rw [size1331]; exact i.isLt⟩
  change (entry1331 i).check = true at h
  rcases fields1331 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1332 : OriginalRow227TriangleForward1332.entries.size = 32 := rfl

def entry1332 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1332.entries[i.val]'(by rw [size1332]; exact i.isLt)

theorem fields1332 (i : Fin 32) :
    (entry1332 i).IA = shift ∧ (entry1332 i).ID = S (294 + i.val + 1) ∧
      (entry1332 i).IC = S 103 ∧ (entry1332 i).Inext = T 102 (294 + i.val + 1) ∧
      (entry1332 i).Icur = T 102 (294 + i.val) ∧
      (entry1332 i).output = T 103 (294 + i.val) ∧
      (entry1332 i).charge = charge 102 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1338_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1332 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 103) (T 102 (294 + i.val + 1))
      (T 102 (294 + i.val)) (T 103 (294 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1332.entries OriginalRow227TriangleForward1332.checked
    ⟨i.val, by rw [size1332]; exact i.isLt⟩
  change (entry1332 i).check = true at h
  rcases fields1332 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1333 : OriginalRow227TriangleForward1333.entries.size = 32 := rfl

def entry1333 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1333.entries[i.val]'(by rw [size1333]; exact i.isLt)

theorem fields1333 (i : Fin 32) :
    (entry1333 i).IA = shift ∧ (entry1333 i).ID = S (326 + i.val + 1) ∧
      (entry1333 i).IC = S 103 ∧ (entry1333 i).Inext = T 102 (326 + i.val + 1) ∧
      (entry1333 i).Icur = T 102 (326 + i.val) ∧
      (entry1333 i).output = T 103 (326 + i.val) ∧
      (entry1333 i).charge = charge 102 (326 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1339_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1333 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (326 + i.val)) shift
      (S (326 + i.val + 1)) (S 103) (T 102 (326 + i.val + 1))
      (T 102 (326 + i.val)) (T 103 (326 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1333.entries OriginalRow227TriangleForward1333.checked
    ⟨i.val, by rw [size1333]; exact i.isLt⟩
  change (entry1333 i).check = true at h
  rcases fields1333 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1334 : OriginalRow227TriangleForward1334.entries.size = 32 := rfl

def entry1334 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1334.entries[i.val]'(by rw [size1334]; exact i.isLt)

theorem fields1334 (i : Fin 32) :
    (entry1334 i).IA = shift ∧ (entry1334 i).ID = S (358 + i.val + 1) ∧
      (entry1334 i).IC = S 103 ∧ (entry1334 i).Inext = T 102 (358 + i.val + 1) ∧
      (entry1334 i).Icur = T 102 (358 + i.val) ∧
      (entry1334 i).output = T 103 (358 + i.val) ∧
      (entry1334 i).charge = charge 102 (358 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1340_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1334 (i : Fin 32) :
    forwardStepOK (-768) (charge 102 (358 + i.val)) shift
      (S (358 + i.val + 1)) (S 103) (T 102 (358 + i.val + 1))
      (T 102 (358 + i.val)) (T 103 (358 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1334.entries OriginalRow227TriangleForward1334.checked
    ⟨i.val, by rw [size1334]; exact i.isLt⟩
  change (entry1334 i).check = true at h
  rcases fields1334 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1335 : OriginalRow227TriangleForward1335.entries.size = 9 := rfl

def entry1335 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1335.entries[i.val]'(by rw [size1335]; exact i.isLt)

theorem fields1335 (i : Fin 9) :
    (entry1335 i).IA = shift ∧ (entry1335 i).ID = S (390 + i.val + 1) ∧
      (entry1335 i).IC = S 103 ∧ (entry1335 i).Inext = T 102 (390 + i.val + 1) ∧
      (entry1335 i).Icur = T 102 (390 + i.val) ∧
      (entry1335 i).output = T 103 (390 + i.val) ∧
      (entry1335 i).charge = charge 102 (390 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root103).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow102.block1341_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1335 (i : Fin 9) :
    forwardStepOK (-768) (charge 102 (390 + i.val)) shift
      (S (390 + i.val + 1)) (S 103) (T 102 (390 + i.val + 1))
      (T 102 (390 + i.val)) (T 103 (390 + i.val))
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1335.entries OriginalRow227TriangleForward1335.checked
    ⟨i.val, by rw [size1335]; exact i.isLt⟩
  change (entry1335 i).check = true at h
  rcases fields1335 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 102 ≤ d) (hhi : d < 399) :
    forwardStepOK (-768) (charge 102 d) shift (S (d + 1)) (S 103)
      (T 102 (d + 1)) (T 102 d) (T 103 d)
      (OriginalRow227Roots.root_pos 103 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 102 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h166 : d < 166
    ·
      by_cases h134 : d < 134
      ·
        have hi : d - 102 < 32 := by omega
        have heq : 102 + (d - 102) = d := by omega
        simpa only [heq] using step1326 ⟨d - 102, hi⟩
      ·
        have hi : d - 134 < 32 := by omega
        have heq : 134 + (d - 134) = d := by omega
        simpa only [heq] using step1327 ⟨d - 134, hi⟩
    ·
      by_cases h198 : d < 198
      ·
        have hi : d - 166 < 32 := by omega
        have heq : 166 + (d - 166) = d := by omega
        simpa only [heq] using step1328 ⟨d - 166, hi⟩
      ·
        by_cases h230 : d < 230
        ·
          have hi : d - 198 < 32 := by omega
          have heq : 198 + (d - 198) = d := by omega
          simpa only [heq] using step1329 ⟨d - 198, hi⟩
        ·
          have hi : d - 230 < 32 := by omega
          have heq : 230 + (d - 230) = d := by omega
          simpa only [heq] using step1330 ⟨d - 230, hi⟩
  ·
    by_cases h326 : d < 326
    ·
      by_cases h294 : d < 294
      ·
        have hi : d - 262 < 32 := by omega
        have heq : 262 + (d - 262) = d := by omega
        simpa only [heq] using step1331 ⟨d - 262, hi⟩
      ·
        have hi : d - 294 < 32 := by omega
        have heq : 294 + (d - 294) = d := by omega
        simpa only [heq] using step1332 ⟨d - 294, hi⟩
    ·
      by_cases h358 : d < 358
      ·
        have hi : d - 326 < 32 := by omega
        have heq : 326 + (d - 326) = d := by omega
        simpa only [heq] using step1333 ⟨d - 326, hi⟩
      ·
        by_cases h390 : d < 390
        ·
          have hi : d - 358 < 32 := by omega
          have heq : 358 + (d - 358) = d := by omega
          simpa only [heq] using step1334 ⟨d - 358, hi⟩
        ·
          have hi : d - 390 < 9 := by omega
          have heq : 390 + (d - 390) = d := by omega
          simpa only [heq] using step1335 ⟨d - 390, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1326,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1326,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1327,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1327,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1328,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1328,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1329,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1329,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1330,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1330,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1331,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1331,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1332,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1332,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1333,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1333,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1334,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1334,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.fields1335,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.step1335,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow103
