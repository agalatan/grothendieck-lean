import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow107
import Grothe.UpperChaos.OriginalRow227TriangleForward1366
import Grothe.UpperChaos.OriginalRow227TriangleForward1367
import Grothe.UpperChaos.OriginalRow227TriangleForward1368
import Grothe.UpperChaos.OriginalRow227TriangleForward1369
import Grothe.UpperChaos.OriginalRow227TriangleForward1370
import Grothe.UpperChaos.OriginalRow227TriangleForward1371
import Grothe.UpperChaos.OriginalRow227TriangleForward1372
import Grothe.UpperChaos.OriginalRow227TriangleForward1373
import Grothe.UpperChaos.OriginalRow227TriangleForward1374
import Grothe.UpperChaos.OriginalRow227TriangleForward1375

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1366 : OriginalRow227TriangleForward1366.entries.size = 32 := rfl

def entry1366 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1366.entries[i.val]'(by rw [size1366]; exact i.isLt)

theorem fields1366 (i : Fin 32) :
    (entry1366 i).IA = shift ∧ (entry1366 i).ID = S (106 + i.val + 1) ∧
      (entry1366 i).IC = S 107 ∧ (entry1366 i).Inext = T 106 (106 + i.val + 1) ∧
      (entry1366 i).Icur = T 106 (106 + i.val) ∧
      (entry1366 i).output = T 107 (106 + i.val) ∧
      (entry1366 i).charge = charge 106 (106 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1382_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1366 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (106 + i.val)) shift
      (S (106 + i.val + 1)) (S 107) (T 106 (106 + i.val + 1))
      (T 106 (106 + i.val)) (T 107 (106 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1366.entries OriginalRow227TriangleForward1366.checked
    ⟨i.val, by rw [size1366]; exact i.isLt⟩
  change (entry1366 i).check = true at h
  rcases fields1366 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1367 : OriginalRow227TriangleForward1367.entries.size = 32 := rfl

def entry1367 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1367.entries[i.val]'(by rw [size1367]; exact i.isLt)

theorem fields1367 (i : Fin 32) :
    (entry1367 i).IA = shift ∧ (entry1367 i).ID = S (138 + i.val + 1) ∧
      (entry1367 i).IC = S 107 ∧ (entry1367 i).Inext = T 106 (138 + i.val + 1) ∧
      (entry1367 i).Icur = T 106 (138 + i.val) ∧
      (entry1367 i).output = T 107 (138 + i.val) ∧
      (entry1367 i).charge = charge 106 (138 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1383_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1367 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (138 + i.val)) shift
      (S (138 + i.val + 1)) (S 107) (T 106 (138 + i.val + 1))
      (T 106 (138 + i.val)) (T 107 (138 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1367.entries OriginalRow227TriangleForward1367.checked
    ⟨i.val, by rw [size1367]; exact i.isLt⟩
  change (entry1367 i).check = true at h
  rcases fields1367 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1368 : OriginalRow227TriangleForward1368.entries.size = 32 := rfl

def entry1368 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1368.entries[i.val]'(by rw [size1368]; exact i.isLt)

theorem fields1368 (i : Fin 32) :
    (entry1368 i).IA = shift ∧ (entry1368 i).ID = S (170 + i.val + 1) ∧
      (entry1368 i).IC = S 107 ∧ (entry1368 i).Inext = T 106 (170 + i.val + 1) ∧
      (entry1368 i).Icur = T 106 (170 + i.val) ∧
      (entry1368 i).output = T 107 (170 + i.val) ∧
      (entry1368 i).charge = charge 106 (170 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1384_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1368 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (170 + i.val)) shift
      (S (170 + i.val + 1)) (S 107) (T 106 (170 + i.val + 1))
      (T 106 (170 + i.val)) (T 107 (170 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1368.entries OriginalRow227TriangleForward1368.checked
    ⟨i.val, by rw [size1368]; exact i.isLt⟩
  change (entry1368 i).check = true at h
  rcases fields1368 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1369 : OriginalRow227TriangleForward1369.entries.size = 32 := rfl

def entry1369 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1369.entries[i.val]'(by rw [size1369]; exact i.isLt)

theorem fields1369 (i : Fin 32) :
    (entry1369 i).IA = shift ∧ (entry1369 i).ID = S (202 + i.val + 1) ∧
      (entry1369 i).IC = S 107 ∧ (entry1369 i).Inext = T 106 (202 + i.val + 1) ∧
      (entry1369 i).Icur = T 106 (202 + i.val) ∧
      (entry1369 i).output = T 107 (202 + i.val) ∧
      (entry1369 i).charge = charge 106 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1385_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1369 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 107) (T 106 (202 + i.val + 1))
      (T 106 (202 + i.val)) (T 107 (202 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1369.entries OriginalRow227TriangleForward1369.checked
    ⟨i.val, by rw [size1369]; exact i.isLt⟩
  change (entry1369 i).check = true at h
  rcases fields1369 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1370 : OriginalRow227TriangleForward1370.entries.size = 32 := rfl

def entry1370 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1370.entries[i.val]'(by rw [size1370]; exact i.isLt)

theorem fields1370 (i : Fin 32) :
    (entry1370 i).IA = shift ∧ (entry1370 i).ID = S (234 + i.val + 1) ∧
      (entry1370 i).IC = S 107 ∧ (entry1370 i).Inext = T 106 (234 + i.val + 1) ∧
      (entry1370 i).Icur = T 106 (234 + i.val) ∧
      (entry1370 i).output = T 107 (234 + i.val) ∧
      (entry1370 i).charge = charge 106 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1386_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1370 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 107) (T 106 (234 + i.val + 1))
      (T 106 (234 + i.val)) (T 107 (234 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1370.entries OriginalRow227TriangleForward1370.checked
    ⟨i.val, by rw [size1370]; exact i.isLt⟩
  change (entry1370 i).check = true at h
  rcases fields1370 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1371 : OriginalRow227TriangleForward1371.entries.size = 32 := rfl

def entry1371 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1371.entries[i.val]'(by rw [size1371]; exact i.isLt)

theorem fields1371 (i : Fin 32) :
    (entry1371 i).IA = shift ∧ (entry1371 i).ID = S (266 + i.val + 1) ∧
      (entry1371 i).IC = S 107 ∧ (entry1371 i).Inext = T 106 (266 + i.val + 1) ∧
      (entry1371 i).Icur = T 106 (266 + i.val) ∧
      (entry1371 i).output = T 107 (266 + i.val) ∧
      (entry1371 i).charge = charge 106 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1387_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1371 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 107) (T 106 (266 + i.val + 1))
      (T 106 (266 + i.val)) (T 107 (266 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1371.entries OriginalRow227TriangleForward1371.checked
    ⟨i.val, by rw [size1371]; exact i.isLt⟩
  change (entry1371 i).check = true at h
  rcases fields1371 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1372 : OriginalRow227TriangleForward1372.entries.size = 32 := rfl

def entry1372 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1372.entries[i.val]'(by rw [size1372]; exact i.isLt)

theorem fields1372 (i : Fin 32) :
    (entry1372 i).IA = shift ∧ (entry1372 i).ID = S (298 + i.val + 1) ∧
      (entry1372 i).IC = S 107 ∧ (entry1372 i).Inext = T 106 (298 + i.val + 1) ∧
      (entry1372 i).Icur = T 106 (298 + i.val) ∧
      (entry1372 i).output = T 107 (298 + i.val) ∧
      (entry1372 i).charge = charge 106 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1388_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1372 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 107) (T 106 (298 + i.val + 1))
      (T 106 (298 + i.val)) (T 107 (298 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1372.entries OriginalRow227TriangleForward1372.checked
    ⟨i.val, by rw [size1372]; exact i.isLt⟩
  change (entry1372 i).check = true at h
  rcases fields1372 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1373 : OriginalRow227TriangleForward1373.entries.size = 32 := rfl

def entry1373 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1373.entries[i.val]'(by rw [size1373]; exact i.isLt)

theorem fields1373 (i : Fin 32) :
    (entry1373 i).IA = shift ∧ (entry1373 i).ID = S (330 + i.val + 1) ∧
      (entry1373 i).IC = S 107 ∧ (entry1373 i).Inext = T 106 (330 + i.val + 1) ∧
      (entry1373 i).Icur = T 106 (330 + i.val) ∧
      (entry1373 i).output = T 107 (330 + i.val) ∧
      (entry1373 i).charge = charge 106 (330 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1389_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1373 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (330 + i.val)) shift
      (S (330 + i.val + 1)) (S 107) (T 106 (330 + i.val + 1))
      (T 106 (330 + i.val)) (T 107 (330 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1373.entries OriginalRow227TriangleForward1373.checked
    ⟨i.val, by rw [size1373]; exact i.isLt⟩
  change (entry1373 i).check = true at h
  rcases fields1373 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1374 : OriginalRow227TriangleForward1374.entries.size = 32 := rfl

def entry1374 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1374.entries[i.val]'(by rw [size1374]; exact i.isLt)

theorem fields1374 (i : Fin 32) :
    (entry1374 i).IA = shift ∧ (entry1374 i).ID = S (362 + i.val + 1) ∧
      (entry1374 i).IC = S 107 ∧ (entry1374 i).Inext = T 106 (362 + i.val + 1) ∧
      (entry1374 i).Icur = T 106 (362 + i.val) ∧
      (entry1374 i).output = T 107 (362 + i.val) ∧
      (entry1374 i).charge = charge 106 (362 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1390_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1374 (i : Fin 32) :
    forwardStepOK (-768) (charge 106 (362 + i.val)) shift
      (S (362 + i.val + 1)) (S 107) (T 106 (362 + i.val + 1))
      (T 106 (362 + i.val)) (T 107 (362 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1374.entries OriginalRow227TriangleForward1374.checked
    ⟨i.val, by rw [size1374]; exact i.isLt⟩
  change (entry1374 i).check = true at h
  rcases fields1374 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1375 : OriginalRow227TriangleForward1375.entries.size = 1 := rfl

def entry1375 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1375.entries[i.val]'(by rw [size1375]; exact i.isLt)

theorem fields1375 (i : Fin 1) :
    (entry1375 i).IA = shift ∧ (entry1375 i).ID = S (394 + i.val + 1) ∧
      (entry1375 i).IC = S 107 ∧ (entry1375 i).Inext = T 106 (394 + i.val + 1) ∧
      (entry1375 i).Icur = T 106 (394 + i.val) ∧
      (entry1375 i).output = T 107 (394 + i.val) ∧
      (entry1375 i).charge = charge 106 (394 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root107).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow107.block1391_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1375 (i : Fin 1) :
    forwardStepOK (-768) (charge 106 (394 + i.val)) shift
      (S (394 + i.val + 1)) (S 107) (T 106 (394 + i.val + 1))
      (T 106 (394 + i.val)) (T 107 (394 + i.val))
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1375.entries OriginalRow227TriangleForward1375.checked
    ⟨i.val, by rw [size1375]; exact i.isLt⟩
  change (entry1375 i).check = true at h
  rcases fields1375 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 106 ≤ d) (hhi : d < 395) :
    forwardStepOK (-768) (charge 106 d) shift (S (d + 1)) (S 107)
      (T 106 (d + 1)) (T 106 d) (T 107 d)
      (OriginalRow227Roots.root_pos 107 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 106 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h170 : d < 170
    ·
      by_cases h138 : d < 138
      ·
        have hi : d - 106 < 32 := by omega
        have heq : 106 + (d - 106) = d := by omega
        simpa only [heq] using step1366 ⟨d - 106, hi⟩
      ·
        have hi : d - 138 < 32 := by omega
        have heq : 138 + (d - 138) = d := by omega
        simpa only [heq] using step1367 ⟨d - 138, hi⟩
    ·
      by_cases h202 : d < 202
      ·
        have hi : d - 170 < 32 := by omega
        have heq : 170 + (d - 170) = d := by omega
        simpa only [heq] using step1368 ⟨d - 170, hi⟩
      ·
        by_cases h234 : d < 234
        ·
          have hi : d - 202 < 32 := by omega
          have heq : 202 + (d - 202) = d := by omega
          simpa only [heq] using step1369 ⟨d - 202, hi⟩
        ·
          have hi : d - 234 < 32 := by omega
          have heq : 234 + (d - 234) = d := by omega
          simpa only [heq] using step1370 ⟨d - 234, hi⟩
  ·
    by_cases h330 : d < 330
    ·
      by_cases h298 : d < 298
      ·
        have hi : d - 266 < 32 := by omega
        have heq : 266 + (d - 266) = d := by omega
        simpa only [heq] using step1371 ⟨d - 266, hi⟩
      ·
        have hi : d - 298 < 32 := by omega
        have heq : 298 + (d - 298) = d := by omega
        simpa only [heq] using step1372 ⟨d - 298, hi⟩
    ·
      by_cases h362 : d < 362
      ·
        have hi : d - 330 < 32 := by omega
        have heq : 330 + (d - 330) = d := by omega
        simpa only [heq] using step1373 ⟨d - 330, hi⟩
      ·
        by_cases h394 : d < 394
        ·
          have hi : d - 362 < 32 := by omega
          have heq : 362 + (d - 362) = d := by omega
          simpa only [heq] using step1374 ⟨d - 362, hi⟩
        ·
          have hi : d - 394 < 1 := by omega
          have heq : 394 + (d - 394) = d := by omega
          simpa only [heq] using step1375 ⟨d - 394, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1366,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1366,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1367,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1367,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1368,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1368,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1369,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1369,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1370,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1370,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1371,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1371,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1372,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1372,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1373,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1373,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1374,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1374,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.fields1375,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.step1375,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow107
