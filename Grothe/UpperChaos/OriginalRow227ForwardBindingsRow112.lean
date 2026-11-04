import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow112
import Grothe.UpperChaos.OriginalRow227TriangleForward1412
import Grothe.UpperChaos.OriginalRow227TriangleForward1413
import Grothe.UpperChaos.OriginalRow227TriangleForward1414
import Grothe.UpperChaos.OriginalRow227TriangleForward1415
import Grothe.UpperChaos.OriginalRow227TriangleForward1416
import Grothe.UpperChaos.OriginalRow227TriangleForward1417
import Grothe.UpperChaos.OriginalRow227TriangleForward1418
import Grothe.UpperChaos.OriginalRow227TriangleForward1419
import Grothe.UpperChaos.OriginalRow227TriangleForward1420

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1412 : OriginalRow227TriangleForward1412.entries.size = 32 := rfl

def entry1412 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1412.entries[i.val]'(by rw [size1412]; exact i.isLt)

theorem fields1412 (i : Fin 32) :
    (entry1412 i).IA = shift ∧ (entry1412 i).ID = S (111 + i.val + 1) ∧
      (entry1412 i).IC = S 112 ∧ (entry1412 i).Inext = T 111 (111 + i.val + 1) ∧
      (entry1412 i).Icur = T 111 (111 + i.val) ∧
      (entry1412 i).output = T 112 (111 + i.val) ∧
      (entry1412 i).charge = charge 111 (111 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1428_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1412 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (111 + i.val)) shift
      (S (111 + i.val + 1)) (S 112) (T 111 (111 + i.val + 1))
      (T 111 (111 + i.val)) (T 112 (111 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1412.entries OriginalRow227TriangleForward1412.checked
    ⟨i.val, by rw [size1412]; exact i.isLt⟩
  change (entry1412 i).check = true at h
  rcases fields1412 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1413 : OriginalRow227TriangleForward1413.entries.size = 32 := rfl

def entry1413 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1413.entries[i.val]'(by rw [size1413]; exact i.isLt)

theorem fields1413 (i : Fin 32) :
    (entry1413 i).IA = shift ∧ (entry1413 i).ID = S (143 + i.val + 1) ∧
      (entry1413 i).IC = S 112 ∧ (entry1413 i).Inext = T 111 (143 + i.val + 1) ∧
      (entry1413 i).Icur = T 111 (143 + i.val) ∧
      (entry1413 i).output = T 112 (143 + i.val) ∧
      (entry1413 i).charge = charge 111 (143 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1429_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1413 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (143 + i.val)) shift
      (S (143 + i.val + 1)) (S 112) (T 111 (143 + i.val + 1))
      (T 111 (143 + i.val)) (T 112 (143 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1413.entries OriginalRow227TriangleForward1413.checked
    ⟨i.val, by rw [size1413]; exact i.isLt⟩
  change (entry1413 i).check = true at h
  rcases fields1413 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1414 : OriginalRow227TriangleForward1414.entries.size = 32 := rfl

def entry1414 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1414.entries[i.val]'(by rw [size1414]; exact i.isLt)

theorem fields1414 (i : Fin 32) :
    (entry1414 i).IA = shift ∧ (entry1414 i).ID = S (175 + i.val + 1) ∧
      (entry1414 i).IC = S 112 ∧ (entry1414 i).Inext = T 111 (175 + i.val + 1) ∧
      (entry1414 i).Icur = T 111 (175 + i.val) ∧
      (entry1414 i).output = T 112 (175 + i.val) ∧
      (entry1414 i).charge = charge 111 (175 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1430_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1414 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (175 + i.val)) shift
      (S (175 + i.val + 1)) (S 112) (T 111 (175 + i.val + 1))
      (T 111 (175 + i.val)) (T 112 (175 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1414.entries OriginalRow227TriangleForward1414.checked
    ⟨i.val, by rw [size1414]; exact i.isLt⟩
  change (entry1414 i).check = true at h
  rcases fields1414 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1415 : OriginalRow227TriangleForward1415.entries.size = 32 := rfl

def entry1415 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1415.entries[i.val]'(by rw [size1415]; exact i.isLt)

theorem fields1415 (i : Fin 32) :
    (entry1415 i).IA = shift ∧ (entry1415 i).ID = S (207 + i.val + 1) ∧
      (entry1415 i).IC = S 112 ∧ (entry1415 i).Inext = T 111 (207 + i.val + 1) ∧
      (entry1415 i).Icur = T 111 (207 + i.val) ∧
      (entry1415 i).output = T 112 (207 + i.val) ∧
      (entry1415 i).charge = charge 111 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1431_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1415 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 112) (T 111 (207 + i.val + 1))
      (T 111 (207 + i.val)) (T 112 (207 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1415.entries OriginalRow227TriangleForward1415.checked
    ⟨i.val, by rw [size1415]; exact i.isLt⟩
  change (entry1415 i).check = true at h
  rcases fields1415 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1416 : OriginalRow227TriangleForward1416.entries.size = 32 := rfl

def entry1416 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1416.entries[i.val]'(by rw [size1416]; exact i.isLt)

theorem fields1416 (i : Fin 32) :
    (entry1416 i).IA = shift ∧ (entry1416 i).ID = S (239 + i.val + 1) ∧
      (entry1416 i).IC = S 112 ∧ (entry1416 i).Inext = T 111 (239 + i.val + 1) ∧
      (entry1416 i).Icur = T 111 (239 + i.val) ∧
      (entry1416 i).output = T 112 (239 + i.val) ∧
      (entry1416 i).charge = charge 111 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1432_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1416 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 112) (T 111 (239 + i.val + 1))
      (T 111 (239 + i.val)) (T 112 (239 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1416.entries OriginalRow227TriangleForward1416.checked
    ⟨i.val, by rw [size1416]; exact i.isLt⟩
  change (entry1416 i).check = true at h
  rcases fields1416 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1417 : OriginalRow227TriangleForward1417.entries.size = 32 := rfl

def entry1417 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1417.entries[i.val]'(by rw [size1417]; exact i.isLt)

theorem fields1417 (i : Fin 32) :
    (entry1417 i).IA = shift ∧ (entry1417 i).ID = S (271 + i.val + 1) ∧
      (entry1417 i).IC = S 112 ∧ (entry1417 i).Inext = T 111 (271 + i.val + 1) ∧
      (entry1417 i).Icur = T 111 (271 + i.val) ∧
      (entry1417 i).output = T 112 (271 + i.val) ∧
      (entry1417 i).charge = charge 111 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1433_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1417 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 112) (T 111 (271 + i.val + 1))
      (T 111 (271 + i.val)) (T 112 (271 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1417.entries OriginalRow227TriangleForward1417.checked
    ⟨i.val, by rw [size1417]; exact i.isLt⟩
  change (entry1417 i).check = true at h
  rcases fields1417 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1418 : OriginalRow227TriangleForward1418.entries.size = 32 := rfl

def entry1418 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1418.entries[i.val]'(by rw [size1418]; exact i.isLt)

theorem fields1418 (i : Fin 32) :
    (entry1418 i).IA = shift ∧ (entry1418 i).ID = S (303 + i.val + 1) ∧
      (entry1418 i).IC = S 112 ∧ (entry1418 i).Inext = T 111 (303 + i.val + 1) ∧
      (entry1418 i).Icur = T 111 (303 + i.val) ∧
      (entry1418 i).output = T 112 (303 + i.val) ∧
      (entry1418 i).charge = charge 111 (303 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1434_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1418 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (303 + i.val)) shift
      (S (303 + i.val + 1)) (S 112) (T 111 (303 + i.val + 1))
      (T 111 (303 + i.val)) (T 112 (303 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1418.entries OriginalRow227TriangleForward1418.checked
    ⟨i.val, by rw [size1418]; exact i.isLt⟩
  change (entry1418 i).check = true at h
  rcases fields1418 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1419 : OriginalRow227TriangleForward1419.entries.size = 32 := rfl

def entry1419 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1419.entries[i.val]'(by rw [size1419]; exact i.isLt)

theorem fields1419 (i : Fin 32) :
    (entry1419 i).IA = shift ∧ (entry1419 i).ID = S (335 + i.val + 1) ∧
      (entry1419 i).IC = S 112 ∧ (entry1419 i).Inext = T 111 (335 + i.val + 1) ∧
      (entry1419 i).Icur = T 111 (335 + i.val) ∧
      (entry1419 i).output = T 112 (335 + i.val) ∧
      (entry1419 i).charge = charge 111 (335 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1435_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1419 (i : Fin 32) :
    forwardStepOK (-768) (charge 111 (335 + i.val)) shift
      (S (335 + i.val + 1)) (S 112) (T 111 (335 + i.val + 1))
      (T 111 (335 + i.val)) (T 112 (335 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1419.entries OriginalRow227TriangleForward1419.checked
    ⟨i.val, by rw [size1419]; exact i.isLt⟩
  change (entry1419 i).check = true at h
  rcases fields1419 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1420 : OriginalRow227TriangleForward1420.entries.size = 23 := rfl

def entry1420 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1420.entries[i.val]'(by rw [size1420]; exact i.isLt)

theorem fields1420 (i : Fin 23) :
    (entry1420 i).IA = shift ∧ (entry1420 i).ID = S (367 + i.val + 1) ∧
      (entry1420 i).IC = S 112 ∧ (entry1420 i).Inext = T 111 (367 + i.val + 1) ∧
      (entry1420 i).Icur = T 111 (367 + i.val) ∧
      (entry1420 i).output = T 112 (367 + i.val) ∧
      (entry1420 i).charge = charge 111 (367 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root112).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow112.block1436_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1420 (i : Fin 23) :
    forwardStepOK (-768) (charge 111 (367 + i.val)) shift
      (S (367 + i.val + 1)) (S 112) (T 111 (367 + i.val + 1))
      (T 111 (367 + i.val)) (T 112 (367 + i.val))
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1420.entries OriginalRow227TriangleForward1420.checked
    ⟨i.val, by rw [size1420]; exact i.isLt⟩
  change (entry1420 i).check = true at h
  rcases fields1420 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 111 ≤ d) (hhi : d < 390) :
    forwardStepOK (-768) (charge 111 d) shift (S (d + 1)) (S 112)
      (T 111 (d + 1)) (T 111 d) (T 112 d)
      (OriginalRow227Roots.root_pos 112 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 111 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    by_cases h175 : d < 175
    ·
      by_cases h143 : d < 143
      ·
        have hi : d - 111 < 32 := by omega
        have heq : 111 + (d - 111) = d := by omega
        simpa only [heq] using step1412 ⟨d - 111, hi⟩
      ·
        have hi : d - 143 < 32 := by omega
        have heq : 143 + (d - 143) = d := by omega
        simpa only [heq] using step1413 ⟨d - 143, hi⟩
    ·
      by_cases h207 : d < 207
      ·
        have hi : d - 175 < 32 := by omega
        have heq : 175 + (d - 175) = d := by omega
        simpa only [heq] using step1414 ⟨d - 175, hi⟩
      ·
        have hi : d - 207 < 32 := by omega
        have heq : 207 + (d - 207) = d := by omega
        simpa only [heq] using step1415 ⟨d - 207, hi⟩
  ·
    by_cases h303 : d < 303
    ·
      by_cases h271 : d < 271
      ·
        have hi : d - 239 < 32 := by omega
        have heq : 239 + (d - 239) = d := by omega
        simpa only [heq] using step1416 ⟨d - 239, hi⟩
      ·
        have hi : d - 271 < 32 := by omega
        have heq : 271 + (d - 271) = d := by omega
        simpa only [heq] using step1417 ⟨d - 271, hi⟩
    ·
      by_cases h335 : d < 335
      ·
        have hi : d - 303 < 32 := by omega
        have heq : 303 + (d - 303) = d := by omega
        simpa only [heq] using step1418 ⟨d - 303, hi⟩
      ·
        by_cases h367 : d < 367
        ·
          have hi : d - 335 < 32 := by omega
          have heq : 335 + (d - 335) = d := by omega
          simpa only [heq] using step1419 ⟨d - 335, hi⟩
        ·
          have hi : d - 367 < 23 := by omega
          have heq : 367 + (d - 367) = d := by omega
          simpa only [heq] using step1420 ⟨d - 367, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1412,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1412,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1413,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1413,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1414,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1414,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1415,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1415,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1416,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1416,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1417,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1417,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1418,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1418,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1419,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1419,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.fields1420,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.step1420,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow112
