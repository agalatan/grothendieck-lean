import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105
import Grothe.UpperChaos.OriginalRow227TriangleForward1346
import Grothe.UpperChaos.OriginalRow227TriangleForward1347
import Grothe.UpperChaos.OriginalRow227TriangleForward1348
import Grothe.UpperChaos.OriginalRow227TriangleForward1349
import Grothe.UpperChaos.OriginalRow227TriangleForward1350
import Grothe.UpperChaos.OriginalRow227TriangleForward1351
import Grothe.UpperChaos.OriginalRow227TriangleForward1352
import Grothe.UpperChaos.OriginalRow227TriangleForward1353
import Grothe.UpperChaos.OriginalRow227TriangleForward1354
import Grothe.UpperChaos.OriginalRow227TriangleForward1355

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1346 : OriginalRow227TriangleForward1346.entries.size = 32 := rfl

def entry1346 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1346.entries[i.val]'(by rw [size1346]; exact i.isLt)

theorem fields1346 (i : Fin 32) :
    (entry1346 i).IA = shift ∧ (entry1346 i).ID = S (104 + i.val + 1) ∧
      (entry1346 i).IC = S 105 ∧ (entry1346 i).Inext = T 104 (104 + i.val + 1) ∧
      (entry1346 i).Icur = T 104 (104 + i.val) ∧
      (entry1346 i).output = T 105 (104 + i.val) ∧
      (entry1346 i).charge = charge 104 (104 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1362_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1346 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (104 + i.val)) shift
      (S (104 + i.val + 1)) (S 105) (T 104 (104 + i.val + 1))
      (T 104 (104 + i.val)) (T 105 (104 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1346.entries OriginalRow227TriangleForward1346.checked
    ⟨i.val, by rw [size1346]; exact i.isLt⟩
  change (entry1346 i).check = true at h
  rcases fields1346 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1347 : OriginalRow227TriangleForward1347.entries.size = 32 := rfl

def entry1347 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1347.entries[i.val]'(by rw [size1347]; exact i.isLt)

theorem fields1347 (i : Fin 32) :
    (entry1347 i).IA = shift ∧ (entry1347 i).ID = S (136 + i.val + 1) ∧
      (entry1347 i).IC = S 105 ∧ (entry1347 i).Inext = T 104 (136 + i.val + 1) ∧
      (entry1347 i).Icur = T 104 (136 + i.val) ∧
      (entry1347 i).output = T 105 (136 + i.val) ∧
      (entry1347 i).charge = charge 104 (136 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1363_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1347 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (136 + i.val)) shift
      (S (136 + i.val + 1)) (S 105) (T 104 (136 + i.val + 1))
      (T 104 (136 + i.val)) (T 105 (136 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1347.entries OriginalRow227TriangleForward1347.checked
    ⟨i.val, by rw [size1347]; exact i.isLt⟩
  change (entry1347 i).check = true at h
  rcases fields1347 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1348 : OriginalRow227TriangleForward1348.entries.size = 32 := rfl

def entry1348 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1348.entries[i.val]'(by rw [size1348]; exact i.isLt)

theorem fields1348 (i : Fin 32) :
    (entry1348 i).IA = shift ∧ (entry1348 i).ID = S (168 + i.val + 1) ∧
      (entry1348 i).IC = S 105 ∧ (entry1348 i).Inext = T 104 (168 + i.val + 1) ∧
      (entry1348 i).Icur = T 104 (168 + i.val) ∧
      (entry1348 i).output = T 105 (168 + i.val) ∧
      (entry1348 i).charge = charge 104 (168 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1364_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1348 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (168 + i.val)) shift
      (S (168 + i.val + 1)) (S 105) (T 104 (168 + i.val + 1))
      (T 104 (168 + i.val)) (T 105 (168 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1348.entries OriginalRow227TriangleForward1348.checked
    ⟨i.val, by rw [size1348]; exact i.isLt⟩
  change (entry1348 i).check = true at h
  rcases fields1348 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1349 : OriginalRow227TriangleForward1349.entries.size = 32 := rfl

def entry1349 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1349.entries[i.val]'(by rw [size1349]; exact i.isLt)

theorem fields1349 (i : Fin 32) :
    (entry1349 i).IA = shift ∧ (entry1349 i).ID = S (200 + i.val + 1) ∧
      (entry1349 i).IC = S 105 ∧ (entry1349 i).Inext = T 104 (200 + i.val + 1) ∧
      (entry1349 i).Icur = T 104 (200 + i.val) ∧
      (entry1349 i).output = T 105 (200 + i.val) ∧
      (entry1349 i).charge = charge 104 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1365_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1349 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 105) (T 104 (200 + i.val + 1))
      (T 104 (200 + i.val)) (T 105 (200 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1349.entries OriginalRow227TriangleForward1349.checked
    ⟨i.val, by rw [size1349]; exact i.isLt⟩
  change (entry1349 i).check = true at h
  rcases fields1349 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1350 : OriginalRow227TriangleForward1350.entries.size = 32 := rfl

def entry1350 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1350.entries[i.val]'(by rw [size1350]; exact i.isLt)

theorem fields1350 (i : Fin 32) :
    (entry1350 i).IA = shift ∧ (entry1350 i).ID = S (232 + i.val + 1) ∧
      (entry1350 i).IC = S 105 ∧ (entry1350 i).Inext = T 104 (232 + i.val + 1) ∧
      (entry1350 i).Icur = T 104 (232 + i.val) ∧
      (entry1350 i).output = T 105 (232 + i.val) ∧
      (entry1350 i).charge = charge 104 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1366_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1350 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 105) (T 104 (232 + i.val + 1))
      (T 104 (232 + i.val)) (T 105 (232 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1350.entries OriginalRow227TriangleForward1350.checked
    ⟨i.val, by rw [size1350]; exact i.isLt⟩
  change (entry1350 i).check = true at h
  rcases fields1350 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1351 : OriginalRow227TriangleForward1351.entries.size = 32 := rfl

def entry1351 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1351.entries[i.val]'(by rw [size1351]; exact i.isLt)

theorem fields1351 (i : Fin 32) :
    (entry1351 i).IA = shift ∧ (entry1351 i).ID = S (264 + i.val + 1) ∧
      (entry1351 i).IC = S 105 ∧ (entry1351 i).Inext = T 104 (264 + i.val + 1) ∧
      (entry1351 i).Icur = T 104 (264 + i.val) ∧
      (entry1351 i).output = T 105 (264 + i.val) ∧
      (entry1351 i).charge = charge 104 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1367_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1351 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 105) (T 104 (264 + i.val + 1))
      (T 104 (264 + i.val)) (T 105 (264 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1351.entries OriginalRow227TriangleForward1351.checked
    ⟨i.val, by rw [size1351]; exact i.isLt⟩
  change (entry1351 i).check = true at h
  rcases fields1351 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1352 : OriginalRow227TriangleForward1352.entries.size = 32 := rfl

def entry1352 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1352.entries[i.val]'(by rw [size1352]; exact i.isLt)

theorem fields1352 (i : Fin 32) :
    (entry1352 i).IA = shift ∧ (entry1352 i).ID = S (296 + i.val + 1) ∧
      (entry1352 i).IC = S 105 ∧ (entry1352 i).Inext = T 104 (296 + i.val + 1) ∧
      (entry1352 i).Icur = T 104 (296 + i.val) ∧
      (entry1352 i).output = T 105 (296 + i.val) ∧
      (entry1352 i).charge = charge 104 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1368_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1352 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 105) (T 104 (296 + i.val + 1))
      (T 104 (296 + i.val)) (T 105 (296 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1352.entries OriginalRow227TriangleForward1352.checked
    ⟨i.val, by rw [size1352]; exact i.isLt⟩
  change (entry1352 i).check = true at h
  rcases fields1352 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1353 : OriginalRow227TriangleForward1353.entries.size = 32 := rfl

def entry1353 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1353.entries[i.val]'(by rw [size1353]; exact i.isLt)

theorem fields1353 (i : Fin 32) :
    (entry1353 i).IA = shift ∧ (entry1353 i).ID = S (328 + i.val + 1) ∧
      (entry1353 i).IC = S 105 ∧ (entry1353 i).Inext = T 104 (328 + i.val + 1) ∧
      (entry1353 i).Icur = T 104 (328 + i.val) ∧
      (entry1353 i).output = T 105 (328 + i.val) ∧
      (entry1353 i).charge = charge 104 (328 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1369_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1353 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (328 + i.val)) shift
      (S (328 + i.val + 1)) (S 105) (T 104 (328 + i.val + 1))
      (T 104 (328 + i.val)) (T 105 (328 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1353.entries OriginalRow227TriangleForward1353.checked
    ⟨i.val, by rw [size1353]; exact i.isLt⟩
  change (entry1353 i).check = true at h
  rcases fields1353 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1354 : OriginalRow227TriangleForward1354.entries.size = 32 := rfl

def entry1354 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1354.entries[i.val]'(by rw [size1354]; exact i.isLt)

theorem fields1354 (i : Fin 32) :
    (entry1354 i).IA = shift ∧ (entry1354 i).ID = S (360 + i.val + 1) ∧
      (entry1354 i).IC = S 105 ∧ (entry1354 i).Inext = T 104 (360 + i.val + 1) ∧
      (entry1354 i).Icur = T 104 (360 + i.val) ∧
      (entry1354 i).output = T 105 (360 + i.val) ∧
      (entry1354 i).charge = charge 104 (360 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1370_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1354 (i : Fin 32) :
    forwardStepOK (-768) (charge 104 (360 + i.val)) shift
      (S (360 + i.val + 1)) (S 105) (T 104 (360 + i.val + 1))
      (T 104 (360 + i.val)) (T 105 (360 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1354.entries OriginalRow227TriangleForward1354.checked
    ⟨i.val, by rw [size1354]; exact i.isLt⟩
  change (entry1354 i).check = true at h
  rcases fields1354 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1355 : OriginalRow227TriangleForward1355.entries.size = 5 := rfl

def entry1355 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1355.entries[i.val]'(by rw [size1355]; exact i.isLt)

theorem fields1355 (i : Fin 5) :
    (entry1355 i).IA = shift ∧ (entry1355 i).ID = S (392 + i.val + 1) ∧
      (entry1355 i).IC = S 105 ∧ (entry1355 i).Inext = T 104 (392 + i.val + 1) ∧
      (entry1355 i).Icur = T 104 (392 + i.val) ∧
      (entry1355 i).output = T 105 (392 + i.val) ∧
      (entry1355 i).charge = charge 104 (392 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root105).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow105.block1371_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1355 (i : Fin 5) :
    forwardStepOK (-768) (charge 104 (392 + i.val)) shift
      (S (392 + i.val + 1)) (S 105) (T 104 (392 + i.val + 1))
      (T 104 (392 + i.val)) (T 105 (392 + i.val))
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1355.entries OriginalRow227TriangleForward1355.checked
    ⟨i.val, by rw [size1355]; exact i.isLt⟩
  change (entry1355 i).check = true at h
  rcases fields1355 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 104 ≤ d) (hhi : d < 397) :
    forwardStepOK (-768) (charge 104 d) shift (S (d + 1)) (S 105)
      (T 104 (d + 1)) (T 104 d) (T 105 d)
      (OriginalRow227Roots.root_pos 105 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 104 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h168 : d < 168
    ·
      by_cases h136 : d < 136
      ·
        have hi : d - 104 < 32 := by omega
        have heq : 104 + (d - 104) = d := by omega
        simpa only [heq] using step1346 ⟨d - 104, hi⟩
      ·
        have hi : d - 136 < 32 := by omega
        have heq : 136 + (d - 136) = d := by omega
        simpa only [heq] using step1347 ⟨d - 136, hi⟩
    ·
      by_cases h200 : d < 200
      ·
        have hi : d - 168 < 32 := by omega
        have heq : 168 + (d - 168) = d := by omega
        simpa only [heq] using step1348 ⟨d - 168, hi⟩
      ·
        by_cases h232 : d < 232
        ·
          have hi : d - 200 < 32 := by omega
          have heq : 200 + (d - 200) = d := by omega
          simpa only [heq] using step1349 ⟨d - 200, hi⟩
        ·
          have hi : d - 232 < 32 := by omega
          have heq : 232 + (d - 232) = d := by omega
          simpa only [heq] using step1350 ⟨d - 232, hi⟩
  ·
    by_cases h328 : d < 328
    ·
      by_cases h296 : d < 296
      ·
        have hi : d - 264 < 32 := by omega
        have heq : 264 + (d - 264) = d := by omega
        simpa only [heq] using step1351 ⟨d - 264, hi⟩
      ·
        have hi : d - 296 < 32 := by omega
        have heq : 296 + (d - 296) = d := by omega
        simpa only [heq] using step1352 ⟨d - 296, hi⟩
    ·
      by_cases h360 : d < 360
      ·
        have hi : d - 328 < 32 := by omega
        have heq : 328 + (d - 328) = d := by omega
        simpa only [heq] using step1353 ⟨d - 328, hi⟩
      ·
        by_cases h392 : d < 392
        ·
          have hi : d - 360 < 32 := by omega
          have heq : 360 + (d - 360) = d := by omega
          simpa only [heq] using step1354 ⟨d - 360, hi⟩
        ·
          have hi : d - 392 < 5 := by omega
          have heq : 392 + (d - 392) = d := by omega
          simpa only [heq] using step1355 ⟨d - 392, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1346,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1346,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1347,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1347,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1348,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1348,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1349,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1349,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1350,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1350,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1351,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1351,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1352,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1352,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1353,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1353,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1354,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1354,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.fields1355,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.step1355,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow105
