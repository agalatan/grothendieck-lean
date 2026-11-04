import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108
import Grothe.UpperChaos.OriginalRow227TriangleForward1376
import Grothe.UpperChaos.OriginalRow227TriangleForward1377
import Grothe.UpperChaos.OriginalRow227TriangleForward1378
import Grothe.UpperChaos.OriginalRow227TriangleForward1379
import Grothe.UpperChaos.OriginalRow227TriangleForward1380
import Grothe.UpperChaos.OriginalRow227TriangleForward1381
import Grothe.UpperChaos.OriginalRow227TriangleForward1382
import Grothe.UpperChaos.OriginalRow227TriangleForward1383
import Grothe.UpperChaos.OriginalRow227TriangleForward1384

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1376 : OriginalRow227TriangleForward1376.entries.size = 32 := rfl

def entry1376 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1376.entries[i.val]'(by rw [size1376]; exact i.isLt)

theorem fields1376 (i : Fin 32) :
    (entry1376 i).IA = shift ∧ (entry1376 i).ID = S (107 + i.val + 1) ∧
      (entry1376 i).IC = S 108 ∧ (entry1376 i).Inext = T 107 (107 + i.val + 1) ∧
      (entry1376 i).Icur = T 107 (107 + i.val) ∧
      (entry1376 i).output = T 108 (107 + i.val) ∧
      (entry1376 i).charge = charge 107 (107 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1376 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (107 + i.val)) shift
      (S (107 + i.val + 1)) (S 108) (T 107 (107 + i.val + 1))
      (T 107 (107 + i.val)) (T 108 (107 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1376.entries OriginalRow227TriangleForward1376.checked
    ⟨i.val, by rw [size1376]; exact i.isLt⟩
  change (entry1376 i).check = true at h
  rcases fields1376 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1377 : OriginalRow227TriangleForward1377.entries.size = 32 := rfl

def entry1377 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1377.entries[i.val]'(by rw [size1377]; exact i.isLt)

theorem fields1377 (i : Fin 32) :
    (entry1377 i).IA = shift ∧ (entry1377 i).ID = S (139 + i.val + 1) ∧
      (entry1377 i).IC = S 108 ∧ (entry1377 i).Inext = T 107 (139 + i.val + 1) ∧
      (entry1377 i).Icur = T 107 (139 + i.val) ∧
      (entry1377 i).output = T 108 (139 + i.val) ∧
      (entry1377 i).charge = charge 107 (139 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1377 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (139 + i.val)) shift
      (S (139 + i.val + 1)) (S 108) (T 107 (139 + i.val + 1))
      (T 107 (139 + i.val)) (T 108 (139 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1377.entries OriginalRow227TriangleForward1377.checked
    ⟨i.val, by rw [size1377]; exact i.isLt⟩
  change (entry1377 i).check = true at h
  rcases fields1377 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1378 : OriginalRow227TriangleForward1378.entries.size = 32 := rfl

def entry1378 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1378.entries[i.val]'(by rw [size1378]; exact i.isLt)

theorem fields1378 (i : Fin 32) :
    (entry1378 i).IA = shift ∧ (entry1378 i).ID = S (171 + i.val + 1) ∧
      (entry1378 i).IC = S 108 ∧ (entry1378 i).Inext = T 107 (171 + i.val + 1) ∧
      (entry1378 i).Icur = T 107 (171 + i.val) ∧
      (entry1378 i).output = T 108 (171 + i.val) ∧
      (entry1378 i).charge = charge 107 (171 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1378 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (171 + i.val)) shift
      (S (171 + i.val + 1)) (S 108) (T 107 (171 + i.val + 1))
      (T 107 (171 + i.val)) (T 108 (171 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1378.entries OriginalRow227TriangleForward1378.checked
    ⟨i.val, by rw [size1378]; exact i.isLt⟩
  change (entry1378 i).check = true at h
  rcases fields1378 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1379 : OriginalRow227TriangleForward1379.entries.size = 32 := rfl

def entry1379 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1379.entries[i.val]'(by rw [size1379]; exact i.isLt)

theorem fields1379 (i : Fin 32) :
    (entry1379 i).IA = shift ∧ (entry1379 i).ID = S (203 + i.val + 1) ∧
      (entry1379 i).IC = S 108 ∧ (entry1379 i).Inext = T 107 (203 + i.val + 1) ∧
      (entry1379 i).Icur = T 107 (203 + i.val) ∧
      (entry1379 i).output = T 108 (203 + i.val) ∧
      (entry1379 i).charge = charge 107 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1379 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 108) (T 107 (203 + i.val + 1))
      (T 107 (203 + i.val)) (T 108 (203 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1379.entries OriginalRow227TriangleForward1379.checked
    ⟨i.val, by rw [size1379]; exact i.isLt⟩
  change (entry1379 i).check = true at h
  rcases fields1379 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1380 : OriginalRow227TriangleForward1380.entries.size = 32 := rfl

def entry1380 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1380.entries[i.val]'(by rw [size1380]; exact i.isLt)

theorem fields1380 (i : Fin 32) :
    (entry1380 i).IA = shift ∧ (entry1380 i).ID = S (235 + i.val + 1) ∧
      (entry1380 i).IC = S 108 ∧ (entry1380 i).Inext = T 107 (235 + i.val + 1) ∧
      (entry1380 i).Icur = T 107 (235 + i.val) ∧
      (entry1380 i).output = T 108 (235 + i.val) ∧
      (entry1380 i).charge = charge 107 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1380 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 108) (T 107 (235 + i.val + 1))
      (T 107 (235 + i.val)) (T 108 (235 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1380.entries OriginalRow227TriangleForward1380.checked
    ⟨i.val, by rw [size1380]; exact i.isLt⟩
  change (entry1380 i).check = true at h
  rcases fields1380 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1381 : OriginalRow227TriangleForward1381.entries.size = 32 := rfl

def entry1381 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1381.entries[i.val]'(by rw [size1381]; exact i.isLt)

theorem fields1381 (i : Fin 32) :
    (entry1381 i).IA = shift ∧ (entry1381 i).ID = S (267 + i.val + 1) ∧
      (entry1381 i).IC = S 108 ∧ (entry1381 i).Inext = T 107 (267 + i.val + 1) ∧
      (entry1381 i).Icur = T 107 (267 + i.val) ∧
      (entry1381 i).output = T 108 (267 + i.val) ∧
      (entry1381 i).charge = charge 107 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1381 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 108) (T 107 (267 + i.val + 1))
      (T 107 (267 + i.val)) (T 108 (267 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1381.entries OriginalRow227TriangleForward1381.checked
    ⟨i.val, by rw [size1381]; exact i.isLt⟩
  change (entry1381 i).check = true at h
  rcases fields1381 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1382 : OriginalRow227TriangleForward1382.entries.size = 32 := rfl

def entry1382 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1382.entries[i.val]'(by rw [size1382]; exact i.isLt)

theorem fields1382 (i : Fin 32) :
    (entry1382 i).IA = shift ∧ (entry1382 i).ID = S (299 + i.val + 1) ∧
      (entry1382 i).IC = S 108 ∧ (entry1382 i).Inext = T 107 (299 + i.val + 1) ∧
      (entry1382 i).Icur = T 107 (299 + i.val) ∧
      (entry1382 i).output = T 108 (299 + i.val) ∧
      (entry1382 i).charge = charge 107 (299 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1382 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (299 + i.val)) shift
      (S (299 + i.val + 1)) (S 108) (T 107 (299 + i.val + 1))
      (T 107 (299 + i.val)) (T 108 (299 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1382.entries OriginalRow227TriangleForward1382.checked
    ⟨i.val, by rw [size1382]; exact i.isLt⟩
  change (entry1382 i).check = true at h
  rcases fields1382 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1383 : OriginalRow227TriangleForward1383.entries.size = 32 := rfl

def entry1383 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1383.entries[i.val]'(by rw [size1383]; exact i.isLt)

theorem fields1383 (i : Fin 32) :
    (entry1383 i).IA = shift ∧ (entry1383 i).ID = S (331 + i.val + 1) ∧
      (entry1383 i).IC = S 108 ∧ (entry1383 i).Inext = T 107 (331 + i.val + 1) ∧
      (entry1383 i).Icur = T 107 (331 + i.val) ∧
      (entry1383 i).output = T 108 (331 + i.val) ∧
      (entry1383 i).charge = charge 107 (331 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1383 (i : Fin 32) :
    forwardStepOK (-768) (charge 107 (331 + i.val)) shift
      (S (331 + i.val + 1)) (S 108) (T 107 (331 + i.val + 1))
      (T 107 (331 + i.val)) (T 108 (331 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1383.entries OriginalRow227TriangleForward1383.checked
    ⟨i.val, by rw [size1383]; exact i.isLt⟩
  change (entry1383 i).check = true at h
  rcases fields1383 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1384 : OriginalRow227TriangleForward1384.entries.size = 31 := rfl

def entry1384 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1384.entries[i.val]'(by rw [size1384]; exact i.isLt)

theorem fields1384 (i : Fin 31) :
    (entry1384 i).IA = shift ∧ (entry1384 i).ID = S (363 + i.val + 1) ∧
      (entry1384 i).IC = S 108 ∧ (entry1384 i).Inext = T 107 (363 + i.val + 1) ∧
      (entry1384 i).Icur = T 107 (363 + i.val) ∧
      (entry1384 i).output = T 108 (363 + i.val) ∧
      (entry1384 i).charge = charge 107 (363 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root108).symm,
      (OriginalRow227TriangleBindingsRow107.block1391_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1384 (i : Fin 31) :
    forwardStepOK (-768) (charge 107 (363 + i.val)) shift
      (S (363 + i.val + 1)) (S 108) (T 107 (363 + i.val + 1))
      (T 107 (363 + i.val)) (T 108 (363 + i.val))
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1384.entries OriginalRow227TriangleForward1384.checked
    ⟨i.val, by rw [size1384]; exact i.isLt⟩
  change (entry1384 i).check = true at h
  rcases fields1384 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 107 ≤ d) (hhi : d < 394) :
    forwardStepOK (-768) (charge 107 d) shift (S (d + 1)) (S 108)
      (T 107 (d + 1)) (T 107 d) (T 108 d)
      (OriginalRow227Roots.root_pos 108 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 107 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    by_cases h171 : d < 171
    ·
      by_cases h139 : d < 139
      ·
        have hi : d - 107 < 32 := by omega
        have heq : 107 + (d - 107) = d := by omega
        simpa only [heq] using step1376 ⟨d - 107, hi⟩
      ·
        have hi : d - 139 < 32 := by omega
        have heq : 139 + (d - 139) = d := by omega
        simpa only [heq] using step1377 ⟨d - 139, hi⟩
    ·
      by_cases h203 : d < 203
      ·
        have hi : d - 171 < 32 := by omega
        have heq : 171 + (d - 171) = d := by omega
        simpa only [heq] using step1378 ⟨d - 171, hi⟩
      ·
        have hi : d - 203 < 32 := by omega
        have heq : 203 + (d - 203) = d := by omega
        simpa only [heq] using step1379 ⟨d - 203, hi⟩
  ·
    by_cases h299 : d < 299
    ·
      by_cases h267 : d < 267
      ·
        have hi : d - 235 < 32 := by omega
        have heq : 235 + (d - 235) = d := by omega
        simpa only [heq] using step1380 ⟨d - 235, hi⟩
      ·
        have hi : d - 267 < 32 := by omega
        have heq : 267 + (d - 267) = d := by omega
        simpa only [heq] using step1381 ⟨d - 267, hi⟩
    ·
      by_cases h331 : d < 331
      ·
        have hi : d - 299 < 32 := by omega
        have heq : 299 + (d - 299) = d := by omega
        simpa only [heq] using step1382 ⟨d - 299, hi⟩
      ·
        by_cases h363 : d < 363
        ·
          have hi : d - 331 < 32 := by omega
          have heq : 331 + (d - 331) = d := by omega
          simpa only [heq] using step1383 ⟨d - 331, hi⟩
        ·
          have hi : d - 363 < 31 := by omega
          have heq : 363 + (d - 363) = d := by omega
          simpa only [heq] using step1384 ⟨d - 363, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1376,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1376,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1377,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1377,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1378,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1378,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1379,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1379,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1380,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1380,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1381,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1381,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1382,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1382,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1383,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1383,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.fields1384,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.step1384,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow108
