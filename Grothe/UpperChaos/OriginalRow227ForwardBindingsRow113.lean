import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow113
import Grothe.UpperChaos.OriginalRow227TriangleForward1421
import Grothe.UpperChaos.OriginalRow227TriangleForward1422
import Grothe.UpperChaos.OriginalRow227TriangleForward1423
import Grothe.UpperChaos.OriginalRow227TriangleForward1424
import Grothe.UpperChaos.OriginalRow227TriangleForward1425
import Grothe.UpperChaos.OriginalRow227TriangleForward1426
import Grothe.UpperChaos.OriginalRow227TriangleForward1427
import Grothe.UpperChaos.OriginalRow227TriangleForward1428
import Grothe.UpperChaos.OriginalRow227TriangleForward1429

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1421 : OriginalRow227TriangleForward1421.entries.size = 32 := rfl

def entry1421 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1421.entries[i.val]'(by rw [size1421]; exact i.isLt)

theorem fields1421 (i : Fin 32) :
    (entry1421 i).IA = shift ∧ (entry1421 i).ID = S (112 + i.val + 1) ∧
      (entry1421 i).IC = S 113 ∧ (entry1421 i).Inext = T 112 (112 + i.val + 1) ∧
      (entry1421 i).Icur = T 112 (112 + i.val) ∧
      (entry1421 i).output = T 113 (112 + i.val) ∧
      (entry1421 i).charge = charge 112 (112 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1437_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1421 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (112 + i.val)) shift
      (S (112 + i.val + 1)) (S 113) (T 112 (112 + i.val + 1))
      (T 112 (112 + i.val)) (T 113 (112 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1421.entries OriginalRow227TriangleForward1421.checked
    ⟨i.val, by rw [size1421]; exact i.isLt⟩
  change (entry1421 i).check = true at h
  rcases fields1421 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1422 : OriginalRow227TriangleForward1422.entries.size = 32 := rfl

def entry1422 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1422.entries[i.val]'(by rw [size1422]; exact i.isLt)

theorem fields1422 (i : Fin 32) :
    (entry1422 i).IA = shift ∧ (entry1422 i).ID = S (144 + i.val + 1) ∧
      (entry1422 i).IC = S 113 ∧ (entry1422 i).Inext = T 112 (144 + i.val + 1) ∧
      (entry1422 i).Icur = T 112 (144 + i.val) ∧
      (entry1422 i).output = T 113 (144 + i.val) ∧
      (entry1422 i).charge = charge 112 (144 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1438_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1422 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (144 + i.val)) shift
      (S (144 + i.val + 1)) (S 113) (T 112 (144 + i.val + 1))
      (T 112 (144 + i.val)) (T 113 (144 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1422.entries OriginalRow227TriangleForward1422.checked
    ⟨i.val, by rw [size1422]; exact i.isLt⟩
  change (entry1422 i).check = true at h
  rcases fields1422 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1423 : OriginalRow227TriangleForward1423.entries.size = 32 := rfl

def entry1423 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1423.entries[i.val]'(by rw [size1423]; exact i.isLt)

theorem fields1423 (i : Fin 32) :
    (entry1423 i).IA = shift ∧ (entry1423 i).ID = S (176 + i.val + 1) ∧
      (entry1423 i).IC = S 113 ∧ (entry1423 i).Inext = T 112 (176 + i.val + 1) ∧
      (entry1423 i).Icur = T 112 (176 + i.val) ∧
      (entry1423 i).output = T 113 (176 + i.val) ∧
      (entry1423 i).charge = charge 112 (176 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1439_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1423 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (176 + i.val)) shift
      (S (176 + i.val + 1)) (S 113) (T 112 (176 + i.val + 1))
      (T 112 (176 + i.val)) (T 113 (176 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1423.entries OriginalRow227TriangleForward1423.checked
    ⟨i.val, by rw [size1423]; exact i.isLt⟩
  change (entry1423 i).check = true at h
  rcases fields1423 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1424 : OriginalRow227TriangleForward1424.entries.size = 32 := rfl

def entry1424 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1424.entries[i.val]'(by rw [size1424]; exact i.isLt)

theorem fields1424 (i : Fin 32) :
    (entry1424 i).IA = shift ∧ (entry1424 i).ID = S (208 + i.val + 1) ∧
      (entry1424 i).IC = S 113 ∧ (entry1424 i).Inext = T 112 (208 + i.val + 1) ∧
      (entry1424 i).Icur = T 112 (208 + i.val) ∧
      (entry1424 i).output = T 113 (208 + i.val) ∧
      (entry1424 i).charge = charge 112 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1440_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1424 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 113) (T 112 (208 + i.val + 1))
      (T 112 (208 + i.val)) (T 113 (208 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1424.entries OriginalRow227TriangleForward1424.checked
    ⟨i.val, by rw [size1424]; exact i.isLt⟩
  change (entry1424 i).check = true at h
  rcases fields1424 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1425 : OriginalRow227TriangleForward1425.entries.size = 32 := rfl

def entry1425 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1425.entries[i.val]'(by rw [size1425]; exact i.isLt)

theorem fields1425 (i : Fin 32) :
    (entry1425 i).IA = shift ∧ (entry1425 i).ID = S (240 + i.val + 1) ∧
      (entry1425 i).IC = S 113 ∧ (entry1425 i).Inext = T 112 (240 + i.val + 1) ∧
      (entry1425 i).Icur = T 112 (240 + i.val) ∧
      (entry1425 i).output = T 113 (240 + i.val) ∧
      (entry1425 i).charge = charge 112 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1441_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1425 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 113) (T 112 (240 + i.val + 1))
      (T 112 (240 + i.val)) (T 113 (240 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1425.entries OriginalRow227TriangleForward1425.checked
    ⟨i.val, by rw [size1425]; exact i.isLt⟩
  change (entry1425 i).check = true at h
  rcases fields1425 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1426 : OriginalRow227TriangleForward1426.entries.size = 32 := rfl

def entry1426 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1426.entries[i.val]'(by rw [size1426]; exact i.isLt)

theorem fields1426 (i : Fin 32) :
    (entry1426 i).IA = shift ∧ (entry1426 i).ID = S (272 + i.val + 1) ∧
      (entry1426 i).IC = S 113 ∧ (entry1426 i).Inext = T 112 (272 + i.val + 1) ∧
      (entry1426 i).Icur = T 112 (272 + i.val) ∧
      (entry1426 i).output = T 113 (272 + i.val) ∧
      (entry1426 i).charge = charge 112 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1442_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1426 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 113) (T 112 (272 + i.val + 1))
      (T 112 (272 + i.val)) (T 113 (272 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1426.entries OriginalRow227TriangleForward1426.checked
    ⟨i.val, by rw [size1426]; exact i.isLt⟩
  change (entry1426 i).check = true at h
  rcases fields1426 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1427 : OriginalRow227TriangleForward1427.entries.size = 32 := rfl

def entry1427 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1427.entries[i.val]'(by rw [size1427]; exact i.isLt)

theorem fields1427 (i : Fin 32) :
    (entry1427 i).IA = shift ∧ (entry1427 i).ID = S (304 + i.val + 1) ∧
      (entry1427 i).IC = S 113 ∧ (entry1427 i).Inext = T 112 (304 + i.val + 1) ∧
      (entry1427 i).Icur = T 112 (304 + i.val) ∧
      (entry1427 i).output = T 113 (304 + i.val) ∧
      (entry1427 i).charge = charge 112 (304 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1443_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1427 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (304 + i.val)) shift
      (S (304 + i.val + 1)) (S 113) (T 112 (304 + i.val + 1))
      (T 112 (304 + i.val)) (T 113 (304 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1427.entries OriginalRow227TriangleForward1427.checked
    ⟨i.val, by rw [size1427]; exact i.isLt⟩
  change (entry1427 i).check = true at h
  rcases fields1427 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1428 : OriginalRow227TriangleForward1428.entries.size = 32 := rfl

def entry1428 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1428.entries[i.val]'(by rw [size1428]; exact i.isLt)

theorem fields1428 (i : Fin 32) :
    (entry1428 i).IA = shift ∧ (entry1428 i).ID = S (336 + i.val + 1) ∧
      (entry1428 i).IC = S 113 ∧ (entry1428 i).Inext = T 112 (336 + i.val + 1) ∧
      (entry1428 i).Icur = T 112 (336 + i.val) ∧
      (entry1428 i).output = T 113 (336 + i.val) ∧
      (entry1428 i).charge = charge 112 (336 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1444_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1428 (i : Fin 32) :
    forwardStepOK (-768) (charge 112 (336 + i.val)) shift
      (S (336 + i.val + 1)) (S 113) (T 112 (336 + i.val + 1))
      (T 112 (336 + i.val)) (T 113 (336 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1428.entries OriginalRow227TriangleForward1428.checked
    ⟨i.val, by rw [size1428]; exact i.isLt⟩
  change (entry1428 i).check = true at h
  rcases fields1428 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1429 : OriginalRow227TriangleForward1429.entries.size = 21 := rfl

def entry1429 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1429.entries[i.val]'(by rw [size1429]; exact i.isLt)

theorem fields1429 (i : Fin 21) :
    (entry1429 i).IA = shift ∧ (entry1429 i).ID = S (368 + i.val + 1) ∧
      (entry1429 i).IC = S 113 ∧ (entry1429 i).Inext = T 112 (368 + i.val + 1) ∧
      (entry1429 i).Icur = T 112 (368 + i.val) ∧
      (entry1429 i).output = T 113 (368 + i.val) ∧
      (entry1429 i).charge = charge 112 (368 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root113).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow113.block1445_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1429 (i : Fin 21) :
    forwardStepOK (-768) (charge 112 (368 + i.val)) shift
      (S (368 + i.val + 1)) (S 113) (T 112 (368 + i.val + 1))
      (T 112 (368 + i.val)) (T 113 (368 + i.val))
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1429.entries OriginalRow227TriangleForward1429.checked
    ⟨i.val, by rw [size1429]; exact i.isLt⟩
  change (entry1429 i).check = true at h
  rcases fields1429 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 112 ≤ d) (hhi : d < 389) :
    forwardStepOK (-768) (charge 112 d) shift (S (d + 1)) (S 113)
      (T 112 (d + 1)) (T 112 d) (T 113 d)
      (OriginalRow227Roots.root_pos 113 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 112 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    by_cases h176 : d < 176
    ·
      by_cases h144 : d < 144
      ·
        have hi : d - 112 < 32 := by omega
        have heq : 112 + (d - 112) = d := by omega
        simpa only [heq] using step1421 ⟨d - 112, hi⟩
      ·
        have hi : d - 144 < 32 := by omega
        have heq : 144 + (d - 144) = d := by omega
        simpa only [heq] using step1422 ⟨d - 144, hi⟩
    ·
      by_cases h208 : d < 208
      ·
        have hi : d - 176 < 32 := by omega
        have heq : 176 + (d - 176) = d := by omega
        simpa only [heq] using step1423 ⟨d - 176, hi⟩
      ·
        have hi : d - 208 < 32 := by omega
        have heq : 208 + (d - 208) = d := by omega
        simpa only [heq] using step1424 ⟨d - 208, hi⟩
  ·
    by_cases h304 : d < 304
    ·
      by_cases h272 : d < 272
      ·
        have hi : d - 240 < 32 := by omega
        have heq : 240 + (d - 240) = d := by omega
        simpa only [heq] using step1425 ⟨d - 240, hi⟩
      ·
        have hi : d - 272 < 32 := by omega
        have heq : 272 + (d - 272) = d := by omega
        simpa only [heq] using step1426 ⟨d - 272, hi⟩
    ·
      by_cases h336 : d < 336
      ·
        have hi : d - 304 < 32 := by omega
        have heq : 304 + (d - 304) = d := by omega
        simpa only [heq] using step1427 ⟨d - 304, hi⟩
      ·
        by_cases h368 : d < 368
        ·
          have hi : d - 336 < 32 := by omega
          have heq : 336 + (d - 336) = d := by omega
          simpa only [heq] using step1428 ⟨d - 336, hi⟩
        ·
          have hi : d - 368 < 21 := by omega
          have heq : 368 + (d - 368) = d := by omega
          simpa only [heq] using step1429 ⟨d - 368, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1421,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1421,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1422,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1422,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1423,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1423,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1424,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1424,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1425,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1425,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1426,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1426,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1427,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1427,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1428,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1428,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.fields1429,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.step1429,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow113
