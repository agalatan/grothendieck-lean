import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow103
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow104
import Grothe.UpperChaos.OriginalRow227TriangleForward1336
import Grothe.UpperChaos.OriginalRow227TriangleForward1337
import Grothe.UpperChaos.OriginalRow227TriangleForward1338
import Grothe.UpperChaos.OriginalRow227TriangleForward1339
import Grothe.UpperChaos.OriginalRow227TriangleForward1340
import Grothe.UpperChaos.OriginalRow227TriangleForward1341
import Grothe.UpperChaos.OriginalRow227TriangleForward1342
import Grothe.UpperChaos.OriginalRow227TriangleForward1343
import Grothe.UpperChaos.OriginalRow227TriangleForward1344
import Grothe.UpperChaos.OriginalRow227TriangleForward1345

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1336 : OriginalRow227TriangleForward1336.entries.size = 32 := rfl

def entry1336 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1336.entries[i.val]'(by rw [size1336]; exact i.isLt)

theorem fields1336 (i : Fin 32) :
    (entry1336 i).IA = shift ∧ (entry1336 i).ID = S (103 + i.val + 1) ∧
      (entry1336 i).IC = S 104 ∧ (entry1336 i).Inext = T 103 (103 + i.val + 1) ∧
      (entry1336 i).Icur = T 103 (103 + i.val) ∧
      (entry1336 i).output = T 104 (103 + i.val) ∧
      (entry1336 i).charge = charge 103 (103 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1342_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1352_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1336 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (103 + i.val)) shift
      (S (103 + i.val + 1)) (S 104) (T 103 (103 + i.val + 1))
      (T 103 (103 + i.val)) (T 104 (103 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1336.entries OriginalRow227TriangleForward1336.checked
    ⟨i.val, by rw [size1336]; exact i.isLt⟩
  change (entry1336 i).check = true at h
  rcases fields1336 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1337 : OriginalRow227TriangleForward1337.entries.size = 32 := rfl

def entry1337 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1337.entries[i.val]'(by rw [size1337]; exact i.isLt)

theorem fields1337 (i : Fin 32) :
    (entry1337 i).IA = shift ∧ (entry1337 i).ID = S (135 + i.val + 1) ∧
      (entry1337 i).IC = S 104 ∧ (entry1337 i).Inext = T 103 (135 + i.val + 1) ∧
      (entry1337 i).Icur = T 103 (135 + i.val) ∧
      (entry1337 i).output = T 104 (135 + i.val) ∧
      (entry1337 i).charge = charge 103 (135 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1343_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1353_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1337 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (135 + i.val)) shift
      (S (135 + i.val + 1)) (S 104) (T 103 (135 + i.val + 1))
      (T 103 (135 + i.val)) (T 104 (135 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1337.entries OriginalRow227TriangleForward1337.checked
    ⟨i.val, by rw [size1337]; exact i.isLt⟩
  change (entry1337 i).check = true at h
  rcases fields1337 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1338 : OriginalRow227TriangleForward1338.entries.size = 32 := rfl

def entry1338 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1338.entries[i.val]'(by rw [size1338]; exact i.isLt)

theorem fields1338 (i : Fin 32) :
    (entry1338 i).IA = shift ∧ (entry1338 i).ID = S (167 + i.val + 1) ∧
      (entry1338 i).IC = S 104 ∧ (entry1338 i).Inext = T 103 (167 + i.val + 1) ∧
      (entry1338 i).Icur = T 103 (167 + i.val) ∧
      (entry1338 i).output = T 104 (167 + i.val) ∧
      (entry1338 i).charge = charge 103 (167 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1344_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1354_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1338 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (167 + i.val)) shift
      (S (167 + i.val + 1)) (S 104) (T 103 (167 + i.val + 1))
      (T 103 (167 + i.val)) (T 104 (167 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1338.entries OriginalRow227TriangleForward1338.checked
    ⟨i.val, by rw [size1338]; exact i.isLt⟩
  change (entry1338 i).check = true at h
  rcases fields1338 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1339 : OriginalRow227TriangleForward1339.entries.size = 32 := rfl

def entry1339 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1339.entries[i.val]'(by rw [size1339]; exact i.isLt)

theorem fields1339 (i : Fin 32) :
    (entry1339 i).IA = shift ∧ (entry1339 i).ID = S (199 + i.val + 1) ∧
      (entry1339 i).IC = S 104 ∧ (entry1339 i).Inext = T 103 (199 + i.val + 1) ∧
      (entry1339 i).Icur = T 103 (199 + i.val) ∧
      (entry1339 i).output = T 104 (199 + i.val) ∧
      (entry1339 i).charge = charge 103 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1345_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1355_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1339 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 104) (T 103 (199 + i.val + 1))
      (T 103 (199 + i.val)) (T 104 (199 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1339.entries OriginalRow227TriangleForward1339.checked
    ⟨i.val, by rw [size1339]; exact i.isLt⟩
  change (entry1339 i).check = true at h
  rcases fields1339 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1340 : OriginalRow227TriangleForward1340.entries.size = 32 := rfl

def entry1340 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1340.entries[i.val]'(by rw [size1340]; exact i.isLt)

theorem fields1340 (i : Fin 32) :
    (entry1340 i).IA = shift ∧ (entry1340 i).ID = S (231 + i.val + 1) ∧
      (entry1340 i).IC = S 104 ∧ (entry1340 i).Inext = T 103 (231 + i.val + 1) ∧
      (entry1340 i).Icur = T 103 (231 + i.val) ∧
      (entry1340 i).output = T 104 (231 + i.val) ∧
      (entry1340 i).charge = charge 103 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1346_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1356_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1340 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 104) (T 103 (231 + i.val + 1))
      (T 103 (231 + i.val)) (T 104 (231 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1340.entries OriginalRow227TriangleForward1340.checked
    ⟨i.val, by rw [size1340]; exact i.isLt⟩
  change (entry1340 i).check = true at h
  rcases fields1340 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1341 : OriginalRow227TriangleForward1341.entries.size = 32 := rfl

def entry1341 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1341.entries[i.val]'(by rw [size1341]; exact i.isLt)

theorem fields1341 (i : Fin 32) :
    (entry1341 i).IA = shift ∧ (entry1341 i).ID = S (263 + i.val + 1) ∧
      (entry1341 i).IC = S 104 ∧ (entry1341 i).Inext = T 103 (263 + i.val + 1) ∧
      (entry1341 i).Icur = T 103 (263 + i.val) ∧
      (entry1341 i).output = T 104 (263 + i.val) ∧
      (entry1341 i).charge = charge 103 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1347_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1357_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1341 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 104) (T 103 (263 + i.val + 1))
      (T 103 (263 + i.val)) (T 104 (263 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1341.entries OriginalRow227TriangleForward1341.checked
    ⟨i.val, by rw [size1341]; exact i.isLt⟩
  change (entry1341 i).check = true at h
  rcases fields1341 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1342 : OriginalRow227TriangleForward1342.entries.size = 32 := rfl

def entry1342 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1342.entries[i.val]'(by rw [size1342]; exact i.isLt)

theorem fields1342 (i : Fin 32) :
    (entry1342 i).IA = shift ∧ (entry1342 i).ID = S (295 + i.val + 1) ∧
      (entry1342 i).IC = S 104 ∧ (entry1342 i).Inext = T 103 (295 + i.val + 1) ∧
      (entry1342 i).Icur = T 103 (295 + i.val) ∧
      (entry1342 i).output = T 104 (295 + i.val) ∧
      (entry1342 i).charge = charge 103 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1348_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1358_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1342 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 104) (T 103 (295 + i.val + 1))
      (T 103 (295 + i.val)) (T 104 (295 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1342.entries OriginalRow227TriangleForward1342.checked
    ⟨i.val, by rw [size1342]; exact i.isLt⟩
  change (entry1342 i).check = true at h
  rcases fields1342 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1343 : OriginalRow227TriangleForward1343.entries.size = 32 := rfl

def entry1343 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1343.entries[i.val]'(by rw [size1343]; exact i.isLt)

theorem fields1343 (i : Fin 32) :
    (entry1343 i).IA = shift ∧ (entry1343 i).ID = S (327 + i.val + 1) ∧
      (entry1343 i).IC = S 104 ∧ (entry1343 i).Inext = T 103 (327 + i.val + 1) ∧
      (entry1343 i).Icur = T 103 (327 + i.val) ∧
      (entry1343 i).output = T 104 (327 + i.val) ∧
      (entry1343 i).charge = charge 103 (327 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1349_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1359_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1343 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (327 + i.val)) shift
      (S (327 + i.val + 1)) (S 104) (T 103 (327 + i.val + 1))
      (T 103 (327 + i.val)) (T 104 (327 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1343.entries OriginalRow227TriangleForward1343.checked
    ⟨i.val, by rw [size1343]; exact i.isLt⟩
  change (entry1343 i).check = true at h
  rcases fields1343 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1344 : OriginalRow227TriangleForward1344.entries.size = 32 := rfl

def entry1344 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1344.entries[i.val]'(by rw [size1344]; exact i.isLt)

theorem fields1344 (i : Fin 32) :
    (entry1344 i).IA = shift ∧ (entry1344 i).ID = S (359 + i.val + 1) ∧
      (entry1344 i).IC = S 104 ∧ (entry1344 i).Inext = T 103 (359 + i.val + 1) ∧
      (entry1344 i).Icur = T 103 (359 + i.val) ∧
      (entry1344 i).output = T 104 (359 + i.val) ∧
      (entry1344 i).charge = charge 103 (359 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1350_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1360_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1344 (i : Fin 32) :
    forwardStepOK (-768) (charge 103 (359 + i.val)) shift
      (S (359 + i.val + 1)) (S 104) (T 103 (359 + i.val + 1))
      (T 103 (359 + i.val)) (T 104 (359 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1344.entries OriginalRow227TriangleForward1344.checked
    ⟨i.val, by rw [size1344]; exact i.isLt⟩
  change (entry1344 i).check = true at h
  rcases fields1344 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1345 : OriginalRow227TriangleForward1345.entries.size = 7 := rfl

def entry1345 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1345.entries[i.val]'(by rw [size1345]; exact i.isLt)

theorem fields1345 (i : Fin 7) :
    (entry1345 i).IA = shift ∧ (entry1345 i).ID = S (391 + i.val + 1) ∧
      (entry1345 i).IC = S 104 ∧ (entry1345 i).Inext = T 103 (391 + i.val + 1) ∧
      (entry1345 i).Icur = T 103 (391 + i.val) ∧
      (entry1345 i).output = T 104 (391 + i.val) ∧
      (entry1345 i).charge = charge 103 (391 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root104).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow103.block1351_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow104.block1361_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1345 (i : Fin 7) :
    forwardStepOK (-768) (charge 103 (391 + i.val)) shift
      (S (391 + i.val + 1)) (S 104) (T 103 (391 + i.val + 1))
      (T 103 (391 + i.val)) (T 104 (391 + i.val))
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1345.entries OriginalRow227TriangleForward1345.checked
    ⟨i.val, by rw [size1345]; exact i.isLt⟩
  change (entry1345 i).check = true at h
  rcases fields1345 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 103 ≤ d) (hhi : d < 398) :
    forwardStepOK (-768) (charge 103 d) shift (S (d + 1)) (S 104)
      (T 103 (d + 1)) (T 103 d) (T 104 d)
      (OriginalRow227Roots.root_pos 104 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 103 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h167 : d < 167
    ·
      by_cases h135 : d < 135
      ·
        have hi : d - 103 < 32 := by omega
        have heq : 103 + (d - 103) = d := by omega
        simpa only [heq] using step1336 ⟨d - 103, hi⟩
      ·
        have hi : d - 135 < 32 := by omega
        have heq : 135 + (d - 135) = d := by omega
        simpa only [heq] using step1337 ⟨d - 135, hi⟩
    ·
      by_cases h199 : d < 199
      ·
        have hi : d - 167 < 32 := by omega
        have heq : 167 + (d - 167) = d := by omega
        simpa only [heq] using step1338 ⟨d - 167, hi⟩
      ·
        by_cases h231 : d < 231
        ·
          have hi : d - 199 < 32 := by omega
          have heq : 199 + (d - 199) = d := by omega
          simpa only [heq] using step1339 ⟨d - 199, hi⟩
        ·
          have hi : d - 231 < 32 := by omega
          have heq : 231 + (d - 231) = d := by omega
          simpa only [heq] using step1340 ⟨d - 231, hi⟩
  ·
    by_cases h327 : d < 327
    ·
      by_cases h295 : d < 295
      ·
        have hi : d - 263 < 32 := by omega
        have heq : 263 + (d - 263) = d := by omega
        simpa only [heq] using step1341 ⟨d - 263, hi⟩
      ·
        have hi : d - 295 < 32 := by omega
        have heq : 295 + (d - 295) = d := by omega
        simpa only [heq] using step1342 ⟨d - 295, hi⟩
    ·
      by_cases h359 : d < 359
      ·
        have hi : d - 327 < 32 := by omega
        have heq : 327 + (d - 327) = d := by omega
        simpa only [heq] using step1343 ⟨d - 327, hi⟩
      ·
        by_cases h391 : d < 391
        ·
          have hi : d - 359 < 32 := by omega
          have heq : 359 + (d - 359) = d := by omega
          simpa only [heq] using step1344 ⟨d - 359, hi⟩
        ·
          have hi : d - 391 < 7 := by omega
          have heq : 391 + (d - 391) = d := by omega
          simpa only [heq] using step1345 ⟨d - 391, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1336,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1336,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1337,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1337,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1338,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1338,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1339,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1339,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1340,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1340,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1341,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1341,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1342,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1342,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1343,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1343,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1344,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1344,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.fields1345,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.step1345,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow104
