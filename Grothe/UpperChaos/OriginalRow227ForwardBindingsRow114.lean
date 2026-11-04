import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114
import Grothe.UpperChaos.OriginalRow227TriangleForward1430
import Grothe.UpperChaos.OriginalRow227TriangleForward1431
import Grothe.UpperChaos.OriginalRow227TriangleForward1432
import Grothe.UpperChaos.OriginalRow227TriangleForward1433
import Grothe.UpperChaos.OriginalRow227TriangleForward1434
import Grothe.UpperChaos.OriginalRow227TriangleForward1435
import Grothe.UpperChaos.OriginalRow227TriangleForward1436
import Grothe.UpperChaos.OriginalRow227TriangleForward1437
import Grothe.UpperChaos.OriginalRow227TriangleForward1438

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1430 : OriginalRow227TriangleForward1430.entries.size = 32 := rfl

def entry1430 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1430.entries[i.val]'(by rw [size1430]; exact i.isLt)

theorem fields1430 (i : Fin 32) :
    (entry1430 i).IA = shift ∧ (entry1430 i).ID = S (113 + i.val + 1) ∧
      (entry1430 i).IC = S 114 ∧ (entry1430 i).Inext = T 113 (113 + i.val + 1) ∧
      (entry1430 i).Icur = T 113 (113 + i.val) ∧
      (entry1430 i).output = T 114 (113 + i.val) ∧
      (entry1430 i).charge = charge 113 (113 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1430 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (113 + i.val)) shift
      (S (113 + i.val + 1)) (S 114) (T 113 (113 + i.val + 1))
      (T 113 (113 + i.val)) (T 114 (113 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1430.entries OriginalRow227TriangleForward1430.checked
    ⟨i.val, by rw [size1430]; exact i.isLt⟩
  change (entry1430 i).check = true at h
  rcases fields1430 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1431 : OriginalRow227TriangleForward1431.entries.size = 32 := rfl

def entry1431 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1431.entries[i.val]'(by rw [size1431]; exact i.isLt)

theorem fields1431 (i : Fin 32) :
    (entry1431 i).IA = shift ∧ (entry1431 i).ID = S (145 + i.val + 1) ∧
      (entry1431 i).IC = S 114 ∧ (entry1431 i).Inext = T 113 (145 + i.val + 1) ∧
      (entry1431 i).Icur = T 113 (145 + i.val) ∧
      (entry1431 i).output = T 114 (145 + i.val) ∧
      (entry1431 i).charge = charge 113 (145 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1431 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (145 + i.val)) shift
      (S (145 + i.val + 1)) (S 114) (T 113 (145 + i.val + 1))
      (T 113 (145 + i.val)) (T 114 (145 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1431.entries OriginalRow227TriangleForward1431.checked
    ⟨i.val, by rw [size1431]; exact i.isLt⟩
  change (entry1431 i).check = true at h
  rcases fields1431 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1432 : OriginalRow227TriangleForward1432.entries.size = 32 := rfl

def entry1432 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1432.entries[i.val]'(by rw [size1432]; exact i.isLt)

theorem fields1432 (i : Fin 32) :
    (entry1432 i).IA = shift ∧ (entry1432 i).ID = S (177 + i.val + 1) ∧
      (entry1432 i).IC = S 114 ∧ (entry1432 i).Inext = T 113 (177 + i.val + 1) ∧
      (entry1432 i).Icur = T 113 (177 + i.val) ∧
      (entry1432 i).output = T 114 (177 + i.val) ∧
      (entry1432 i).charge = charge 113 (177 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1432 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (177 + i.val)) shift
      (S (177 + i.val + 1)) (S 114) (T 113 (177 + i.val + 1))
      (T 113 (177 + i.val)) (T 114 (177 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1432.entries OriginalRow227TriangleForward1432.checked
    ⟨i.val, by rw [size1432]; exact i.isLt⟩
  change (entry1432 i).check = true at h
  rcases fields1432 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1433 : OriginalRow227TriangleForward1433.entries.size = 32 := rfl

def entry1433 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1433.entries[i.val]'(by rw [size1433]; exact i.isLt)

theorem fields1433 (i : Fin 32) :
    (entry1433 i).IA = shift ∧ (entry1433 i).ID = S (209 + i.val + 1) ∧
      (entry1433 i).IC = S 114 ∧ (entry1433 i).Inext = T 113 (209 + i.val + 1) ∧
      (entry1433 i).Icur = T 113 (209 + i.val) ∧
      (entry1433 i).output = T 114 (209 + i.val) ∧
      (entry1433 i).charge = charge 113 (209 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1433 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (209 + i.val)) shift
      (S (209 + i.val + 1)) (S 114) (T 113 (209 + i.val + 1))
      (T 113 (209 + i.val)) (T 114 (209 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1433.entries OriginalRow227TriangleForward1433.checked
    ⟨i.val, by rw [size1433]; exact i.isLt⟩
  change (entry1433 i).check = true at h
  rcases fields1433 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1434 : OriginalRow227TriangleForward1434.entries.size = 32 := rfl

def entry1434 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1434.entries[i.val]'(by rw [size1434]; exact i.isLt)

theorem fields1434 (i : Fin 32) :
    (entry1434 i).IA = shift ∧ (entry1434 i).ID = S (241 + i.val + 1) ∧
      (entry1434 i).IC = S 114 ∧ (entry1434 i).Inext = T 113 (241 + i.val + 1) ∧
      (entry1434 i).Icur = T 113 (241 + i.val) ∧
      (entry1434 i).output = T 114 (241 + i.val) ∧
      (entry1434 i).charge = charge 113 (241 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1434 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (241 + i.val)) shift
      (S (241 + i.val + 1)) (S 114) (T 113 (241 + i.val + 1))
      (T 113 (241 + i.val)) (T 114 (241 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1434.entries OriginalRow227TriangleForward1434.checked
    ⟨i.val, by rw [size1434]; exact i.isLt⟩
  change (entry1434 i).check = true at h
  rcases fields1434 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1435 : OriginalRow227TriangleForward1435.entries.size = 32 := rfl

def entry1435 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1435.entries[i.val]'(by rw [size1435]; exact i.isLt)

theorem fields1435 (i : Fin 32) :
    (entry1435 i).IA = shift ∧ (entry1435 i).ID = S (273 + i.val + 1) ∧
      (entry1435 i).IC = S 114 ∧ (entry1435 i).Inext = T 113 (273 + i.val + 1) ∧
      (entry1435 i).Icur = T 113 (273 + i.val) ∧
      (entry1435 i).output = T 114 (273 + i.val) ∧
      (entry1435 i).charge = charge 113 (273 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1435 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (273 + i.val)) shift
      (S (273 + i.val + 1)) (S 114) (T 113 (273 + i.val + 1))
      (T 113 (273 + i.val)) (T 114 (273 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1435.entries OriginalRow227TriangleForward1435.checked
    ⟨i.val, by rw [size1435]; exact i.isLt⟩
  change (entry1435 i).check = true at h
  rcases fields1435 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1436 : OriginalRow227TriangleForward1436.entries.size = 32 := rfl

def entry1436 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1436.entries[i.val]'(by rw [size1436]; exact i.isLt)

theorem fields1436 (i : Fin 32) :
    (entry1436 i).IA = shift ∧ (entry1436 i).ID = S (305 + i.val + 1) ∧
      (entry1436 i).IC = S 114 ∧ (entry1436 i).Inext = T 113 (305 + i.val + 1) ∧
      (entry1436 i).Icur = T 113 (305 + i.val) ∧
      (entry1436 i).output = T 114 (305 + i.val) ∧
      (entry1436 i).charge = charge 113 (305 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1436 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (305 + i.val)) shift
      (S (305 + i.val + 1)) (S 114) (T 113 (305 + i.val + 1))
      (T 113 (305 + i.val)) (T 114 (305 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1436.entries OriginalRow227TriangleForward1436.checked
    ⟨i.val, by rw [size1436]; exact i.isLt⟩
  change (entry1436 i).check = true at h
  rcases fields1436 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1437 : OriginalRow227TriangleForward1437.entries.size = 32 := rfl

def entry1437 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1437.entries[i.val]'(by rw [size1437]; exact i.isLt)

theorem fields1437 (i : Fin 32) :
    (entry1437 i).IA = shift ∧ (entry1437 i).ID = S (337 + i.val + 1) ∧
      (entry1437 i).IC = S 114 ∧ (entry1437 i).Inext = T 113 (337 + i.val + 1) ∧
      (entry1437 i).Icur = T 113 (337 + i.val) ∧
      (entry1437 i).output = T 114 (337 + i.val) ∧
      (entry1437 i).charge = charge 113 (337 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1437 (i : Fin 32) :
    forwardStepOK (-768) (charge 113 (337 + i.val)) shift
      (S (337 + i.val + 1)) (S 114) (T 113 (337 + i.val + 1))
      (T 113 (337 + i.val)) (T 114 (337 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1437.entries OriginalRow227TriangleForward1437.checked
    ⟨i.val, by rw [size1437]; exact i.isLt⟩
  change (entry1437 i).check = true at h
  rcases fields1437 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1438 : OriginalRow227TriangleForward1438.entries.size = 19 := rfl

def entry1438 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1438.entries[i.val]'(by rw [size1438]; exact i.isLt)

theorem fields1438 (i : Fin 19) :
    (entry1438 i).IA = shift ∧ (entry1438 i).ID = S (369 + i.val + 1) ∧
      (entry1438 i).IC = S 114 ∧ (entry1438 i).Inext = T 113 (369 + i.val + 1) ∧
      (entry1438 i).Icur = T 113 (369 + i.val) ∧
      (entry1438 i).output = T 114 (369 + i.val) ∧
      (entry1438 i).charge = charge 113 (369 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root114).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1438 (i : Fin 19) :
    forwardStepOK (-768) (charge 113 (369 + i.val)) shift
      (S (369 + i.val + 1)) (S 114) (T 113 (369 + i.val + 1))
      (T 113 (369 + i.val)) (T 114 (369 + i.val))
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1438.entries OriginalRow227TriangleForward1438.checked
    ⟨i.val, by rw [size1438]; exact i.isLt⟩
  change (entry1438 i).check = true at h
  rcases fields1438 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 113 ≤ d) (hhi : d < 388) :
    forwardStepOK (-768) (charge 113 d) shift (S (d + 1)) (S 114)
      (T 113 (d + 1)) (T 113 d) (T 114 d)
      (OriginalRow227Roots.root_pos 114 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 113 (by decide)) = true := by
  by_cases h241 : d < 241
  ·
    by_cases h177 : d < 177
    ·
      by_cases h145 : d < 145
      ·
        have hi : d - 113 < 32 := by omega
        have heq : 113 + (d - 113) = d := by omega
        simpa only [heq] using step1430 ⟨d - 113, hi⟩
      ·
        have hi : d - 145 < 32 := by omega
        have heq : 145 + (d - 145) = d := by omega
        simpa only [heq] using step1431 ⟨d - 145, hi⟩
    ·
      by_cases h209 : d < 209
      ·
        have hi : d - 177 < 32 := by omega
        have heq : 177 + (d - 177) = d := by omega
        simpa only [heq] using step1432 ⟨d - 177, hi⟩
      ·
        have hi : d - 209 < 32 := by omega
        have heq : 209 + (d - 209) = d := by omega
        simpa only [heq] using step1433 ⟨d - 209, hi⟩
  ·
    by_cases h305 : d < 305
    ·
      by_cases h273 : d < 273
      ·
        have hi : d - 241 < 32 := by omega
        have heq : 241 + (d - 241) = d := by omega
        simpa only [heq] using step1434 ⟨d - 241, hi⟩
      ·
        have hi : d - 273 < 32 := by omega
        have heq : 273 + (d - 273) = d := by omega
        simpa only [heq] using step1435 ⟨d - 273, hi⟩
    ·
      by_cases h337 : d < 337
      ·
        have hi : d - 305 < 32 := by omega
        have heq : 305 + (d - 305) = d := by omega
        simpa only [heq] using step1436 ⟨d - 305, hi⟩
      ·
        by_cases h369 : d < 369
        ·
          have hi : d - 337 < 32 := by omega
          have heq : 337 + (d - 337) = d := by omega
          simpa only [heq] using step1437 ⟨d - 337, hi⟩
        ·
          have hi : d - 369 < 19 := by omega
          have heq : 369 + (d - 369) = d := by omega
          simpa only [heq] using step1438 ⟨d - 369, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1430,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1430,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1431,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1431,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1432,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1432,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1433,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1433,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1434,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1434,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1435,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1435,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1436,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1436,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1437,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1437,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.fields1438,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.step1438,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow114
