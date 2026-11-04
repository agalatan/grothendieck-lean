import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098
import Grothe.UpperChaos.OriginalRow227TriangleForward1276
import Grothe.UpperChaos.OriginalRow227TriangleForward1277
import Grothe.UpperChaos.OriginalRow227TriangleForward1278
import Grothe.UpperChaos.OriginalRow227TriangleForward1279
import Grothe.UpperChaos.OriginalRow227TriangleForward1280
import Grothe.UpperChaos.OriginalRow227TriangleForward1281
import Grothe.UpperChaos.OriginalRow227TriangleForward1282
import Grothe.UpperChaos.OriginalRow227TriangleForward1283
import Grothe.UpperChaos.OriginalRow227TriangleForward1284
import Grothe.UpperChaos.OriginalRow227TriangleForward1285

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1276 : OriginalRow227TriangleForward1276.entries.size = 32 := rfl

def entry1276 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1276.entries[i.val]'(by rw [size1276]; exact i.isLt)

theorem fields1276 (i : Fin 32) :
    (entry1276 i).IA = shift ∧ (entry1276 i).ID = S (97 + i.val + 1) ∧
      (entry1276 i).IC = S 98 ∧ (entry1276 i).Inext = T 97 (97 + i.val + 1) ∧
      (entry1276 i).Icur = T 97 (97 + i.val) ∧
      (entry1276 i).output = T 98 (97 + i.val) ∧
      (entry1276 i).charge = charge 97 (97 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1276 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (97 + i.val)) shift
      (S (97 + i.val + 1)) (S 98) (T 97 (97 + i.val + 1))
      (T 97 (97 + i.val)) (T 98 (97 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1276.entries OriginalRow227TriangleForward1276.checked
    ⟨i.val, by rw [size1276]; exact i.isLt⟩
  change (entry1276 i).check = true at h
  rcases fields1276 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1277 : OriginalRow227TriangleForward1277.entries.size = 32 := rfl

def entry1277 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1277.entries[i.val]'(by rw [size1277]; exact i.isLt)

theorem fields1277 (i : Fin 32) :
    (entry1277 i).IA = shift ∧ (entry1277 i).ID = S (129 + i.val + 1) ∧
      (entry1277 i).IC = S 98 ∧ (entry1277 i).Inext = T 97 (129 + i.val + 1) ∧
      (entry1277 i).Icur = T 97 (129 + i.val) ∧
      (entry1277 i).output = T 98 (129 + i.val) ∧
      (entry1277 i).charge = charge 97 (129 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1277 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (129 + i.val)) shift
      (S (129 + i.val + 1)) (S 98) (T 97 (129 + i.val + 1))
      (T 97 (129 + i.val)) (T 98 (129 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1277.entries OriginalRow227TriangleForward1277.checked
    ⟨i.val, by rw [size1277]; exact i.isLt⟩
  change (entry1277 i).check = true at h
  rcases fields1277 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1278 : OriginalRow227TriangleForward1278.entries.size = 32 := rfl

def entry1278 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1278.entries[i.val]'(by rw [size1278]; exact i.isLt)

theorem fields1278 (i : Fin 32) :
    (entry1278 i).IA = shift ∧ (entry1278 i).ID = S (161 + i.val + 1) ∧
      (entry1278 i).IC = S 98 ∧ (entry1278 i).Inext = T 97 (161 + i.val + 1) ∧
      (entry1278 i).Icur = T 97 (161 + i.val) ∧
      (entry1278 i).output = T 98 (161 + i.val) ∧
      (entry1278 i).charge = charge 97 (161 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1278 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (161 + i.val)) shift
      (S (161 + i.val + 1)) (S 98) (T 97 (161 + i.val + 1))
      (T 97 (161 + i.val)) (T 98 (161 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1278.entries OriginalRow227TriangleForward1278.checked
    ⟨i.val, by rw [size1278]; exact i.isLt⟩
  change (entry1278 i).check = true at h
  rcases fields1278 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1279 : OriginalRow227TriangleForward1279.entries.size = 32 := rfl

def entry1279 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1279.entries[i.val]'(by rw [size1279]; exact i.isLt)

theorem fields1279 (i : Fin 32) :
    (entry1279 i).IA = shift ∧ (entry1279 i).ID = S (193 + i.val + 1) ∧
      (entry1279 i).IC = S 98 ∧ (entry1279 i).Inext = T 97 (193 + i.val + 1) ∧
      (entry1279 i).Icur = T 97 (193 + i.val) ∧
      (entry1279 i).output = T 98 (193 + i.val) ∧
      (entry1279 i).charge = charge 97 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1279 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 98) (T 97 (193 + i.val + 1))
      (T 97 (193 + i.val)) (T 98 (193 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1279.entries OriginalRow227TriangleForward1279.checked
    ⟨i.val, by rw [size1279]; exact i.isLt⟩
  change (entry1279 i).check = true at h
  rcases fields1279 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1280 : OriginalRow227TriangleForward1280.entries.size = 32 := rfl

def entry1280 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1280.entries[i.val]'(by rw [size1280]; exact i.isLt)

theorem fields1280 (i : Fin 32) :
    (entry1280 i).IA = shift ∧ (entry1280 i).ID = S (225 + i.val + 1) ∧
      (entry1280 i).IC = S 98 ∧ (entry1280 i).Inext = T 97 (225 + i.val + 1) ∧
      (entry1280 i).Icur = T 97 (225 + i.val) ∧
      (entry1280 i).output = T 98 (225 + i.val) ∧
      (entry1280 i).charge = charge 97 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1280 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 98) (T 97 (225 + i.val + 1))
      (T 97 (225 + i.val)) (T 98 (225 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1280.entries OriginalRow227TriangleForward1280.checked
    ⟨i.val, by rw [size1280]; exact i.isLt⟩
  change (entry1280 i).check = true at h
  rcases fields1280 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1281 : OriginalRow227TriangleForward1281.entries.size = 32 := rfl

def entry1281 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1281.entries[i.val]'(by rw [size1281]; exact i.isLt)

theorem fields1281 (i : Fin 32) :
    (entry1281 i).IA = shift ∧ (entry1281 i).ID = S (257 + i.val + 1) ∧
      (entry1281 i).IC = S 98 ∧ (entry1281 i).Inext = T 97 (257 + i.val + 1) ∧
      (entry1281 i).Icur = T 97 (257 + i.val) ∧
      (entry1281 i).output = T 98 (257 + i.val) ∧
      (entry1281 i).charge = charge 97 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1281 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 98) (T 97 (257 + i.val + 1))
      (T 97 (257 + i.val)) (T 98 (257 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1281.entries OriginalRow227TriangleForward1281.checked
    ⟨i.val, by rw [size1281]; exact i.isLt⟩
  change (entry1281 i).check = true at h
  rcases fields1281 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1282 : OriginalRow227TriangleForward1282.entries.size = 32 := rfl

def entry1282 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1282.entries[i.val]'(by rw [size1282]; exact i.isLt)

theorem fields1282 (i : Fin 32) :
    (entry1282 i).IA = shift ∧ (entry1282 i).ID = S (289 + i.val + 1) ∧
      (entry1282 i).IC = S 98 ∧ (entry1282 i).Inext = T 97 (289 + i.val + 1) ∧
      (entry1282 i).Icur = T 97 (289 + i.val) ∧
      (entry1282 i).output = T 98 (289 + i.val) ∧
      (entry1282 i).charge = charge 97 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1282 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 98) (T 97 (289 + i.val + 1))
      (T 97 (289 + i.val)) (T 98 (289 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1282.entries OriginalRow227TriangleForward1282.checked
    ⟨i.val, by rw [size1282]; exact i.isLt⟩
  change (entry1282 i).check = true at h
  rcases fields1282 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1283 : OriginalRow227TriangleForward1283.entries.size = 32 := rfl

def entry1283 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1283.entries[i.val]'(by rw [size1283]; exact i.isLt)

theorem fields1283 (i : Fin 32) :
    (entry1283 i).IA = shift ∧ (entry1283 i).ID = S (321 + i.val + 1) ∧
      (entry1283 i).IC = S 98 ∧ (entry1283 i).Inext = T 97 (321 + i.val + 1) ∧
      (entry1283 i).Icur = T 97 (321 + i.val) ∧
      (entry1283 i).output = T 98 (321 + i.val) ∧
      (entry1283 i).charge = charge 97 (321 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1283 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (321 + i.val)) shift
      (S (321 + i.val + 1)) (S 98) (T 97 (321 + i.val + 1))
      (T 97 (321 + i.val)) (T 98 (321 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1283.entries OriginalRow227TriangleForward1283.checked
    ⟨i.val, by rw [size1283]; exact i.isLt⟩
  change (entry1283 i).check = true at h
  rcases fields1283 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1284 : OriginalRow227TriangleForward1284.entries.size = 32 := rfl

def entry1284 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1284.entries[i.val]'(by rw [size1284]; exact i.isLt)

theorem fields1284 (i : Fin 32) :
    (entry1284 i).IA = shift ∧ (entry1284 i).ID = S (353 + i.val + 1) ∧
      (entry1284 i).IC = S 98 ∧ (entry1284 i).Inext = T 97 (353 + i.val + 1) ∧
      (entry1284 i).Icur = T 97 (353 + i.val) ∧
      (entry1284 i).output = T 98 (353 + i.val) ∧
      (entry1284 i).charge = charge 97 (353 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1284 (i : Fin 32) :
    forwardStepOK (-768) (charge 97 (353 + i.val)) shift
      (S (353 + i.val + 1)) (S 98) (T 97 (353 + i.val + 1))
      (T 97 (353 + i.val)) (T 98 (353 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1284.entries OriginalRow227TriangleForward1284.checked
    ⟨i.val, by rw [size1284]; exact i.isLt⟩
  change (entry1284 i).check = true at h
  rcases fields1284 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1285 : OriginalRow227TriangleForward1285.entries.size = 19 := rfl

def entry1285 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1285.entries[i.val]'(by rw [size1285]; exact i.isLt)

theorem fields1285 (i : Fin 19) :
    (entry1285 i).IA = shift ∧ (entry1285 i).ID = S (385 + i.val + 1) ∧
      (entry1285 i).IC = S 98 ∧ (entry1285 i).Inext = T 97 (385 + i.val + 1) ∧
      (entry1285 i).Icur = T 97 (385 + i.val) ∧
      (entry1285 i).output = T 98 (385 + i.val) ∧
      (entry1285 i).charge = charge 97 (385 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings03.S_eq_root98).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1285 (i : Fin 19) :
    forwardStepOK (-768) (charge 97 (385 + i.val)) shift
      (S (385 + i.val + 1)) (S 98) (T 97 (385 + i.val + 1))
      (T 97 (385 + i.val)) (T 98 (385 + i.val))
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1285.entries OriginalRow227TriangleForward1285.checked
    ⟨i.val, by rw [size1285]; exact i.isLt⟩
  change (entry1285 i).check = true at h
  rcases fields1285 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 97 ≤ d) (hhi : d < 404) :
    forwardStepOK (-768) (charge 97 d) shift (S (d + 1)) (S 98)
      (T 97 (d + 1)) (T 97 d) (T 98 d)
      (OriginalRow227Roots.root_pos 98 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 97 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h161 : d < 161
    ·
      by_cases h129 : d < 129
      ·
        have hi : d - 97 < 32 := by omega
        have heq : 97 + (d - 97) = d := by omega
        simpa only [heq] using step1276 ⟨d - 97, hi⟩
      ·
        have hi : d - 129 < 32 := by omega
        have heq : 129 + (d - 129) = d := by omega
        simpa only [heq] using step1277 ⟨d - 129, hi⟩
    ·
      by_cases h193 : d < 193
      ·
        have hi : d - 161 < 32 := by omega
        have heq : 161 + (d - 161) = d := by omega
        simpa only [heq] using step1278 ⟨d - 161, hi⟩
      ·
        by_cases h225 : d < 225
        ·
          have hi : d - 193 < 32 := by omega
          have heq : 193 + (d - 193) = d := by omega
          simpa only [heq] using step1279 ⟨d - 193, hi⟩
        ·
          have hi : d - 225 < 32 := by omega
          have heq : 225 + (d - 225) = d := by omega
          simpa only [heq] using step1280 ⟨d - 225, hi⟩
  ·
    by_cases h321 : d < 321
    ·
      by_cases h289 : d < 289
      ·
        have hi : d - 257 < 32 := by omega
        have heq : 257 + (d - 257) = d := by omega
        simpa only [heq] using step1281 ⟨d - 257, hi⟩
      ·
        have hi : d - 289 < 32 := by omega
        have heq : 289 + (d - 289) = d := by omega
        simpa only [heq] using step1282 ⟨d - 289, hi⟩
    ·
      by_cases h353 : d < 353
      ·
        have hi : d - 321 < 32 := by omega
        have heq : 321 + (d - 321) = d := by omega
        simpa only [heq] using step1283 ⟨d - 321, hi⟩
      ·
        by_cases h385 : d < 385
        ·
          have hi : d - 353 < 32 := by omega
          have heq : 353 + (d - 353) = d := by omega
          simpa only [heq] using step1284 ⟨d - 353, hi⟩
        ·
          have hi : d - 385 < 19 := by omega
          have heq : 385 + (d - 385) = d := by omega
          simpa only [heq] using step1285 ⟨d - 385, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1276,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1276,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1277,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1277,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1278,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1278,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1279,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1279,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1280,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1280,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1281,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1281,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1282,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1282,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1283,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1283,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1284,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1284,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.fields1285,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.step1285,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow098
