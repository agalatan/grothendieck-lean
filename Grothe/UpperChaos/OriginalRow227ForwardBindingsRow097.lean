import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow097
import Grothe.UpperChaos.OriginalRow227TriangleForward1266
import Grothe.UpperChaos.OriginalRow227TriangleForward1267
import Grothe.UpperChaos.OriginalRow227TriangleForward1268
import Grothe.UpperChaos.OriginalRow227TriangleForward1269
import Grothe.UpperChaos.OriginalRow227TriangleForward1270
import Grothe.UpperChaos.OriginalRow227TriangleForward1271
import Grothe.UpperChaos.OriginalRow227TriangleForward1272
import Grothe.UpperChaos.OriginalRow227TriangleForward1273
import Grothe.UpperChaos.OriginalRow227TriangleForward1274
import Grothe.UpperChaos.OriginalRow227TriangleForward1275

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1266 : OriginalRow227TriangleForward1266.entries.size = 32 := rfl

def entry1266 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1266.entries[i.val]'(by rw [size1266]; exact i.isLt)

theorem fields1266 (i : Fin 32) :
    (entry1266 i).IA = shift ∧ (entry1266 i).ID = S (96 + i.val + 1) ∧
      (entry1266 i).IC = S 97 ∧ (entry1266 i).Inext = T 96 (96 + i.val + 1) ∧
      (entry1266 i).Icur = T 96 (96 + i.val) ∧
      (entry1266 i).output = T 97 (96 + i.val) ∧
      (entry1266 i).charge = charge 96 (96 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1282_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1266 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (96 + i.val)) shift
      (S (96 + i.val + 1)) (S 97) (T 96 (96 + i.val + 1))
      (T 96 (96 + i.val)) (T 97 (96 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1266.entries OriginalRow227TriangleForward1266.checked
    ⟨i.val, by rw [size1266]; exact i.isLt⟩
  change (entry1266 i).check = true at h
  rcases fields1266 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1267 : OriginalRow227TriangleForward1267.entries.size = 32 := rfl

def entry1267 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1267.entries[i.val]'(by rw [size1267]; exact i.isLt)

theorem fields1267 (i : Fin 32) :
    (entry1267 i).IA = shift ∧ (entry1267 i).ID = S (128 + i.val + 1) ∧
      (entry1267 i).IC = S 97 ∧ (entry1267 i).Inext = T 96 (128 + i.val + 1) ∧
      (entry1267 i).Icur = T 96 (128 + i.val) ∧
      (entry1267 i).output = T 97 (128 + i.val) ∧
      (entry1267 i).charge = charge 96 (128 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1283_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1267 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (128 + i.val)) shift
      (S (128 + i.val + 1)) (S 97) (T 96 (128 + i.val + 1))
      (T 96 (128 + i.val)) (T 97 (128 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1267.entries OriginalRow227TriangleForward1267.checked
    ⟨i.val, by rw [size1267]; exact i.isLt⟩
  change (entry1267 i).check = true at h
  rcases fields1267 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1268 : OriginalRow227TriangleForward1268.entries.size = 32 := rfl

def entry1268 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1268.entries[i.val]'(by rw [size1268]; exact i.isLt)

theorem fields1268 (i : Fin 32) :
    (entry1268 i).IA = shift ∧ (entry1268 i).ID = S (160 + i.val + 1) ∧
      (entry1268 i).IC = S 97 ∧ (entry1268 i).Inext = T 96 (160 + i.val + 1) ∧
      (entry1268 i).Icur = T 96 (160 + i.val) ∧
      (entry1268 i).output = T 97 (160 + i.val) ∧
      (entry1268 i).charge = charge 96 (160 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1284_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1268 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (160 + i.val)) shift
      (S (160 + i.val + 1)) (S 97) (T 96 (160 + i.val + 1))
      (T 96 (160 + i.val)) (T 97 (160 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1268.entries OriginalRow227TriangleForward1268.checked
    ⟨i.val, by rw [size1268]; exact i.isLt⟩
  change (entry1268 i).check = true at h
  rcases fields1268 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1269 : OriginalRow227TriangleForward1269.entries.size = 32 := rfl

def entry1269 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1269.entries[i.val]'(by rw [size1269]; exact i.isLt)

theorem fields1269 (i : Fin 32) :
    (entry1269 i).IA = shift ∧ (entry1269 i).ID = S (192 + i.val + 1) ∧
      (entry1269 i).IC = S 97 ∧ (entry1269 i).Inext = T 96 (192 + i.val + 1) ∧
      (entry1269 i).Icur = T 96 (192 + i.val) ∧
      (entry1269 i).output = T 97 (192 + i.val) ∧
      (entry1269 i).charge = charge 96 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1285_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1269 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 97) (T 96 (192 + i.val + 1))
      (T 96 (192 + i.val)) (T 97 (192 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1269.entries OriginalRow227TriangleForward1269.checked
    ⟨i.val, by rw [size1269]; exact i.isLt⟩
  change (entry1269 i).check = true at h
  rcases fields1269 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1270 : OriginalRow227TriangleForward1270.entries.size = 32 := rfl

def entry1270 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1270.entries[i.val]'(by rw [size1270]; exact i.isLt)

theorem fields1270 (i : Fin 32) :
    (entry1270 i).IA = shift ∧ (entry1270 i).ID = S (224 + i.val + 1) ∧
      (entry1270 i).IC = S 97 ∧ (entry1270 i).Inext = T 96 (224 + i.val + 1) ∧
      (entry1270 i).Icur = T 96 (224 + i.val) ∧
      (entry1270 i).output = T 97 (224 + i.val) ∧
      (entry1270 i).charge = charge 96 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1286_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1270 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 97) (T 96 (224 + i.val + 1))
      (T 96 (224 + i.val)) (T 97 (224 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1270.entries OriginalRow227TriangleForward1270.checked
    ⟨i.val, by rw [size1270]; exact i.isLt⟩
  change (entry1270 i).check = true at h
  rcases fields1270 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1271 : OriginalRow227TriangleForward1271.entries.size = 32 := rfl

def entry1271 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1271.entries[i.val]'(by rw [size1271]; exact i.isLt)

theorem fields1271 (i : Fin 32) :
    (entry1271 i).IA = shift ∧ (entry1271 i).ID = S (256 + i.val + 1) ∧
      (entry1271 i).IC = S 97 ∧ (entry1271 i).Inext = T 96 (256 + i.val + 1) ∧
      (entry1271 i).Icur = T 96 (256 + i.val) ∧
      (entry1271 i).output = T 97 (256 + i.val) ∧
      (entry1271 i).charge = charge 96 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1287_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1271 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 97) (T 96 (256 + i.val + 1))
      (T 96 (256 + i.val)) (T 97 (256 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1271.entries OriginalRow227TriangleForward1271.checked
    ⟨i.val, by rw [size1271]; exact i.isLt⟩
  change (entry1271 i).check = true at h
  rcases fields1271 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1272 : OriginalRow227TriangleForward1272.entries.size = 32 := rfl

def entry1272 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1272.entries[i.val]'(by rw [size1272]; exact i.isLt)

theorem fields1272 (i : Fin 32) :
    (entry1272 i).IA = shift ∧ (entry1272 i).ID = S (288 + i.val + 1) ∧
      (entry1272 i).IC = S 97 ∧ (entry1272 i).Inext = T 96 (288 + i.val + 1) ∧
      (entry1272 i).Icur = T 96 (288 + i.val) ∧
      (entry1272 i).output = T 97 (288 + i.val) ∧
      (entry1272 i).charge = charge 96 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1288_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1272 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 97) (T 96 (288 + i.val + 1))
      (T 96 (288 + i.val)) (T 97 (288 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1272.entries OriginalRow227TriangleForward1272.checked
    ⟨i.val, by rw [size1272]; exact i.isLt⟩
  change (entry1272 i).check = true at h
  rcases fields1272 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1273 : OriginalRow227TriangleForward1273.entries.size = 32 := rfl

def entry1273 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1273.entries[i.val]'(by rw [size1273]; exact i.isLt)

theorem fields1273 (i : Fin 32) :
    (entry1273 i).IA = shift ∧ (entry1273 i).ID = S (320 + i.val + 1) ∧
      (entry1273 i).IC = S 97 ∧ (entry1273 i).Inext = T 96 (320 + i.val + 1) ∧
      (entry1273 i).Icur = T 96 (320 + i.val) ∧
      (entry1273 i).output = T 97 (320 + i.val) ∧
      (entry1273 i).charge = charge 96 (320 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1289_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1273 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (320 + i.val)) shift
      (S (320 + i.val + 1)) (S 97) (T 96 (320 + i.val + 1))
      (T 96 (320 + i.val)) (T 97 (320 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1273.entries OriginalRow227TriangleForward1273.checked
    ⟨i.val, by rw [size1273]; exact i.isLt⟩
  change (entry1273 i).check = true at h
  rcases fields1273 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1274 : OriginalRow227TriangleForward1274.entries.size = 32 := rfl

def entry1274 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1274.entries[i.val]'(by rw [size1274]; exact i.isLt)

theorem fields1274 (i : Fin 32) :
    (entry1274 i).IA = shift ∧ (entry1274 i).ID = S (352 + i.val + 1) ∧
      (entry1274 i).IC = S 97 ∧ (entry1274 i).Inext = T 96 (352 + i.val + 1) ∧
      (entry1274 i).Icur = T 96 (352 + i.val) ∧
      (entry1274 i).output = T 97 (352 + i.val) ∧
      (entry1274 i).charge = charge 96 (352 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1290_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1274 (i : Fin 32) :
    forwardStepOK (-768) (charge 96 (352 + i.val)) shift
      (S (352 + i.val + 1)) (S 97) (T 96 (352 + i.val + 1))
      (T 96 (352 + i.val)) (T 97 (352 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1274.entries OriginalRow227TriangleForward1274.checked
    ⟨i.val, by rw [size1274]; exact i.isLt⟩
  change (entry1274 i).check = true at h
  rcases fields1274 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1275 : OriginalRow227TriangleForward1275.entries.size = 21 := rfl

def entry1275 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1275.entries[i.val]'(by rw [size1275]; exact i.isLt)

theorem fields1275 (i : Fin 21) :
    (entry1275 i).IA = shift ∧ (entry1275 i).ID = S (384 + i.val + 1) ∧
      (entry1275 i).IC = S 97 ∧ (entry1275 i).Inext = T 96 (384 + i.val + 1) ∧
      (entry1275 i).Icur = T 96 (384 + i.val) ∧
      (entry1275 i).output = T 97 (384 + i.val) ∧
      (entry1275 i).charge = charge 96 (384 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings03.S_eq_root97).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow097.block1291_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1275 (i : Fin 21) :
    forwardStepOK (-768) (charge 96 (384 + i.val)) shift
      (S (384 + i.val + 1)) (S 97) (T 96 (384 + i.val + 1))
      (T 96 (384 + i.val)) (T 97 (384 + i.val))
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1275.entries OriginalRow227TriangleForward1275.checked
    ⟨i.val, by rw [size1275]; exact i.isLt⟩
  change (entry1275 i).check = true at h
  rcases fields1275 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 96 ≤ d) (hhi : d < 405) :
    forwardStepOK (-768) (charge 96 d) shift (S (d + 1)) (S 97)
      (T 96 (d + 1)) (T 96 d) (T 97 d)
      (OriginalRow227Roots.root_pos 97 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 96 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h160 : d < 160
    ·
      by_cases h128 : d < 128
      ·
        have hi : d - 96 < 32 := by omega
        have heq : 96 + (d - 96) = d := by omega
        simpa only [heq] using step1266 ⟨d - 96, hi⟩
      ·
        have hi : d - 128 < 32 := by omega
        have heq : 128 + (d - 128) = d := by omega
        simpa only [heq] using step1267 ⟨d - 128, hi⟩
    ·
      by_cases h192 : d < 192
      ·
        have hi : d - 160 < 32 := by omega
        have heq : 160 + (d - 160) = d := by omega
        simpa only [heq] using step1268 ⟨d - 160, hi⟩
      ·
        by_cases h224 : d < 224
        ·
          have hi : d - 192 < 32 := by omega
          have heq : 192 + (d - 192) = d := by omega
          simpa only [heq] using step1269 ⟨d - 192, hi⟩
        ·
          have hi : d - 224 < 32 := by omega
          have heq : 224 + (d - 224) = d := by omega
          simpa only [heq] using step1270 ⟨d - 224, hi⟩
  ·
    by_cases h320 : d < 320
    ·
      by_cases h288 : d < 288
      ·
        have hi : d - 256 < 32 := by omega
        have heq : 256 + (d - 256) = d := by omega
        simpa only [heq] using step1271 ⟨d - 256, hi⟩
      ·
        have hi : d - 288 < 32 := by omega
        have heq : 288 + (d - 288) = d := by omega
        simpa only [heq] using step1272 ⟨d - 288, hi⟩
    ·
      by_cases h352 : d < 352
      ·
        have hi : d - 320 < 32 := by omega
        have heq : 320 + (d - 320) = d := by omega
        simpa only [heq] using step1273 ⟨d - 320, hi⟩
      ·
        by_cases h384 : d < 384
        ·
          have hi : d - 352 < 32 := by omega
          have heq : 352 + (d - 352) = d := by omega
          simpa only [heq] using step1274 ⟨d - 352, hi⟩
        ·
          have hi : d - 384 < 21 := by omega
          have heq : 384 + (d - 384) = d := by omega
          simpa only [heq] using step1275 ⟨d - 384, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1266,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1266,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1267,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1267,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1268,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1268,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1269,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1269,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1270,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1270,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1271,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1271,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1272,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1272,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1273,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1273,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1274,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1274,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.fields1275,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.step1275,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow097
