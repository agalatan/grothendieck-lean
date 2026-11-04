import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow116
import Grothe.UpperChaos.OriginalRow227TriangleForward1448
import Grothe.UpperChaos.OriginalRow227TriangleForward1449
import Grothe.UpperChaos.OriginalRow227TriangleForward1450
import Grothe.UpperChaos.OriginalRow227TriangleForward1451
import Grothe.UpperChaos.OriginalRow227TriangleForward1452
import Grothe.UpperChaos.OriginalRow227TriangleForward1453
import Grothe.UpperChaos.OriginalRow227TriangleForward1454
import Grothe.UpperChaos.OriginalRow227TriangleForward1455
import Grothe.UpperChaos.OriginalRow227TriangleForward1456

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1448 : OriginalRow227TriangleForward1448.entries.size = 32 := rfl

def entry1448 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1448.entries[i.val]'(by rw [size1448]; exact i.isLt)

theorem fields1448 (i : Fin 32) :
    (entry1448 i).IA = shift ∧ (entry1448 i).ID = S (115 + i.val + 1) ∧
      (entry1448 i).IC = S 116 ∧ (entry1448 i).Inext = T 115 (115 + i.val + 1) ∧
      (entry1448 i).Icur = T 115 (115 + i.val) ∧
      (entry1448 i).output = T 116 (115 + i.val) ∧
      (entry1448 i).charge = charge 115 (115 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1464_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1448 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (115 + i.val)) shift
      (S (115 + i.val + 1)) (S 116) (T 115 (115 + i.val + 1))
      (T 115 (115 + i.val)) (T 116 (115 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1448.entries OriginalRow227TriangleForward1448.checked
    ⟨i.val, by rw [size1448]; exact i.isLt⟩
  change (entry1448 i).check = true at h
  rcases fields1448 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1449 : OriginalRow227TriangleForward1449.entries.size = 32 := rfl

def entry1449 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1449.entries[i.val]'(by rw [size1449]; exact i.isLt)

theorem fields1449 (i : Fin 32) :
    (entry1449 i).IA = shift ∧ (entry1449 i).ID = S (147 + i.val + 1) ∧
      (entry1449 i).IC = S 116 ∧ (entry1449 i).Inext = T 115 (147 + i.val + 1) ∧
      (entry1449 i).Icur = T 115 (147 + i.val) ∧
      (entry1449 i).output = T 116 (147 + i.val) ∧
      (entry1449 i).charge = charge 115 (147 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1465_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1449 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (147 + i.val)) shift
      (S (147 + i.val + 1)) (S 116) (T 115 (147 + i.val + 1))
      (T 115 (147 + i.val)) (T 116 (147 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1449.entries OriginalRow227TriangleForward1449.checked
    ⟨i.val, by rw [size1449]; exact i.isLt⟩
  change (entry1449 i).check = true at h
  rcases fields1449 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1450 : OriginalRow227TriangleForward1450.entries.size = 32 := rfl

def entry1450 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1450.entries[i.val]'(by rw [size1450]; exact i.isLt)

theorem fields1450 (i : Fin 32) :
    (entry1450 i).IA = shift ∧ (entry1450 i).ID = S (179 + i.val + 1) ∧
      (entry1450 i).IC = S 116 ∧ (entry1450 i).Inext = T 115 (179 + i.val + 1) ∧
      (entry1450 i).Icur = T 115 (179 + i.val) ∧
      (entry1450 i).output = T 116 (179 + i.val) ∧
      (entry1450 i).charge = charge 115 (179 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1466_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1450 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (179 + i.val)) shift
      (S (179 + i.val + 1)) (S 116) (T 115 (179 + i.val + 1))
      (T 115 (179 + i.val)) (T 116 (179 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1450.entries OriginalRow227TriangleForward1450.checked
    ⟨i.val, by rw [size1450]; exact i.isLt⟩
  change (entry1450 i).check = true at h
  rcases fields1450 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1451 : OriginalRow227TriangleForward1451.entries.size = 32 := rfl

def entry1451 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1451.entries[i.val]'(by rw [size1451]; exact i.isLt)

theorem fields1451 (i : Fin 32) :
    (entry1451 i).IA = shift ∧ (entry1451 i).ID = S (211 + i.val + 1) ∧
      (entry1451 i).IC = S 116 ∧ (entry1451 i).Inext = T 115 (211 + i.val + 1) ∧
      (entry1451 i).Icur = T 115 (211 + i.val) ∧
      (entry1451 i).output = T 116 (211 + i.val) ∧
      (entry1451 i).charge = charge 115 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1467_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1451 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 116) (T 115 (211 + i.val + 1))
      (T 115 (211 + i.val)) (T 116 (211 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1451.entries OriginalRow227TriangleForward1451.checked
    ⟨i.val, by rw [size1451]; exact i.isLt⟩
  change (entry1451 i).check = true at h
  rcases fields1451 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1452 : OriginalRow227TriangleForward1452.entries.size = 32 := rfl

def entry1452 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1452.entries[i.val]'(by rw [size1452]; exact i.isLt)

theorem fields1452 (i : Fin 32) :
    (entry1452 i).IA = shift ∧ (entry1452 i).ID = S (243 + i.val + 1) ∧
      (entry1452 i).IC = S 116 ∧ (entry1452 i).Inext = T 115 (243 + i.val + 1) ∧
      (entry1452 i).Icur = T 115 (243 + i.val) ∧
      (entry1452 i).output = T 116 (243 + i.val) ∧
      (entry1452 i).charge = charge 115 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1468_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1452 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 116) (T 115 (243 + i.val + 1))
      (T 115 (243 + i.val)) (T 116 (243 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1452.entries OriginalRow227TriangleForward1452.checked
    ⟨i.val, by rw [size1452]; exact i.isLt⟩
  change (entry1452 i).check = true at h
  rcases fields1452 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1453 : OriginalRow227TriangleForward1453.entries.size = 32 := rfl

def entry1453 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1453.entries[i.val]'(by rw [size1453]; exact i.isLt)

theorem fields1453 (i : Fin 32) :
    (entry1453 i).IA = shift ∧ (entry1453 i).ID = S (275 + i.val + 1) ∧
      (entry1453 i).IC = S 116 ∧ (entry1453 i).Inext = T 115 (275 + i.val + 1) ∧
      (entry1453 i).Icur = T 115 (275 + i.val) ∧
      (entry1453 i).output = T 116 (275 + i.val) ∧
      (entry1453 i).charge = charge 115 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1469_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1453 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 116) (T 115 (275 + i.val + 1))
      (T 115 (275 + i.val)) (T 116 (275 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1453.entries OriginalRow227TriangleForward1453.checked
    ⟨i.val, by rw [size1453]; exact i.isLt⟩
  change (entry1453 i).check = true at h
  rcases fields1453 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1454 : OriginalRow227TriangleForward1454.entries.size = 32 := rfl

def entry1454 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1454.entries[i.val]'(by rw [size1454]; exact i.isLt)

theorem fields1454 (i : Fin 32) :
    (entry1454 i).IA = shift ∧ (entry1454 i).ID = S (307 + i.val + 1) ∧
      (entry1454 i).IC = S 116 ∧ (entry1454 i).Inext = T 115 (307 + i.val + 1) ∧
      (entry1454 i).Icur = T 115 (307 + i.val) ∧
      (entry1454 i).output = T 116 (307 + i.val) ∧
      (entry1454 i).charge = charge 115 (307 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1470_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1454 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (307 + i.val)) shift
      (S (307 + i.val + 1)) (S 116) (T 115 (307 + i.val + 1))
      (T 115 (307 + i.val)) (T 116 (307 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1454.entries OriginalRow227TriangleForward1454.checked
    ⟨i.val, by rw [size1454]; exact i.isLt⟩
  change (entry1454 i).check = true at h
  rcases fields1454 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1455 : OriginalRow227TriangleForward1455.entries.size = 32 := rfl

def entry1455 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1455.entries[i.val]'(by rw [size1455]; exact i.isLt)

theorem fields1455 (i : Fin 32) :
    (entry1455 i).IA = shift ∧ (entry1455 i).ID = S (339 + i.val + 1) ∧
      (entry1455 i).IC = S 116 ∧ (entry1455 i).Inext = T 115 (339 + i.val + 1) ∧
      (entry1455 i).Icur = T 115 (339 + i.val) ∧
      (entry1455 i).output = T 116 (339 + i.val) ∧
      (entry1455 i).charge = charge 115 (339 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1471_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1455 (i : Fin 32) :
    forwardStepOK (-768) (charge 115 (339 + i.val)) shift
      (S (339 + i.val + 1)) (S 116) (T 115 (339 + i.val + 1))
      (T 115 (339 + i.val)) (T 116 (339 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1455.entries OriginalRow227TriangleForward1455.checked
    ⟨i.val, by rw [size1455]; exact i.isLt⟩
  change (entry1455 i).check = true at h
  rcases fields1455 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1456 : OriginalRow227TriangleForward1456.entries.size = 15 := rfl

def entry1456 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1456.entries[i.val]'(by rw [size1456]; exact i.isLt)

theorem fields1456 (i : Fin 15) :
    (entry1456 i).IA = shift ∧ (entry1456 i).ID = S (371 + i.val + 1) ∧
      (entry1456 i).IC = S 116 ∧ (entry1456 i).Inext = T 115 (371 + i.val + 1) ∧
      (entry1456 i).Icur = T 115 (371 + i.val) ∧
      (entry1456 i).output = T 116 (371 + i.val) ∧
      (entry1456 i).charge = charge 115 (371 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root116).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow116.block1472_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1456 (i : Fin 15) :
    forwardStepOK (-768) (charge 115 (371 + i.val)) shift
      (S (371 + i.val + 1)) (S 116) (T 115 (371 + i.val + 1))
      (T 115 (371 + i.val)) (T 116 (371 + i.val))
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1456.entries OriginalRow227TriangleForward1456.checked
    ⟨i.val, by rw [size1456]; exact i.isLt⟩
  change (entry1456 i).check = true at h
  rcases fields1456 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 115 ≤ d) (hhi : d < 386) :
    forwardStepOK (-768) (charge 115 d) shift (S (d + 1)) (S 116)
      (T 115 (d + 1)) (T 115 d) (T 116 d)
      (OriginalRow227Roots.root_pos 116 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 115 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    by_cases h179 : d < 179
    ·
      by_cases h147 : d < 147
      ·
        have hi : d - 115 < 32 := by omega
        have heq : 115 + (d - 115) = d := by omega
        simpa only [heq] using step1448 ⟨d - 115, hi⟩
      ·
        have hi : d - 147 < 32 := by omega
        have heq : 147 + (d - 147) = d := by omega
        simpa only [heq] using step1449 ⟨d - 147, hi⟩
    ·
      by_cases h211 : d < 211
      ·
        have hi : d - 179 < 32 := by omega
        have heq : 179 + (d - 179) = d := by omega
        simpa only [heq] using step1450 ⟨d - 179, hi⟩
      ·
        have hi : d - 211 < 32 := by omega
        have heq : 211 + (d - 211) = d := by omega
        simpa only [heq] using step1451 ⟨d - 211, hi⟩
  ·
    by_cases h307 : d < 307
    ·
      by_cases h275 : d < 275
      ·
        have hi : d - 243 < 32 := by omega
        have heq : 243 + (d - 243) = d := by omega
        simpa only [heq] using step1452 ⟨d - 243, hi⟩
      ·
        have hi : d - 275 < 32 := by omega
        have heq : 275 + (d - 275) = d := by omega
        simpa only [heq] using step1453 ⟨d - 275, hi⟩
    ·
      by_cases h339 : d < 339
      ·
        have hi : d - 307 < 32 := by omega
        have heq : 307 + (d - 307) = d := by omega
        simpa only [heq] using step1454 ⟨d - 307, hi⟩
      ·
        by_cases h371 : d < 371
        ·
          have hi : d - 339 < 32 := by omega
          have heq : 339 + (d - 339) = d := by omega
          simpa only [heq] using step1455 ⟨d - 339, hi⟩
        ·
          have hi : d - 371 < 15 := by omega
          have heq : 371 + (d - 371) = d := by omega
          simpa only [heq] using step1456 ⟨d - 371, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1448,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1448,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1449,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1449,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1450,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1450,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1451,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1451,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1452,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1452,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1453,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1453,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1454,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1454,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1455,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1455,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.fields1456,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.step1456,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow116
