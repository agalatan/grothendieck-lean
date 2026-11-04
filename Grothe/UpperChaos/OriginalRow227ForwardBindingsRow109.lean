import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow108
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow109
import Grothe.UpperChaos.OriginalRow227TriangleForward1385
import Grothe.UpperChaos.OriginalRow227TriangleForward1386
import Grothe.UpperChaos.OriginalRow227TriangleForward1387
import Grothe.UpperChaos.OriginalRow227TriangleForward1388
import Grothe.UpperChaos.OriginalRow227TriangleForward1389
import Grothe.UpperChaos.OriginalRow227TriangleForward1390
import Grothe.UpperChaos.OriginalRow227TriangleForward1391
import Grothe.UpperChaos.OriginalRow227TriangleForward1392
import Grothe.UpperChaos.OriginalRow227TriangleForward1393

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1385 : OriginalRow227TriangleForward1385.entries.size = 32 := rfl

def entry1385 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1385.entries[i.val]'(by rw [size1385]; exact i.isLt)

theorem fields1385 (i : Fin 32) :
    (entry1385 i).IA = shift ∧ (entry1385 i).ID = S (108 + i.val + 1) ∧
      (entry1385 i).IC = S 109 ∧ (entry1385 i).Inext = T 108 (108 + i.val + 1) ∧
      (entry1385 i).Icur = T 108 (108 + i.val) ∧
      (entry1385 i).output = T 109 (108 + i.val) ∧
      (entry1385 i).charge = charge 108 (108 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1392_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1401_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1385 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (108 + i.val)) shift
      (S (108 + i.val + 1)) (S 109) (T 108 (108 + i.val + 1))
      (T 108 (108 + i.val)) (T 109 (108 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1385.entries OriginalRow227TriangleForward1385.checked
    ⟨i.val, by rw [size1385]; exact i.isLt⟩
  change (entry1385 i).check = true at h
  rcases fields1385 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1386 : OriginalRow227TriangleForward1386.entries.size = 32 := rfl

def entry1386 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1386.entries[i.val]'(by rw [size1386]; exact i.isLt)

theorem fields1386 (i : Fin 32) :
    (entry1386 i).IA = shift ∧ (entry1386 i).ID = S (140 + i.val + 1) ∧
      (entry1386 i).IC = S 109 ∧ (entry1386 i).Inext = T 108 (140 + i.val + 1) ∧
      (entry1386 i).Icur = T 108 (140 + i.val) ∧
      (entry1386 i).output = T 109 (140 + i.val) ∧
      (entry1386 i).charge = charge 108 (140 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1393_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1402_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1386 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (140 + i.val)) shift
      (S (140 + i.val + 1)) (S 109) (T 108 (140 + i.val + 1))
      (T 108 (140 + i.val)) (T 109 (140 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1386.entries OriginalRow227TriangleForward1386.checked
    ⟨i.val, by rw [size1386]; exact i.isLt⟩
  change (entry1386 i).check = true at h
  rcases fields1386 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1387 : OriginalRow227TriangleForward1387.entries.size = 32 := rfl

def entry1387 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1387.entries[i.val]'(by rw [size1387]; exact i.isLt)

theorem fields1387 (i : Fin 32) :
    (entry1387 i).IA = shift ∧ (entry1387 i).ID = S (172 + i.val + 1) ∧
      (entry1387 i).IC = S 109 ∧ (entry1387 i).Inext = T 108 (172 + i.val + 1) ∧
      (entry1387 i).Icur = T 108 (172 + i.val) ∧
      (entry1387 i).output = T 109 (172 + i.val) ∧
      (entry1387 i).charge = charge 108 (172 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1394_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1403_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1387 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (172 + i.val)) shift
      (S (172 + i.val + 1)) (S 109) (T 108 (172 + i.val + 1))
      (T 108 (172 + i.val)) (T 109 (172 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1387.entries OriginalRow227TriangleForward1387.checked
    ⟨i.val, by rw [size1387]; exact i.isLt⟩
  change (entry1387 i).check = true at h
  rcases fields1387 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1388 : OriginalRow227TriangleForward1388.entries.size = 32 := rfl

def entry1388 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1388.entries[i.val]'(by rw [size1388]; exact i.isLt)

theorem fields1388 (i : Fin 32) :
    (entry1388 i).IA = shift ∧ (entry1388 i).ID = S (204 + i.val + 1) ∧
      (entry1388 i).IC = S 109 ∧ (entry1388 i).Inext = T 108 (204 + i.val + 1) ∧
      (entry1388 i).Icur = T 108 (204 + i.val) ∧
      (entry1388 i).output = T 109 (204 + i.val) ∧
      (entry1388 i).charge = charge 108 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1395_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1404_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1388 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 109) (T 108 (204 + i.val + 1))
      (T 108 (204 + i.val)) (T 109 (204 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1388.entries OriginalRow227TriangleForward1388.checked
    ⟨i.val, by rw [size1388]; exact i.isLt⟩
  change (entry1388 i).check = true at h
  rcases fields1388 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1389 : OriginalRow227TriangleForward1389.entries.size = 32 := rfl

def entry1389 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1389.entries[i.val]'(by rw [size1389]; exact i.isLt)

theorem fields1389 (i : Fin 32) :
    (entry1389 i).IA = shift ∧ (entry1389 i).ID = S (236 + i.val + 1) ∧
      (entry1389 i).IC = S 109 ∧ (entry1389 i).Inext = T 108 (236 + i.val + 1) ∧
      (entry1389 i).Icur = T 108 (236 + i.val) ∧
      (entry1389 i).output = T 109 (236 + i.val) ∧
      (entry1389 i).charge = charge 108 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1396_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1405_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1389 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 109) (T 108 (236 + i.val + 1))
      (T 108 (236 + i.val)) (T 109 (236 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1389.entries OriginalRow227TriangleForward1389.checked
    ⟨i.val, by rw [size1389]; exact i.isLt⟩
  change (entry1389 i).check = true at h
  rcases fields1389 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1390 : OriginalRow227TriangleForward1390.entries.size = 32 := rfl

def entry1390 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1390.entries[i.val]'(by rw [size1390]; exact i.isLt)

theorem fields1390 (i : Fin 32) :
    (entry1390 i).IA = shift ∧ (entry1390 i).ID = S (268 + i.val + 1) ∧
      (entry1390 i).IC = S 109 ∧ (entry1390 i).Inext = T 108 (268 + i.val + 1) ∧
      (entry1390 i).Icur = T 108 (268 + i.val) ∧
      (entry1390 i).output = T 109 (268 + i.val) ∧
      (entry1390 i).charge = charge 108 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1397_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1406_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1390 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 109) (T 108 (268 + i.val + 1))
      (T 108 (268 + i.val)) (T 109 (268 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1390.entries OriginalRow227TriangleForward1390.checked
    ⟨i.val, by rw [size1390]; exact i.isLt⟩
  change (entry1390 i).check = true at h
  rcases fields1390 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1391 : OriginalRow227TriangleForward1391.entries.size = 32 := rfl

def entry1391 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1391.entries[i.val]'(by rw [size1391]; exact i.isLt)

theorem fields1391 (i : Fin 32) :
    (entry1391 i).IA = shift ∧ (entry1391 i).ID = S (300 + i.val + 1) ∧
      (entry1391 i).IC = S 109 ∧ (entry1391 i).Inext = T 108 (300 + i.val + 1) ∧
      (entry1391 i).Icur = T 108 (300 + i.val) ∧
      (entry1391 i).output = T 109 (300 + i.val) ∧
      (entry1391 i).charge = charge 108 (300 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1398_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1407_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1391 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (300 + i.val)) shift
      (S (300 + i.val + 1)) (S 109) (T 108 (300 + i.val + 1))
      (T 108 (300 + i.val)) (T 109 (300 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1391.entries OriginalRow227TriangleForward1391.checked
    ⟨i.val, by rw [size1391]; exact i.isLt⟩
  change (entry1391 i).check = true at h
  rcases fields1391 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1392 : OriginalRow227TriangleForward1392.entries.size = 32 := rfl

def entry1392 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1392.entries[i.val]'(by rw [size1392]; exact i.isLt)

theorem fields1392 (i : Fin 32) :
    (entry1392 i).IA = shift ∧ (entry1392 i).ID = S (332 + i.val + 1) ∧
      (entry1392 i).IC = S 109 ∧ (entry1392 i).Inext = T 108 (332 + i.val + 1) ∧
      (entry1392 i).Icur = T 108 (332 + i.val) ∧
      (entry1392 i).output = T 109 (332 + i.val) ∧
      (entry1392 i).charge = charge 108 (332 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1399_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1408_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1392 (i : Fin 32) :
    forwardStepOK (-768) (charge 108 (332 + i.val)) shift
      (S (332 + i.val + 1)) (S 109) (T 108 (332 + i.val + 1))
      (T 108 (332 + i.val)) (T 109 (332 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1392.entries OriginalRow227TriangleForward1392.checked
    ⟨i.val, by rw [size1392]; exact i.isLt⟩
  change (entry1392 i).check = true at h
  rcases fields1392 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1393 : OriginalRow227TriangleForward1393.entries.size = 29 := rfl

def entry1393 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1393.entries[i.val]'(by rw [size1393]; exact i.isLt)

theorem fields1393 (i : Fin 29) :
    (entry1393 i).IA = shift ∧ (entry1393 i).ID = S (364 + i.val + 1) ∧
      (entry1393 i).IC = S 109 ∧ (entry1393 i).Inext = T 108 (364 + i.val + 1) ∧
      (entry1393 i).Icur = T 108 (364 + i.val) ∧
      (entry1393 i).output = T 109 (364 + i.val) ∧
      (entry1393 i).charge = charge 108 (364 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root109).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow108.block1400_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow109.block1409_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1393 (i : Fin 29) :
    forwardStepOK (-768) (charge 108 (364 + i.val)) shift
      (S (364 + i.val + 1)) (S 109) (T 108 (364 + i.val + 1))
      (T 108 (364 + i.val)) (T 109 (364 + i.val))
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1393.entries OriginalRow227TriangleForward1393.checked
    ⟨i.val, by rw [size1393]; exact i.isLt⟩
  change (entry1393 i).check = true at h
  rcases fields1393 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 108 ≤ d) (hhi : d < 393) :
    forwardStepOK (-768) (charge 108 d) shift (S (d + 1)) (S 109)
      (T 108 (d + 1)) (T 108 d) (T 109 d)
      (OriginalRow227Roots.root_pos 109 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 108 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    by_cases h172 : d < 172
    ·
      by_cases h140 : d < 140
      ·
        have hi : d - 108 < 32 := by omega
        have heq : 108 + (d - 108) = d := by omega
        simpa only [heq] using step1385 ⟨d - 108, hi⟩
      ·
        have hi : d - 140 < 32 := by omega
        have heq : 140 + (d - 140) = d := by omega
        simpa only [heq] using step1386 ⟨d - 140, hi⟩
    ·
      by_cases h204 : d < 204
      ·
        have hi : d - 172 < 32 := by omega
        have heq : 172 + (d - 172) = d := by omega
        simpa only [heq] using step1387 ⟨d - 172, hi⟩
      ·
        have hi : d - 204 < 32 := by omega
        have heq : 204 + (d - 204) = d := by omega
        simpa only [heq] using step1388 ⟨d - 204, hi⟩
  ·
    by_cases h300 : d < 300
    ·
      by_cases h268 : d < 268
      ·
        have hi : d - 236 < 32 := by omega
        have heq : 236 + (d - 236) = d := by omega
        simpa only [heq] using step1389 ⟨d - 236, hi⟩
      ·
        have hi : d - 268 < 32 := by omega
        have heq : 268 + (d - 268) = d := by omega
        simpa only [heq] using step1390 ⟨d - 268, hi⟩
    ·
      by_cases h332 : d < 332
      ·
        have hi : d - 300 < 32 := by omega
        have heq : 300 + (d - 300) = d := by omega
        simpa only [heq] using step1391 ⟨d - 300, hi⟩
      ·
        by_cases h364 : d < 364
        ·
          have hi : d - 332 < 32 := by omega
          have heq : 332 + (d - 332) = d := by omega
          simpa only [heq] using step1392 ⟨d - 332, hi⟩
        ·
          have hi : d - 364 < 29 := by omega
          have heq : 364 + (d - 364) = d := by omega
          simpa only [heq] using step1393 ⟨d - 364, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1385,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1385,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1386,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1386,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1387,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1387,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1388,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1388,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1389,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1389,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1390,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1390,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1391,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1391,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1392,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1392,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.fields1393,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.step1393,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow109
