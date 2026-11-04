import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow111
import Grothe.UpperChaos.OriginalRow227TriangleForward1403
import Grothe.UpperChaos.OriginalRow227TriangleForward1404
import Grothe.UpperChaos.OriginalRow227TriangleForward1405
import Grothe.UpperChaos.OriginalRow227TriangleForward1406
import Grothe.UpperChaos.OriginalRow227TriangleForward1407
import Grothe.UpperChaos.OriginalRow227TriangleForward1408
import Grothe.UpperChaos.OriginalRow227TriangleForward1409
import Grothe.UpperChaos.OriginalRow227TriangleForward1410
import Grothe.UpperChaos.OriginalRow227TriangleForward1411

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1403 : OriginalRow227TriangleForward1403.entries.size = 32 := rfl

def entry1403 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1403.entries[i.val]'(by rw [size1403]; exact i.isLt)

theorem fields1403 (i : Fin 32) :
    (entry1403 i).IA = shift ∧ (entry1403 i).ID = S (110 + i.val + 1) ∧
      (entry1403 i).IC = S 111 ∧ (entry1403 i).Inext = T 110 (110 + i.val + 1) ∧
      (entry1403 i).Icur = T 110 (110 + i.val) ∧
      (entry1403 i).output = T 111 (110 + i.val) ∧
      (entry1403 i).charge = charge 110 (110 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1419_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1403 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (110 + i.val)) shift
      (S (110 + i.val + 1)) (S 111) (T 110 (110 + i.val + 1))
      (T 110 (110 + i.val)) (T 111 (110 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1403.entries OriginalRow227TriangleForward1403.checked
    ⟨i.val, by rw [size1403]; exact i.isLt⟩
  change (entry1403 i).check = true at h
  rcases fields1403 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1404 : OriginalRow227TriangleForward1404.entries.size = 32 := rfl

def entry1404 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1404.entries[i.val]'(by rw [size1404]; exact i.isLt)

theorem fields1404 (i : Fin 32) :
    (entry1404 i).IA = shift ∧ (entry1404 i).ID = S (142 + i.val + 1) ∧
      (entry1404 i).IC = S 111 ∧ (entry1404 i).Inext = T 110 (142 + i.val + 1) ∧
      (entry1404 i).Icur = T 110 (142 + i.val) ∧
      (entry1404 i).output = T 111 (142 + i.val) ∧
      (entry1404 i).charge = charge 110 (142 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1420_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1404 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (142 + i.val)) shift
      (S (142 + i.val + 1)) (S 111) (T 110 (142 + i.val + 1))
      (T 110 (142 + i.val)) (T 111 (142 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1404.entries OriginalRow227TriangleForward1404.checked
    ⟨i.val, by rw [size1404]; exact i.isLt⟩
  change (entry1404 i).check = true at h
  rcases fields1404 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1405 : OriginalRow227TriangleForward1405.entries.size = 32 := rfl

def entry1405 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1405.entries[i.val]'(by rw [size1405]; exact i.isLt)

theorem fields1405 (i : Fin 32) :
    (entry1405 i).IA = shift ∧ (entry1405 i).ID = S (174 + i.val + 1) ∧
      (entry1405 i).IC = S 111 ∧ (entry1405 i).Inext = T 110 (174 + i.val + 1) ∧
      (entry1405 i).Icur = T 110 (174 + i.val) ∧
      (entry1405 i).output = T 111 (174 + i.val) ∧
      (entry1405 i).charge = charge 110 (174 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1421_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1405 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (174 + i.val)) shift
      (S (174 + i.val + 1)) (S 111) (T 110 (174 + i.val + 1))
      (T 110 (174 + i.val)) (T 111 (174 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1405.entries OriginalRow227TriangleForward1405.checked
    ⟨i.val, by rw [size1405]; exact i.isLt⟩
  change (entry1405 i).check = true at h
  rcases fields1405 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1406 : OriginalRow227TriangleForward1406.entries.size = 32 := rfl

def entry1406 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1406.entries[i.val]'(by rw [size1406]; exact i.isLt)

theorem fields1406 (i : Fin 32) :
    (entry1406 i).IA = shift ∧ (entry1406 i).ID = S (206 + i.val + 1) ∧
      (entry1406 i).IC = S 111 ∧ (entry1406 i).Inext = T 110 (206 + i.val + 1) ∧
      (entry1406 i).Icur = T 110 (206 + i.val) ∧
      (entry1406 i).output = T 111 (206 + i.val) ∧
      (entry1406 i).charge = charge 110 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1422_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1406 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 111) (T 110 (206 + i.val + 1))
      (T 110 (206 + i.val)) (T 111 (206 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1406.entries OriginalRow227TriangleForward1406.checked
    ⟨i.val, by rw [size1406]; exact i.isLt⟩
  change (entry1406 i).check = true at h
  rcases fields1406 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1407 : OriginalRow227TriangleForward1407.entries.size = 32 := rfl

def entry1407 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1407.entries[i.val]'(by rw [size1407]; exact i.isLt)

theorem fields1407 (i : Fin 32) :
    (entry1407 i).IA = shift ∧ (entry1407 i).ID = S (238 + i.val + 1) ∧
      (entry1407 i).IC = S 111 ∧ (entry1407 i).Inext = T 110 (238 + i.val + 1) ∧
      (entry1407 i).Icur = T 110 (238 + i.val) ∧
      (entry1407 i).output = T 111 (238 + i.val) ∧
      (entry1407 i).charge = charge 110 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1423_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1407 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 111) (T 110 (238 + i.val + 1))
      (T 110 (238 + i.val)) (T 111 (238 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1407.entries OriginalRow227TriangleForward1407.checked
    ⟨i.val, by rw [size1407]; exact i.isLt⟩
  change (entry1407 i).check = true at h
  rcases fields1407 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1408 : OriginalRow227TriangleForward1408.entries.size = 32 := rfl

def entry1408 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1408.entries[i.val]'(by rw [size1408]; exact i.isLt)

theorem fields1408 (i : Fin 32) :
    (entry1408 i).IA = shift ∧ (entry1408 i).ID = S (270 + i.val + 1) ∧
      (entry1408 i).IC = S 111 ∧ (entry1408 i).Inext = T 110 (270 + i.val + 1) ∧
      (entry1408 i).Icur = T 110 (270 + i.val) ∧
      (entry1408 i).output = T 111 (270 + i.val) ∧
      (entry1408 i).charge = charge 110 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1424_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1408 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 111) (T 110 (270 + i.val + 1))
      (T 110 (270 + i.val)) (T 111 (270 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1408.entries OriginalRow227TriangleForward1408.checked
    ⟨i.val, by rw [size1408]; exact i.isLt⟩
  change (entry1408 i).check = true at h
  rcases fields1408 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1409 : OriginalRow227TriangleForward1409.entries.size = 32 := rfl

def entry1409 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1409.entries[i.val]'(by rw [size1409]; exact i.isLt)

theorem fields1409 (i : Fin 32) :
    (entry1409 i).IA = shift ∧ (entry1409 i).ID = S (302 + i.val + 1) ∧
      (entry1409 i).IC = S 111 ∧ (entry1409 i).Inext = T 110 (302 + i.val + 1) ∧
      (entry1409 i).Icur = T 110 (302 + i.val) ∧
      (entry1409 i).output = T 111 (302 + i.val) ∧
      (entry1409 i).charge = charge 110 (302 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1425_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1409 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (302 + i.val)) shift
      (S (302 + i.val + 1)) (S 111) (T 110 (302 + i.val + 1))
      (T 110 (302 + i.val)) (T 111 (302 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1409.entries OriginalRow227TriangleForward1409.checked
    ⟨i.val, by rw [size1409]; exact i.isLt⟩
  change (entry1409 i).check = true at h
  rcases fields1409 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1410 : OriginalRow227TriangleForward1410.entries.size = 32 := rfl

def entry1410 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1410.entries[i.val]'(by rw [size1410]; exact i.isLt)

theorem fields1410 (i : Fin 32) :
    (entry1410 i).IA = shift ∧ (entry1410 i).ID = S (334 + i.val + 1) ∧
      (entry1410 i).IC = S 111 ∧ (entry1410 i).Inext = T 110 (334 + i.val + 1) ∧
      (entry1410 i).Icur = T 110 (334 + i.val) ∧
      (entry1410 i).output = T 111 (334 + i.val) ∧
      (entry1410 i).charge = charge 110 (334 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1426_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1410 (i : Fin 32) :
    forwardStepOK (-768) (charge 110 (334 + i.val)) shift
      (S (334 + i.val + 1)) (S 111) (T 110 (334 + i.val + 1))
      (T 110 (334 + i.val)) (T 111 (334 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1410.entries OriginalRow227TriangleForward1410.checked
    ⟨i.val, by rw [size1410]; exact i.isLt⟩
  change (entry1410 i).check = true at h
  rcases fields1410 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1411 : OriginalRow227TriangleForward1411.entries.size = 25 := rfl

def entry1411 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1411.entries[i.val]'(by rw [size1411]; exact i.isLt)

theorem fields1411 (i : Fin 25) :
    (entry1411 i).IA = shift ∧ (entry1411 i).ID = S (366 + i.val + 1) ∧
      (entry1411 i).IC = S 111 ∧ (entry1411 i).Inext = T 110 (366 + i.val + 1) ∧
      (entry1411 i).Icur = T 110 (366 + i.val) ∧
      (entry1411 i).output = T 111 (366 + i.val) ∧
      (entry1411 i).charge = charge 110 (366 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root111).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow111.block1427_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1411 (i : Fin 25) :
    forwardStepOK (-768) (charge 110 (366 + i.val)) shift
      (S (366 + i.val + 1)) (S 111) (T 110 (366 + i.val + 1))
      (T 110 (366 + i.val)) (T 111 (366 + i.val))
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1411.entries OriginalRow227TriangleForward1411.checked
    ⟨i.val, by rw [size1411]; exact i.isLt⟩
  change (entry1411 i).check = true at h
  rcases fields1411 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 110 ≤ d) (hhi : d < 391) :
    forwardStepOK (-768) (charge 110 d) shift (S (d + 1)) (S 111)
      (T 110 (d + 1)) (T 110 d) (T 111 d)
      (OriginalRow227Roots.root_pos 111 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 110 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    by_cases h174 : d < 174
    ·
      by_cases h142 : d < 142
      ·
        have hi : d - 110 < 32 := by omega
        have heq : 110 + (d - 110) = d := by omega
        simpa only [heq] using step1403 ⟨d - 110, hi⟩
      ·
        have hi : d - 142 < 32 := by omega
        have heq : 142 + (d - 142) = d := by omega
        simpa only [heq] using step1404 ⟨d - 142, hi⟩
    ·
      by_cases h206 : d < 206
      ·
        have hi : d - 174 < 32 := by omega
        have heq : 174 + (d - 174) = d := by omega
        simpa only [heq] using step1405 ⟨d - 174, hi⟩
      ·
        have hi : d - 206 < 32 := by omega
        have heq : 206 + (d - 206) = d := by omega
        simpa only [heq] using step1406 ⟨d - 206, hi⟩
  ·
    by_cases h302 : d < 302
    ·
      by_cases h270 : d < 270
      ·
        have hi : d - 238 < 32 := by omega
        have heq : 238 + (d - 238) = d := by omega
        simpa only [heq] using step1407 ⟨d - 238, hi⟩
      ·
        have hi : d - 270 < 32 := by omega
        have heq : 270 + (d - 270) = d := by omega
        simpa only [heq] using step1408 ⟨d - 270, hi⟩
    ·
      by_cases h334 : d < 334
      ·
        have hi : d - 302 < 32 := by omega
        have heq : 302 + (d - 302) = d := by omega
        simpa only [heq] using step1409 ⟨d - 302, hi⟩
      ·
        by_cases h366 : d < 366
        ·
          have hi : d - 334 < 32 := by omega
          have heq : 334 + (d - 334) = d := by omega
          simpa only [heq] using step1410 ⟨d - 334, hi⟩
        ·
          have hi : d - 366 < 25 := by omega
          have heq : 366 + (d - 366) = d := by omega
          simpa only [heq] using step1411 ⟨d - 366, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1403,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1403,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1404,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1404,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1405,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1405,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1406,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1406,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1407,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1407,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1408,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1408,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1409,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1409,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1410,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1410,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.fields1411,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.step1411,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow111
