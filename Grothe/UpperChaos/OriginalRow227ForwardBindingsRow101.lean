import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow100
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow101
import Grothe.UpperChaos.OriginalRow227TriangleForward1306
import Grothe.UpperChaos.OriginalRow227TriangleForward1307
import Grothe.UpperChaos.OriginalRow227TriangleForward1308
import Grothe.UpperChaos.OriginalRow227TriangleForward1309
import Grothe.UpperChaos.OriginalRow227TriangleForward1310
import Grothe.UpperChaos.OriginalRow227TriangleForward1311
import Grothe.UpperChaos.OriginalRow227TriangleForward1312
import Grothe.UpperChaos.OriginalRow227TriangleForward1313
import Grothe.UpperChaos.OriginalRow227TriangleForward1314
import Grothe.UpperChaos.OriginalRow227TriangleForward1315

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1306 : OriginalRow227TriangleForward1306.entries.size = 32 := rfl

def entry1306 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1306.entries[i.val]'(by rw [size1306]; exact i.isLt)

theorem fields1306 (i : Fin 32) :
    (entry1306 i).IA = shift ∧ (entry1306 i).ID = S (100 + i.val + 1) ∧
      (entry1306 i).IC = S 101 ∧ (entry1306 i).Inext = T 100 (100 + i.val + 1) ∧
      (entry1306 i).Icur = T 100 (100 + i.val) ∧
      (entry1306 i).output = T 101 (100 + i.val) ∧
      (entry1306 i).charge = charge 100 (100 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1312_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1322_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1306 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (100 + i.val)) shift
      (S (100 + i.val + 1)) (S 101) (T 100 (100 + i.val + 1))
      (T 100 (100 + i.val)) (T 101 (100 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1306.entries OriginalRow227TriangleForward1306.checked
    ⟨i.val, by rw [size1306]; exact i.isLt⟩
  change (entry1306 i).check = true at h
  rcases fields1306 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1307 : OriginalRow227TriangleForward1307.entries.size = 32 := rfl

def entry1307 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1307.entries[i.val]'(by rw [size1307]; exact i.isLt)

theorem fields1307 (i : Fin 32) :
    (entry1307 i).IA = shift ∧ (entry1307 i).ID = S (132 + i.val + 1) ∧
      (entry1307 i).IC = S 101 ∧ (entry1307 i).Inext = T 100 (132 + i.val + 1) ∧
      (entry1307 i).Icur = T 100 (132 + i.val) ∧
      (entry1307 i).output = T 101 (132 + i.val) ∧
      (entry1307 i).charge = charge 100 (132 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1313_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1323_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1307 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (132 + i.val)) shift
      (S (132 + i.val + 1)) (S 101) (T 100 (132 + i.val + 1))
      (T 100 (132 + i.val)) (T 101 (132 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1307.entries OriginalRow227TriangleForward1307.checked
    ⟨i.val, by rw [size1307]; exact i.isLt⟩
  change (entry1307 i).check = true at h
  rcases fields1307 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1308 : OriginalRow227TriangleForward1308.entries.size = 32 := rfl

def entry1308 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1308.entries[i.val]'(by rw [size1308]; exact i.isLt)

theorem fields1308 (i : Fin 32) :
    (entry1308 i).IA = shift ∧ (entry1308 i).ID = S (164 + i.val + 1) ∧
      (entry1308 i).IC = S 101 ∧ (entry1308 i).Inext = T 100 (164 + i.val + 1) ∧
      (entry1308 i).Icur = T 100 (164 + i.val) ∧
      (entry1308 i).output = T 101 (164 + i.val) ∧
      (entry1308 i).charge = charge 100 (164 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1314_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1324_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1308 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (164 + i.val)) shift
      (S (164 + i.val + 1)) (S 101) (T 100 (164 + i.val + 1))
      (T 100 (164 + i.val)) (T 101 (164 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1308.entries OriginalRow227TriangleForward1308.checked
    ⟨i.val, by rw [size1308]; exact i.isLt⟩
  change (entry1308 i).check = true at h
  rcases fields1308 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1309 : OriginalRow227TriangleForward1309.entries.size = 32 := rfl

def entry1309 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1309.entries[i.val]'(by rw [size1309]; exact i.isLt)

theorem fields1309 (i : Fin 32) :
    (entry1309 i).IA = shift ∧ (entry1309 i).ID = S (196 + i.val + 1) ∧
      (entry1309 i).IC = S 101 ∧ (entry1309 i).Inext = T 100 (196 + i.val + 1) ∧
      (entry1309 i).Icur = T 100 (196 + i.val) ∧
      (entry1309 i).output = T 101 (196 + i.val) ∧
      (entry1309 i).charge = charge 100 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1315_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1325_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1309 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 101) (T 100 (196 + i.val + 1))
      (T 100 (196 + i.val)) (T 101 (196 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1309.entries OriginalRow227TriangleForward1309.checked
    ⟨i.val, by rw [size1309]; exact i.isLt⟩
  change (entry1309 i).check = true at h
  rcases fields1309 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1310 : OriginalRow227TriangleForward1310.entries.size = 32 := rfl

def entry1310 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1310.entries[i.val]'(by rw [size1310]; exact i.isLt)

theorem fields1310 (i : Fin 32) :
    (entry1310 i).IA = shift ∧ (entry1310 i).ID = S (228 + i.val + 1) ∧
      (entry1310 i).IC = S 101 ∧ (entry1310 i).Inext = T 100 (228 + i.val + 1) ∧
      (entry1310 i).Icur = T 100 (228 + i.val) ∧
      (entry1310 i).output = T 101 (228 + i.val) ∧
      (entry1310 i).charge = charge 100 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1316_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1326_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1310 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 101) (T 100 (228 + i.val + 1))
      (T 100 (228 + i.val)) (T 101 (228 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1310.entries OriginalRow227TriangleForward1310.checked
    ⟨i.val, by rw [size1310]; exact i.isLt⟩
  change (entry1310 i).check = true at h
  rcases fields1310 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1311 : OriginalRow227TriangleForward1311.entries.size = 32 := rfl

def entry1311 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1311.entries[i.val]'(by rw [size1311]; exact i.isLt)

theorem fields1311 (i : Fin 32) :
    (entry1311 i).IA = shift ∧ (entry1311 i).ID = S (260 + i.val + 1) ∧
      (entry1311 i).IC = S 101 ∧ (entry1311 i).Inext = T 100 (260 + i.val + 1) ∧
      (entry1311 i).Icur = T 100 (260 + i.val) ∧
      (entry1311 i).output = T 101 (260 + i.val) ∧
      (entry1311 i).charge = charge 100 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1317_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1327_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1311 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 101) (T 100 (260 + i.val + 1))
      (T 100 (260 + i.val)) (T 101 (260 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1311.entries OriginalRow227TriangleForward1311.checked
    ⟨i.val, by rw [size1311]; exact i.isLt⟩
  change (entry1311 i).check = true at h
  rcases fields1311 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1312 : OriginalRow227TriangleForward1312.entries.size = 32 := rfl

def entry1312 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1312.entries[i.val]'(by rw [size1312]; exact i.isLt)

theorem fields1312 (i : Fin 32) :
    (entry1312 i).IA = shift ∧ (entry1312 i).ID = S (292 + i.val + 1) ∧
      (entry1312 i).IC = S 101 ∧ (entry1312 i).Inext = T 100 (292 + i.val + 1) ∧
      (entry1312 i).Icur = T 100 (292 + i.val) ∧
      (entry1312 i).output = T 101 (292 + i.val) ∧
      (entry1312 i).charge = charge 100 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1318_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1328_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1312 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 101) (T 100 (292 + i.val + 1))
      (T 100 (292 + i.val)) (T 101 (292 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1312.entries OriginalRow227TriangleForward1312.checked
    ⟨i.val, by rw [size1312]; exact i.isLt⟩
  change (entry1312 i).check = true at h
  rcases fields1312 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1313 : OriginalRow227TriangleForward1313.entries.size = 32 := rfl

def entry1313 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1313.entries[i.val]'(by rw [size1313]; exact i.isLt)

theorem fields1313 (i : Fin 32) :
    (entry1313 i).IA = shift ∧ (entry1313 i).ID = S (324 + i.val + 1) ∧
      (entry1313 i).IC = S 101 ∧ (entry1313 i).Inext = T 100 (324 + i.val + 1) ∧
      (entry1313 i).Icur = T 100 (324 + i.val) ∧
      (entry1313 i).output = T 101 (324 + i.val) ∧
      (entry1313 i).charge = charge 100 (324 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1319_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1329_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1313 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (324 + i.val)) shift
      (S (324 + i.val + 1)) (S 101) (T 100 (324 + i.val + 1))
      (T 100 (324 + i.val)) (T 101 (324 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1313.entries OriginalRow227TriangleForward1313.checked
    ⟨i.val, by rw [size1313]; exact i.isLt⟩
  change (entry1313 i).check = true at h
  rcases fields1313 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1314 : OriginalRow227TriangleForward1314.entries.size = 32 := rfl

def entry1314 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1314.entries[i.val]'(by rw [size1314]; exact i.isLt)

theorem fields1314 (i : Fin 32) :
    (entry1314 i).IA = shift ∧ (entry1314 i).ID = S (356 + i.val + 1) ∧
      (entry1314 i).IC = S 101 ∧ (entry1314 i).Inext = T 100 (356 + i.val + 1) ∧
      (entry1314 i).Icur = T 100 (356 + i.val) ∧
      (entry1314 i).output = T 101 (356 + i.val) ∧
      (entry1314 i).charge = charge 100 (356 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1320_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1330_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1314 (i : Fin 32) :
    forwardStepOK (-768) (charge 100 (356 + i.val)) shift
      (S (356 + i.val + 1)) (S 101) (T 100 (356 + i.val + 1))
      (T 100 (356 + i.val)) (T 101 (356 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1314.entries OriginalRow227TriangleForward1314.checked
    ⟨i.val, by rw [size1314]; exact i.isLt⟩
  change (entry1314 i).check = true at h
  rcases fields1314 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1315 : OriginalRow227TriangleForward1315.entries.size = 13 := rfl

def entry1315 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1315.entries[i.val]'(by rw [size1315]; exact i.isLt)

theorem fields1315 (i : Fin 13) :
    (entry1315 i).IA = shift ∧ (entry1315 i).ID = S (388 + i.val + 1) ∧
      (entry1315 i).IC = S 101 ∧ (entry1315 i).Inext = T 100 (388 + i.val + 1) ∧
      (entry1315 i).Icur = T 100 (388 + i.val) ∧
      (entry1315 i).output = T 101 (388 + i.val) ∧
      (entry1315 i).charge = charge 100 (388 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings03.S_eq_root101).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow100.block1321_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow101.block1331_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1315 (i : Fin 13) :
    forwardStepOK (-768) (charge 100 (388 + i.val)) shift
      (S (388 + i.val + 1)) (S 101) (T 100 (388 + i.val + 1))
      (T 100 (388 + i.val)) (T 101 (388 + i.val))
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1315.entries OriginalRow227TriangleForward1315.checked
    ⟨i.val, by rw [size1315]; exact i.isLt⟩
  change (entry1315 i).check = true at h
  rcases fields1315 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 100 ≤ d) (hhi : d < 401) :
    forwardStepOK (-768) (charge 100 d) shift (S (d + 1)) (S 101)
      (T 100 (d + 1)) (T 100 d) (T 101 d)
      (OriginalRow227Roots.root_pos 101 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 100 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h164 : d < 164
    ·
      by_cases h132 : d < 132
      ·
        have hi : d - 100 < 32 := by omega
        have heq : 100 + (d - 100) = d := by omega
        simpa only [heq] using step1306 ⟨d - 100, hi⟩
      ·
        have hi : d - 132 < 32 := by omega
        have heq : 132 + (d - 132) = d := by omega
        simpa only [heq] using step1307 ⟨d - 132, hi⟩
    ·
      by_cases h196 : d < 196
      ·
        have hi : d - 164 < 32 := by omega
        have heq : 164 + (d - 164) = d := by omega
        simpa only [heq] using step1308 ⟨d - 164, hi⟩
      ·
        by_cases h228 : d < 228
        ·
          have hi : d - 196 < 32 := by omega
          have heq : 196 + (d - 196) = d := by omega
          simpa only [heq] using step1309 ⟨d - 196, hi⟩
        ·
          have hi : d - 228 < 32 := by omega
          have heq : 228 + (d - 228) = d := by omega
          simpa only [heq] using step1310 ⟨d - 228, hi⟩
  ·
    by_cases h324 : d < 324
    ·
      by_cases h292 : d < 292
      ·
        have hi : d - 260 < 32 := by omega
        have heq : 260 + (d - 260) = d := by omega
        simpa only [heq] using step1311 ⟨d - 260, hi⟩
      ·
        have hi : d - 292 < 32 := by omega
        have heq : 292 + (d - 292) = d := by omega
        simpa only [heq] using step1312 ⟨d - 292, hi⟩
    ·
      by_cases h356 : d < 356
      ·
        have hi : d - 324 < 32 := by omega
        have heq : 324 + (d - 324) = d := by omega
        simpa only [heq] using step1313 ⟨d - 324, hi⟩
      ·
        by_cases h388 : d < 388
        ·
          have hi : d - 356 < 32 := by omega
          have heq : 356 + (d - 356) = d := by omega
          simpa only [heq] using step1314 ⟨d - 356, hi⟩
        ·
          have hi : d - 388 < 13 := by omega
          have heq : 388 + (d - 388) = d := by omega
          simpa only [heq] using step1315 ⟨d - 388, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1306,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1306,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1307,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1307,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1308,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1308,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1309,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1309,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1310,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1310,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1311,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1311,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1312,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1312,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1313,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1313,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1314,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1314,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.fields1315,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.step1315,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow101
