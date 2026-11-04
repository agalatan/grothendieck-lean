import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117
import Grothe.UpperChaos.OriginalRow227TriangleForward1457
import Grothe.UpperChaos.OriginalRow227TriangleForward1458
import Grothe.UpperChaos.OriginalRow227TriangleForward1459
import Grothe.UpperChaos.OriginalRow227TriangleForward1460
import Grothe.UpperChaos.OriginalRow227TriangleForward1461
import Grothe.UpperChaos.OriginalRow227TriangleForward1462
import Grothe.UpperChaos.OriginalRow227TriangleForward1463
import Grothe.UpperChaos.OriginalRow227TriangleForward1464
import Grothe.UpperChaos.OriginalRow227TriangleForward1465

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1457 : OriginalRow227TriangleForward1457.entries.size = 32 := rfl

def entry1457 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1457.entries[i.val]'(by rw [size1457]; exact i.isLt)

theorem fields1457 (i : Fin 32) :
    (entry1457 i).IA = shift ∧ (entry1457 i).ID = S (116 + i.val + 1) ∧
      (entry1457 i).IC = S 117 ∧ (entry1457 i).Inext = T 116 (116 + i.val + 1) ∧
      (entry1457 i).Icur = T 116 (116 + i.val) ∧
      (entry1457 i).output = T 117 (116 + i.val) ∧
      (entry1457 i).charge = charge 116 (116 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1457 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (116 + i.val)) shift
      (S (116 + i.val + 1)) (S 117) (T 116 (116 + i.val + 1))
      (T 116 (116 + i.val)) (T 117 (116 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1457.entries OriginalRow227TriangleForward1457.checked
    ⟨i.val, by rw [size1457]; exact i.isLt⟩
  change (entry1457 i).check = true at h
  rcases fields1457 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1458 : OriginalRow227TriangleForward1458.entries.size = 32 := rfl

def entry1458 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1458.entries[i.val]'(by rw [size1458]; exact i.isLt)

theorem fields1458 (i : Fin 32) :
    (entry1458 i).IA = shift ∧ (entry1458 i).ID = S (148 + i.val + 1) ∧
      (entry1458 i).IC = S 117 ∧ (entry1458 i).Inext = T 116 (148 + i.val + 1) ∧
      (entry1458 i).Icur = T 116 (148 + i.val) ∧
      (entry1458 i).output = T 117 (148 + i.val) ∧
      (entry1458 i).charge = charge 116 (148 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1458 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (148 + i.val)) shift
      (S (148 + i.val + 1)) (S 117) (T 116 (148 + i.val + 1))
      (T 116 (148 + i.val)) (T 117 (148 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1458.entries OriginalRow227TriangleForward1458.checked
    ⟨i.val, by rw [size1458]; exact i.isLt⟩
  change (entry1458 i).check = true at h
  rcases fields1458 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1459 : OriginalRow227TriangleForward1459.entries.size = 32 := rfl

def entry1459 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1459.entries[i.val]'(by rw [size1459]; exact i.isLt)

theorem fields1459 (i : Fin 32) :
    (entry1459 i).IA = shift ∧ (entry1459 i).ID = S (180 + i.val + 1) ∧
      (entry1459 i).IC = S 117 ∧ (entry1459 i).Inext = T 116 (180 + i.val + 1) ∧
      (entry1459 i).Icur = T 116 (180 + i.val) ∧
      (entry1459 i).output = T 117 (180 + i.val) ∧
      (entry1459 i).charge = charge 116 (180 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1459 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (180 + i.val)) shift
      (S (180 + i.val + 1)) (S 117) (T 116 (180 + i.val + 1))
      (T 116 (180 + i.val)) (T 117 (180 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1459.entries OriginalRow227TriangleForward1459.checked
    ⟨i.val, by rw [size1459]; exact i.isLt⟩
  change (entry1459 i).check = true at h
  rcases fields1459 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1460 : OriginalRow227TriangleForward1460.entries.size = 32 := rfl

def entry1460 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1460.entries[i.val]'(by rw [size1460]; exact i.isLt)

theorem fields1460 (i : Fin 32) :
    (entry1460 i).IA = shift ∧ (entry1460 i).ID = S (212 + i.val + 1) ∧
      (entry1460 i).IC = S 117 ∧ (entry1460 i).Inext = T 116 (212 + i.val + 1) ∧
      (entry1460 i).Icur = T 116 (212 + i.val) ∧
      (entry1460 i).output = T 117 (212 + i.val) ∧
      (entry1460 i).charge = charge 116 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1460 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 117) (T 116 (212 + i.val + 1))
      (T 116 (212 + i.val)) (T 117 (212 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1460.entries OriginalRow227TriangleForward1460.checked
    ⟨i.val, by rw [size1460]; exact i.isLt⟩
  change (entry1460 i).check = true at h
  rcases fields1460 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1461 : OriginalRow227TriangleForward1461.entries.size = 32 := rfl

def entry1461 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1461.entries[i.val]'(by rw [size1461]; exact i.isLt)

theorem fields1461 (i : Fin 32) :
    (entry1461 i).IA = shift ∧ (entry1461 i).ID = S (244 + i.val + 1) ∧
      (entry1461 i).IC = S 117 ∧ (entry1461 i).Inext = T 116 (244 + i.val + 1) ∧
      (entry1461 i).Icur = T 116 (244 + i.val) ∧
      (entry1461 i).output = T 117 (244 + i.val) ∧
      (entry1461 i).charge = charge 116 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1461 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 117) (T 116 (244 + i.val + 1))
      (T 116 (244 + i.val)) (T 117 (244 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1461.entries OriginalRow227TriangleForward1461.checked
    ⟨i.val, by rw [size1461]; exact i.isLt⟩
  change (entry1461 i).check = true at h
  rcases fields1461 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1462 : OriginalRow227TriangleForward1462.entries.size = 32 := rfl

def entry1462 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1462.entries[i.val]'(by rw [size1462]; exact i.isLt)

theorem fields1462 (i : Fin 32) :
    (entry1462 i).IA = shift ∧ (entry1462 i).ID = S (276 + i.val + 1) ∧
      (entry1462 i).IC = S 117 ∧ (entry1462 i).Inext = T 116 (276 + i.val + 1) ∧
      (entry1462 i).Icur = T 116 (276 + i.val) ∧
      (entry1462 i).output = T 117 (276 + i.val) ∧
      (entry1462 i).charge = charge 116 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1462 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 117) (T 116 (276 + i.val + 1))
      (T 116 (276 + i.val)) (T 117 (276 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1462.entries OriginalRow227TriangleForward1462.checked
    ⟨i.val, by rw [size1462]; exact i.isLt⟩
  change (entry1462 i).check = true at h
  rcases fields1462 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1463 : OriginalRow227TriangleForward1463.entries.size = 32 := rfl

def entry1463 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1463.entries[i.val]'(by rw [size1463]; exact i.isLt)

theorem fields1463 (i : Fin 32) :
    (entry1463 i).IA = shift ∧ (entry1463 i).ID = S (308 + i.val + 1) ∧
      (entry1463 i).IC = S 117 ∧ (entry1463 i).Inext = T 116 (308 + i.val + 1) ∧
      (entry1463 i).Icur = T 116 (308 + i.val) ∧
      (entry1463 i).output = T 117 (308 + i.val) ∧
      (entry1463 i).charge = charge 116 (308 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1463 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (308 + i.val)) shift
      (S (308 + i.val + 1)) (S 117) (T 116 (308 + i.val + 1))
      (T 116 (308 + i.val)) (T 117 (308 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1463.entries OriginalRow227TriangleForward1463.checked
    ⟨i.val, by rw [size1463]; exact i.isLt⟩
  change (entry1463 i).check = true at h
  rcases fields1463 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1464 : OriginalRow227TriangleForward1464.entries.size = 32 := rfl

def entry1464 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1464.entries[i.val]'(by rw [size1464]; exact i.isLt)

theorem fields1464 (i : Fin 32) :
    (entry1464 i).IA = shift ∧ (entry1464 i).ID = S (340 + i.val + 1) ∧
      (entry1464 i).IC = S 117 ∧ (entry1464 i).Inext = T 116 (340 + i.val + 1) ∧
      (entry1464 i).Icur = T 116 (340 + i.val) ∧
      (entry1464 i).output = T 117 (340 + i.val) ∧
      (entry1464 i).charge = charge 116 (340 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1464 (i : Fin 32) :
    forwardStepOK (-768) (charge 116 (340 + i.val)) shift
      (S (340 + i.val + 1)) (S 117) (T 116 (340 + i.val + 1))
      (T 116 (340 + i.val)) (T 117 (340 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1464.entries OriginalRow227TriangleForward1464.checked
    ⟨i.val, by rw [size1464]; exact i.isLt⟩
  change (entry1464 i).check = true at h
  rcases fields1464 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1465 : OriginalRow227TriangleForward1465.entries.size = 13 := rfl

def entry1465 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1465.entries[i.val]'(by rw [size1465]; exact i.isLt)

theorem fields1465 (i : Fin 13) :
    (entry1465 i).IA = shift ∧ (entry1465 i).ID = S (372 + i.val + 1) ∧
      (entry1465 i).IC = S 117 ∧ (entry1465 i).Inext = T 116 (372 + i.val + 1) ∧
      (entry1465 i).Icur = T 116 (372 + i.val) ∧
      (entry1465 i).output = T 117 (372 + i.val) ∧
      (entry1465 i).charge = charge 116 (372 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root117).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1465 (i : Fin 13) :
    forwardStepOK (-768) (charge 116 (372 + i.val)) shift
      (S (372 + i.val + 1)) (S 117) (T 116 (372 + i.val + 1))
      (T 116 (372 + i.val)) (T 117 (372 + i.val))
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1465.entries OriginalRow227TriangleForward1465.checked
    ⟨i.val, by rw [size1465]; exact i.isLt⟩
  change (entry1465 i).check = true at h
  rcases fields1465 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 116 ≤ d) (hhi : d < 385) :
    forwardStepOK (-768) (charge 116 d) shift (S (d + 1)) (S 117)
      (T 116 (d + 1)) (T 116 d) (T 117 d)
      (OriginalRow227Roots.root_pos 117 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 116 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    by_cases h180 : d < 180
    ·
      by_cases h148 : d < 148
      ·
        have hi : d - 116 < 32 := by omega
        have heq : 116 + (d - 116) = d := by omega
        simpa only [heq] using step1457 ⟨d - 116, hi⟩
      ·
        have hi : d - 148 < 32 := by omega
        have heq : 148 + (d - 148) = d := by omega
        simpa only [heq] using step1458 ⟨d - 148, hi⟩
    ·
      by_cases h212 : d < 212
      ·
        have hi : d - 180 < 32 := by omega
        have heq : 180 + (d - 180) = d := by omega
        simpa only [heq] using step1459 ⟨d - 180, hi⟩
      ·
        have hi : d - 212 < 32 := by omega
        have heq : 212 + (d - 212) = d := by omega
        simpa only [heq] using step1460 ⟨d - 212, hi⟩
  ·
    by_cases h308 : d < 308
    ·
      by_cases h276 : d < 276
      ·
        have hi : d - 244 < 32 := by omega
        have heq : 244 + (d - 244) = d := by omega
        simpa only [heq] using step1461 ⟨d - 244, hi⟩
      ·
        have hi : d - 276 < 32 := by omega
        have heq : 276 + (d - 276) = d := by omega
        simpa only [heq] using step1462 ⟨d - 276, hi⟩
    ·
      by_cases h340 : d < 340
      ·
        have hi : d - 308 < 32 := by omega
        have heq : 308 + (d - 308) = d := by omega
        simpa only [heq] using step1463 ⟨d - 308, hi⟩
      ·
        by_cases h372 : d < 372
        ·
          have hi : d - 340 < 32 := by omega
          have heq : 340 + (d - 340) = d := by omega
          simpa only [heq] using step1464 ⟨d - 340, hi⟩
        ·
          have hi : d - 372 < 13 := by omega
          have heq : 372 + (d - 372) = d := by omega
          simpa only [heq] using step1465 ⟨d - 372, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1457,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1457,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1458,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1458,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1459,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1459,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1460,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1460,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1461,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1461,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1462,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1462,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1463,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1463,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1464,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1464,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.fields1465,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.step1465,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow117
