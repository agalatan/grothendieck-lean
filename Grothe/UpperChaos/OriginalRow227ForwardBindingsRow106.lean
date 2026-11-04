import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow106
import Grothe.UpperChaos.OriginalRow227TriangleForward1356
import Grothe.UpperChaos.OriginalRow227TriangleForward1357
import Grothe.UpperChaos.OriginalRow227TriangleForward1358
import Grothe.UpperChaos.OriginalRow227TriangleForward1359
import Grothe.UpperChaos.OriginalRow227TriangleForward1360
import Grothe.UpperChaos.OriginalRow227TriangleForward1361
import Grothe.UpperChaos.OriginalRow227TriangleForward1362
import Grothe.UpperChaos.OriginalRow227TriangleForward1363
import Grothe.UpperChaos.OriginalRow227TriangleForward1364
import Grothe.UpperChaos.OriginalRow227TriangleForward1365

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1356 : OriginalRow227TriangleForward1356.entries.size = 32 := rfl

def entry1356 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1356.entries[i.val]'(by rw [size1356]; exact i.isLt)

theorem fields1356 (i : Fin 32) :
    (entry1356 i).IA = shift ∧ (entry1356 i).ID = S (105 + i.val + 1) ∧
      (entry1356 i).IC = S 106 ∧ (entry1356 i).Inext = T 105 (105 + i.val + 1) ∧
      (entry1356 i).Icur = T 105 (105 + i.val) ∧
      (entry1356 i).output = T 106 (105 + i.val) ∧
      (entry1356 i).charge = charge 105 (105 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1372_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1356 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (105 + i.val)) shift
      (S (105 + i.val + 1)) (S 106) (T 105 (105 + i.val + 1))
      (T 105 (105 + i.val)) (T 106 (105 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1356.entries OriginalRow227TriangleForward1356.checked
    ⟨i.val, by rw [size1356]; exact i.isLt⟩
  change (entry1356 i).check = true at h
  rcases fields1356 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1357 : OriginalRow227TriangleForward1357.entries.size = 32 := rfl

def entry1357 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1357.entries[i.val]'(by rw [size1357]; exact i.isLt)

theorem fields1357 (i : Fin 32) :
    (entry1357 i).IA = shift ∧ (entry1357 i).ID = S (137 + i.val + 1) ∧
      (entry1357 i).IC = S 106 ∧ (entry1357 i).Inext = T 105 (137 + i.val + 1) ∧
      (entry1357 i).Icur = T 105 (137 + i.val) ∧
      (entry1357 i).output = T 106 (137 + i.val) ∧
      (entry1357 i).charge = charge 105 (137 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1373_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1357 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (137 + i.val)) shift
      (S (137 + i.val + 1)) (S 106) (T 105 (137 + i.val + 1))
      (T 105 (137 + i.val)) (T 106 (137 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1357.entries OriginalRow227TriangleForward1357.checked
    ⟨i.val, by rw [size1357]; exact i.isLt⟩
  change (entry1357 i).check = true at h
  rcases fields1357 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1358 : OriginalRow227TriangleForward1358.entries.size = 32 := rfl

def entry1358 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1358.entries[i.val]'(by rw [size1358]; exact i.isLt)

theorem fields1358 (i : Fin 32) :
    (entry1358 i).IA = shift ∧ (entry1358 i).ID = S (169 + i.val + 1) ∧
      (entry1358 i).IC = S 106 ∧ (entry1358 i).Inext = T 105 (169 + i.val + 1) ∧
      (entry1358 i).Icur = T 105 (169 + i.val) ∧
      (entry1358 i).output = T 106 (169 + i.val) ∧
      (entry1358 i).charge = charge 105 (169 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1374_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1358 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (169 + i.val)) shift
      (S (169 + i.val + 1)) (S 106) (T 105 (169 + i.val + 1))
      (T 105 (169 + i.val)) (T 106 (169 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1358.entries OriginalRow227TriangleForward1358.checked
    ⟨i.val, by rw [size1358]; exact i.isLt⟩
  change (entry1358 i).check = true at h
  rcases fields1358 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1359 : OriginalRow227TriangleForward1359.entries.size = 32 := rfl

def entry1359 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1359.entries[i.val]'(by rw [size1359]; exact i.isLt)

theorem fields1359 (i : Fin 32) :
    (entry1359 i).IA = shift ∧ (entry1359 i).ID = S (201 + i.val + 1) ∧
      (entry1359 i).IC = S 106 ∧ (entry1359 i).Inext = T 105 (201 + i.val + 1) ∧
      (entry1359 i).Icur = T 105 (201 + i.val) ∧
      (entry1359 i).output = T 106 (201 + i.val) ∧
      (entry1359 i).charge = charge 105 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1375_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1359 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 106) (T 105 (201 + i.val + 1))
      (T 105 (201 + i.val)) (T 106 (201 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1359.entries OriginalRow227TriangleForward1359.checked
    ⟨i.val, by rw [size1359]; exact i.isLt⟩
  change (entry1359 i).check = true at h
  rcases fields1359 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1360 : OriginalRow227TriangleForward1360.entries.size = 32 := rfl

def entry1360 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1360.entries[i.val]'(by rw [size1360]; exact i.isLt)

theorem fields1360 (i : Fin 32) :
    (entry1360 i).IA = shift ∧ (entry1360 i).ID = S (233 + i.val + 1) ∧
      (entry1360 i).IC = S 106 ∧ (entry1360 i).Inext = T 105 (233 + i.val + 1) ∧
      (entry1360 i).Icur = T 105 (233 + i.val) ∧
      (entry1360 i).output = T 106 (233 + i.val) ∧
      (entry1360 i).charge = charge 105 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1376_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1360 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 106) (T 105 (233 + i.val + 1))
      (T 105 (233 + i.val)) (T 106 (233 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1360.entries OriginalRow227TriangleForward1360.checked
    ⟨i.val, by rw [size1360]; exact i.isLt⟩
  change (entry1360 i).check = true at h
  rcases fields1360 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1361 : OriginalRow227TriangleForward1361.entries.size = 32 := rfl

def entry1361 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1361.entries[i.val]'(by rw [size1361]; exact i.isLt)

theorem fields1361 (i : Fin 32) :
    (entry1361 i).IA = shift ∧ (entry1361 i).ID = S (265 + i.val + 1) ∧
      (entry1361 i).IC = S 106 ∧ (entry1361 i).Inext = T 105 (265 + i.val + 1) ∧
      (entry1361 i).Icur = T 105 (265 + i.val) ∧
      (entry1361 i).output = T 106 (265 + i.val) ∧
      (entry1361 i).charge = charge 105 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1377_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1361 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 106) (T 105 (265 + i.val + 1))
      (T 105 (265 + i.val)) (T 106 (265 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1361.entries OriginalRow227TriangleForward1361.checked
    ⟨i.val, by rw [size1361]; exact i.isLt⟩
  change (entry1361 i).check = true at h
  rcases fields1361 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1362 : OriginalRow227TriangleForward1362.entries.size = 32 := rfl

def entry1362 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1362.entries[i.val]'(by rw [size1362]; exact i.isLt)

theorem fields1362 (i : Fin 32) :
    (entry1362 i).IA = shift ∧ (entry1362 i).ID = S (297 + i.val + 1) ∧
      (entry1362 i).IC = S 106 ∧ (entry1362 i).Inext = T 105 (297 + i.val + 1) ∧
      (entry1362 i).Icur = T 105 (297 + i.val) ∧
      (entry1362 i).output = T 106 (297 + i.val) ∧
      (entry1362 i).charge = charge 105 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1378_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1362 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 106) (T 105 (297 + i.val + 1))
      (T 105 (297 + i.val)) (T 106 (297 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1362.entries OriginalRow227TriangleForward1362.checked
    ⟨i.val, by rw [size1362]; exact i.isLt⟩
  change (entry1362 i).check = true at h
  rcases fields1362 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1363 : OriginalRow227TriangleForward1363.entries.size = 32 := rfl

def entry1363 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1363.entries[i.val]'(by rw [size1363]; exact i.isLt)

theorem fields1363 (i : Fin 32) :
    (entry1363 i).IA = shift ∧ (entry1363 i).ID = S (329 + i.val + 1) ∧
      (entry1363 i).IC = S 106 ∧ (entry1363 i).Inext = T 105 (329 + i.val + 1) ∧
      (entry1363 i).Icur = T 105 (329 + i.val) ∧
      (entry1363 i).output = T 106 (329 + i.val) ∧
      (entry1363 i).charge = charge 105 (329 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1379_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1363 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (329 + i.val)) shift
      (S (329 + i.val + 1)) (S 106) (T 105 (329 + i.val + 1))
      (T 105 (329 + i.val)) (T 106 (329 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1363.entries OriginalRow227TriangleForward1363.checked
    ⟨i.val, by rw [size1363]; exact i.isLt⟩
  change (entry1363 i).check = true at h
  rcases fields1363 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1364 : OriginalRow227TriangleForward1364.entries.size = 32 := rfl

def entry1364 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1364.entries[i.val]'(by rw [size1364]; exact i.isLt)

theorem fields1364 (i : Fin 32) :
    (entry1364 i).IA = shift ∧ (entry1364 i).ID = S (361 + i.val + 1) ∧
      (entry1364 i).IC = S 106 ∧ (entry1364 i).Inext = T 105 (361 + i.val + 1) ∧
      (entry1364 i).Icur = T 105 (361 + i.val) ∧
      (entry1364 i).output = T 106 (361 + i.val) ∧
      (entry1364 i).charge = charge 105 (361 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1380_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1364 (i : Fin 32) :
    forwardStepOK (-768) (charge 105 (361 + i.val)) shift
      (S (361 + i.val + 1)) (S 106) (T 105 (361 + i.val + 1))
      (T 105 (361 + i.val)) (T 106 (361 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1364.entries OriginalRow227TriangleForward1364.checked
    ⟨i.val, by rw [size1364]; exact i.isLt⟩
  change (entry1364 i).check = true at h
  rcases fields1364 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1365 : OriginalRow227TriangleForward1365.entries.size = 3 := rfl

def entry1365 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1365.entries[i.val]'(by rw [size1365]; exact i.isLt)

theorem fields1365 (i : Fin 3) :
    (entry1365 i).IA = shift ∧ (entry1365 i).ID = S (393 + i.val + 1) ∧
      (entry1365 i).IC = S 106 ∧ (entry1365 i).Inext = T 105 (393 + i.val + 1) ∧
      (entry1365 i).Icur = T 105 (393 + i.val) ∧
      (entry1365 i).output = T 106 (393 + i.val) ∧
      (entry1365 i).charge = charge 105 (393 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root106).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow106.block1381_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1365 (i : Fin 3) :
    forwardStepOK (-768) (charge 105 (393 + i.val)) shift
      (S (393 + i.val + 1)) (S 106) (T 105 (393 + i.val + 1))
      (T 105 (393 + i.val)) (T 106 (393 + i.val))
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1365.entries OriginalRow227TriangleForward1365.checked
    ⟨i.val, by rw [size1365]; exact i.isLt⟩
  change (entry1365 i).check = true at h
  rcases fields1365 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 105 ≤ d) (hhi : d < 396) :
    forwardStepOK (-768) (charge 105 d) shift (S (d + 1)) (S 106)
      (T 105 (d + 1)) (T 105 d) (T 106 d)
      (OriginalRow227Roots.root_pos 106 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 105 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h169 : d < 169
    ·
      by_cases h137 : d < 137
      ·
        have hi : d - 105 < 32 := by omega
        have heq : 105 + (d - 105) = d := by omega
        simpa only [heq] using step1356 ⟨d - 105, hi⟩
      ·
        have hi : d - 137 < 32 := by omega
        have heq : 137 + (d - 137) = d := by omega
        simpa only [heq] using step1357 ⟨d - 137, hi⟩
    ·
      by_cases h201 : d < 201
      ·
        have hi : d - 169 < 32 := by omega
        have heq : 169 + (d - 169) = d := by omega
        simpa only [heq] using step1358 ⟨d - 169, hi⟩
      ·
        by_cases h233 : d < 233
        ·
          have hi : d - 201 < 32 := by omega
          have heq : 201 + (d - 201) = d := by omega
          simpa only [heq] using step1359 ⟨d - 201, hi⟩
        ·
          have hi : d - 233 < 32 := by omega
          have heq : 233 + (d - 233) = d := by omega
          simpa only [heq] using step1360 ⟨d - 233, hi⟩
  ·
    by_cases h329 : d < 329
    ·
      by_cases h297 : d < 297
      ·
        have hi : d - 265 < 32 := by omega
        have heq : 265 + (d - 265) = d := by omega
        simpa only [heq] using step1361 ⟨d - 265, hi⟩
      ·
        have hi : d - 297 < 32 := by omega
        have heq : 297 + (d - 297) = d := by omega
        simpa only [heq] using step1362 ⟨d - 297, hi⟩
    ·
      by_cases h361 : d < 361
      ·
        have hi : d - 329 < 32 := by omega
        have heq : 329 + (d - 329) = d := by omega
        simpa only [heq] using step1363 ⟨d - 329, hi⟩
      ·
        by_cases h393 : d < 393
        ·
          have hi : d - 361 < 32 := by omega
          have heq : 361 + (d - 361) = d := by omega
          simpa only [heq] using step1364 ⟨d - 361, hi⟩
        ·
          have hi : d - 393 < 3 := by omega
          have heq : 393 + (d - 393) = d := by omega
          simpa only [heq] using step1365 ⟨d - 393, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1356,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1356,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1357,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1357,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1358,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1358,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1359,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1359,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1360,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1360,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1361,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1361,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1362,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1362,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1363,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1363,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1364,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1364,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.fields1365,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.step1365,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow106
