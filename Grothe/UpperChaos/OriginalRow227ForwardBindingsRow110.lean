import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow110
import Grothe.UpperChaos.OriginalRow227TriangleForward1394
import Grothe.UpperChaos.OriginalRow227TriangleForward1395
import Grothe.UpperChaos.OriginalRow227TriangleForward1396
import Grothe.UpperChaos.OriginalRow227TriangleForward1397
import Grothe.UpperChaos.OriginalRow227TriangleForward1398
import Grothe.UpperChaos.OriginalRow227TriangleForward1399
import Grothe.UpperChaos.OriginalRow227TriangleForward1400
import Grothe.UpperChaos.OriginalRow227TriangleForward1401
import Grothe.UpperChaos.OriginalRow227TriangleForward1402

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1394 : OriginalRow227TriangleForward1394.entries.size = 32 := rfl

def entry1394 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1394.entries[i.val]'(by rw [size1394]; exact i.isLt)

theorem fields1394 (i : Fin 32) :
    (entry1394 i).IA = shift ∧ (entry1394 i).ID = S (109 + i.val + 1) ∧
      (entry1394 i).IC = S 110 ∧ (entry1394 i).Inext = T 109 (109 + i.val + 1) ∧
      (entry1394 i).Icur = T 109 (109 + i.val) ∧
      (entry1394 i).output = T 110 (109 + i.val) ∧
      (entry1394 i).charge = charge 109 (109 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1410_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1394 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (109 + i.val)) shift
      (S (109 + i.val + 1)) (S 110) (T 109 (109 + i.val + 1))
      (T 109 (109 + i.val)) (T 110 (109 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1394.entries OriginalRow227TriangleForward1394.checked
    ⟨i.val, by rw [size1394]; exact i.isLt⟩
  change (entry1394 i).check = true at h
  rcases fields1394 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1395 : OriginalRow227TriangleForward1395.entries.size = 32 := rfl

def entry1395 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1395.entries[i.val]'(by rw [size1395]; exact i.isLt)

theorem fields1395 (i : Fin 32) :
    (entry1395 i).IA = shift ∧ (entry1395 i).ID = S (141 + i.val + 1) ∧
      (entry1395 i).IC = S 110 ∧ (entry1395 i).Inext = T 109 (141 + i.val + 1) ∧
      (entry1395 i).Icur = T 109 (141 + i.val) ∧
      (entry1395 i).output = T 110 (141 + i.val) ∧
      (entry1395 i).charge = charge 109 (141 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1411_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1395 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (141 + i.val)) shift
      (S (141 + i.val + 1)) (S 110) (T 109 (141 + i.val + 1))
      (T 109 (141 + i.val)) (T 110 (141 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1395.entries OriginalRow227TriangleForward1395.checked
    ⟨i.val, by rw [size1395]; exact i.isLt⟩
  change (entry1395 i).check = true at h
  rcases fields1395 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1396 : OriginalRow227TriangleForward1396.entries.size = 32 := rfl

def entry1396 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1396.entries[i.val]'(by rw [size1396]; exact i.isLt)

theorem fields1396 (i : Fin 32) :
    (entry1396 i).IA = shift ∧ (entry1396 i).ID = S (173 + i.val + 1) ∧
      (entry1396 i).IC = S 110 ∧ (entry1396 i).Inext = T 109 (173 + i.val + 1) ∧
      (entry1396 i).Icur = T 109 (173 + i.val) ∧
      (entry1396 i).output = T 110 (173 + i.val) ∧
      (entry1396 i).charge = charge 109 (173 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1412_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1396 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (173 + i.val)) shift
      (S (173 + i.val + 1)) (S 110) (T 109 (173 + i.val + 1))
      (T 109 (173 + i.val)) (T 110 (173 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1396.entries OriginalRow227TriangleForward1396.checked
    ⟨i.val, by rw [size1396]; exact i.isLt⟩
  change (entry1396 i).check = true at h
  rcases fields1396 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1397 : OriginalRow227TriangleForward1397.entries.size = 32 := rfl

def entry1397 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1397.entries[i.val]'(by rw [size1397]; exact i.isLt)

theorem fields1397 (i : Fin 32) :
    (entry1397 i).IA = shift ∧ (entry1397 i).ID = S (205 + i.val + 1) ∧
      (entry1397 i).IC = S 110 ∧ (entry1397 i).Inext = T 109 (205 + i.val + 1) ∧
      (entry1397 i).Icur = T 109 (205 + i.val) ∧
      (entry1397 i).output = T 110 (205 + i.val) ∧
      (entry1397 i).charge = charge 109 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1413_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1397 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 110) (T 109 (205 + i.val + 1))
      (T 109 (205 + i.val)) (T 110 (205 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1397.entries OriginalRow227TriangleForward1397.checked
    ⟨i.val, by rw [size1397]; exact i.isLt⟩
  change (entry1397 i).check = true at h
  rcases fields1397 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1398 : OriginalRow227TriangleForward1398.entries.size = 32 := rfl

def entry1398 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1398.entries[i.val]'(by rw [size1398]; exact i.isLt)

theorem fields1398 (i : Fin 32) :
    (entry1398 i).IA = shift ∧ (entry1398 i).ID = S (237 + i.val + 1) ∧
      (entry1398 i).IC = S 110 ∧ (entry1398 i).Inext = T 109 (237 + i.val + 1) ∧
      (entry1398 i).Icur = T 109 (237 + i.val) ∧
      (entry1398 i).output = T 110 (237 + i.val) ∧
      (entry1398 i).charge = charge 109 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1414_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1398 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 110) (T 109 (237 + i.val + 1))
      (T 109 (237 + i.val)) (T 110 (237 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1398.entries OriginalRow227TriangleForward1398.checked
    ⟨i.val, by rw [size1398]; exact i.isLt⟩
  change (entry1398 i).check = true at h
  rcases fields1398 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1399 : OriginalRow227TriangleForward1399.entries.size = 32 := rfl

def entry1399 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1399.entries[i.val]'(by rw [size1399]; exact i.isLt)

theorem fields1399 (i : Fin 32) :
    (entry1399 i).IA = shift ∧ (entry1399 i).ID = S (269 + i.val + 1) ∧
      (entry1399 i).IC = S 110 ∧ (entry1399 i).Inext = T 109 (269 + i.val + 1) ∧
      (entry1399 i).Icur = T 109 (269 + i.val) ∧
      (entry1399 i).output = T 110 (269 + i.val) ∧
      (entry1399 i).charge = charge 109 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1415_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1399 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 110) (T 109 (269 + i.val + 1))
      (T 109 (269 + i.val)) (T 110 (269 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1399.entries OriginalRow227TriangleForward1399.checked
    ⟨i.val, by rw [size1399]; exact i.isLt⟩
  change (entry1399 i).check = true at h
  rcases fields1399 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1400 : OriginalRow227TriangleForward1400.entries.size = 32 := rfl

def entry1400 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1400.entries[i.val]'(by rw [size1400]; exact i.isLt)

theorem fields1400 (i : Fin 32) :
    (entry1400 i).IA = shift ∧ (entry1400 i).ID = S (301 + i.val + 1) ∧
      (entry1400 i).IC = S 110 ∧ (entry1400 i).Inext = T 109 (301 + i.val + 1) ∧
      (entry1400 i).Icur = T 109 (301 + i.val) ∧
      (entry1400 i).output = T 110 (301 + i.val) ∧
      (entry1400 i).charge = charge 109 (301 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1416_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1400 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (301 + i.val)) shift
      (S (301 + i.val + 1)) (S 110) (T 109 (301 + i.val + 1))
      (T 109 (301 + i.val)) (T 110 (301 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1400.entries OriginalRow227TriangleForward1400.checked
    ⟨i.val, by rw [size1400]; exact i.isLt⟩
  change (entry1400 i).check = true at h
  rcases fields1400 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1401 : OriginalRow227TriangleForward1401.entries.size = 32 := rfl

def entry1401 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1401.entries[i.val]'(by rw [size1401]; exact i.isLt)

theorem fields1401 (i : Fin 32) :
    (entry1401 i).IA = shift ∧ (entry1401 i).ID = S (333 + i.val + 1) ∧
      (entry1401 i).IC = S 110 ∧ (entry1401 i).Inext = T 109 (333 + i.val + 1) ∧
      (entry1401 i).Icur = T 109 (333 + i.val) ∧
      (entry1401 i).output = T 110 (333 + i.val) ∧
      (entry1401 i).charge = charge 109 (333 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1417_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1401 (i : Fin 32) :
    forwardStepOK (-768) (charge 109 (333 + i.val)) shift
      (S (333 + i.val + 1)) (S 110) (T 109 (333 + i.val + 1))
      (T 109 (333 + i.val)) (T 110 (333 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1401.entries OriginalRow227TriangleForward1401.checked
    ⟨i.val, by rw [size1401]; exact i.isLt⟩
  change (entry1401 i).check = true at h
  rcases fields1401 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1402 : OriginalRow227TriangleForward1402.entries.size = 27 := rfl

def entry1402 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1402.entries[i.val]'(by rw [size1402]; exact i.isLt)

theorem fields1402 (i : Fin 27) :
    (entry1402 i).IA = shift ∧ (entry1402 i).ID = S (365 + i.val + 1) ∧
      (entry1402 i).IC = S 110 ∧ (entry1402 i).Inext = T 109 (365 + i.val + 1) ∧
      (entry1402 i).Icur = T 109 (365 + i.val) ∧
      (entry1402 i).output = T 110 (365 + i.val) ∧
      (entry1402 i).charge = charge 109 (365 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root110).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow110.block1418_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1402 (i : Fin 27) :
    forwardStepOK (-768) (charge 109 (365 + i.val)) shift
      (S (365 + i.val + 1)) (S 110) (T 109 (365 + i.val + 1))
      (T 109 (365 + i.val)) (T 110 (365 + i.val))
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1402.entries OriginalRow227TriangleForward1402.checked
    ⟨i.val, by rw [size1402]; exact i.isLt⟩
  change (entry1402 i).check = true at h
  rcases fields1402 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 109 ≤ d) (hhi : d < 392) :
    forwardStepOK (-768) (charge 109 d) shift (S (d + 1)) (S 110)
      (T 109 (d + 1)) (T 109 d) (T 110 d)
      (OriginalRow227Roots.root_pos 110 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 109 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    by_cases h173 : d < 173
    ·
      by_cases h141 : d < 141
      ·
        have hi : d - 109 < 32 := by omega
        have heq : 109 + (d - 109) = d := by omega
        simpa only [heq] using step1394 ⟨d - 109, hi⟩
      ·
        have hi : d - 141 < 32 := by omega
        have heq : 141 + (d - 141) = d := by omega
        simpa only [heq] using step1395 ⟨d - 141, hi⟩
    ·
      by_cases h205 : d < 205
      ·
        have hi : d - 173 < 32 := by omega
        have heq : 173 + (d - 173) = d := by omega
        simpa only [heq] using step1396 ⟨d - 173, hi⟩
      ·
        have hi : d - 205 < 32 := by omega
        have heq : 205 + (d - 205) = d := by omega
        simpa only [heq] using step1397 ⟨d - 205, hi⟩
  ·
    by_cases h301 : d < 301
    ·
      by_cases h269 : d < 269
      ·
        have hi : d - 237 < 32 := by omega
        have heq : 237 + (d - 237) = d := by omega
        simpa only [heq] using step1398 ⟨d - 237, hi⟩
      ·
        have hi : d - 269 < 32 := by omega
        have heq : 269 + (d - 269) = d := by omega
        simpa only [heq] using step1399 ⟨d - 269, hi⟩
    ·
      by_cases h333 : d < 333
      ·
        have hi : d - 301 < 32 := by omega
        have heq : 301 + (d - 301) = d := by omega
        simpa only [heq] using step1400 ⟨d - 301, hi⟩
      ·
        by_cases h365 : d < 365
        ·
          have hi : d - 333 < 32 := by omega
          have heq : 333 + (d - 333) = d := by omega
          simpa only [heq] using step1401 ⟨d - 333, hi⟩
        ·
          have hi : d - 365 < 27 := by omega
          have heq : 365 + (d - 365) = d := by omega
          simpa only [heq] using step1402 ⟨d - 365, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1394,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1394,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1395,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1395,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1396,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1396,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1397,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1397,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1398,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1398,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1399,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1399,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1400,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1400,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1401,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1401,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.fields1402,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.step1402,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow110
