import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow092
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093
import Grothe.UpperChaos.OriginalRow227TriangleForward1226
import Grothe.UpperChaos.OriginalRow227TriangleForward1227
import Grothe.UpperChaos.OriginalRow227TriangleForward1228
import Grothe.UpperChaos.OriginalRow227TriangleForward1229
import Grothe.UpperChaos.OriginalRow227TriangleForward1230
import Grothe.UpperChaos.OriginalRow227TriangleForward1231
import Grothe.UpperChaos.OriginalRow227TriangleForward1232
import Grothe.UpperChaos.OriginalRow227TriangleForward1233
import Grothe.UpperChaos.OriginalRow227TriangleForward1234
import Grothe.UpperChaos.OriginalRow227TriangleForward1235

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1226 : OriginalRow227TriangleForward1226.entries.size = 32 := rfl

def entry1226 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1226.entries[i.val]'(by rw [size1226]; exact i.isLt)

theorem fields1226 (i : Fin 32) :
    (entry1226 i).IA = shift ∧ (entry1226 i).ID = S (92 + i.val + 1) ∧
      (entry1226 i).IC = S 93 ∧ (entry1226 i).Inext = T 92 (92 + i.val + 1) ∧
      (entry1226 i).Icur = T 92 (92 + i.val) ∧
      (entry1226 i).output = T 93 (92 + i.val) ∧
      (entry1226 i).charge = charge 92 (92 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1232_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1226 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (92 + i.val)) shift
      (S (92 + i.val + 1)) (S 93) (T 92 (92 + i.val + 1))
      (T 92 (92 + i.val)) (T 93 (92 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1226.entries OriginalRow227TriangleForward1226.checked
    ⟨i.val, by rw [size1226]; exact i.isLt⟩
  change (entry1226 i).check = true at h
  rcases fields1226 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1227 : OriginalRow227TriangleForward1227.entries.size = 32 := rfl

def entry1227 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1227.entries[i.val]'(by rw [size1227]; exact i.isLt)

theorem fields1227 (i : Fin 32) :
    (entry1227 i).IA = shift ∧ (entry1227 i).ID = S (124 + i.val + 1) ∧
      (entry1227 i).IC = S 93 ∧ (entry1227 i).Inext = T 92 (124 + i.val + 1) ∧
      (entry1227 i).Icur = T 92 (124 + i.val) ∧
      (entry1227 i).output = T 93 (124 + i.val) ∧
      (entry1227 i).charge = charge 92 (124 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1233_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1227 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (124 + i.val)) shift
      (S (124 + i.val + 1)) (S 93) (T 92 (124 + i.val + 1))
      (T 92 (124 + i.val)) (T 93 (124 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1227.entries OriginalRow227TriangleForward1227.checked
    ⟨i.val, by rw [size1227]; exact i.isLt⟩
  change (entry1227 i).check = true at h
  rcases fields1227 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1228 : OriginalRow227TriangleForward1228.entries.size = 32 := rfl

def entry1228 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1228.entries[i.val]'(by rw [size1228]; exact i.isLt)

theorem fields1228 (i : Fin 32) :
    (entry1228 i).IA = shift ∧ (entry1228 i).ID = S (156 + i.val + 1) ∧
      (entry1228 i).IC = S 93 ∧ (entry1228 i).Inext = T 92 (156 + i.val + 1) ∧
      (entry1228 i).Icur = T 92 (156 + i.val) ∧
      (entry1228 i).output = T 93 (156 + i.val) ∧
      (entry1228 i).charge = charge 92 (156 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1234_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1228 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (156 + i.val)) shift
      (S (156 + i.val + 1)) (S 93) (T 92 (156 + i.val + 1))
      (T 92 (156 + i.val)) (T 93 (156 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1228.entries OriginalRow227TriangleForward1228.checked
    ⟨i.val, by rw [size1228]; exact i.isLt⟩
  change (entry1228 i).check = true at h
  rcases fields1228 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1229 : OriginalRow227TriangleForward1229.entries.size = 32 := rfl

def entry1229 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1229.entries[i.val]'(by rw [size1229]; exact i.isLt)

theorem fields1229 (i : Fin 32) :
    (entry1229 i).IA = shift ∧ (entry1229 i).ID = S (188 + i.val + 1) ∧
      (entry1229 i).IC = S 93 ∧ (entry1229 i).Inext = T 92 (188 + i.val + 1) ∧
      (entry1229 i).Icur = T 92 (188 + i.val) ∧
      (entry1229 i).output = T 93 (188 + i.val) ∧
      (entry1229 i).charge = charge 92 (188 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1235_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1229 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (188 + i.val)) shift
      (S (188 + i.val + 1)) (S 93) (T 92 (188 + i.val + 1))
      (T 92 (188 + i.val)) (T 93 (188 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1229.entries OriginalRow227TriangleForward1229.checked
    ⟨i.val, by rw [size1229]; exact i.isLt⟩
  change (entry1229 i).check = true at h
  rcases fields1229 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1230 : OriginalRow227TriangleForward1230.entries.size = 32 := rfl

def entry1230 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1230.entries[i.val]'(by rw [size1230]; exact i.isLt)

theorem fields1230 (i : Fin 32) :
    (entry1230 i).IA = shift ∧ (entry1230 i).ID = S (220 + i.val + 1) ∧
      (entry1230 i).IC = S 93 ∧ (entry1230 i).Inext = T 92 (220 + i.val + 1) ∧
      (entry1230 i).Icur = T 92 (220 + i.val) ∧
      (entry1230 i).output = T 93 (220 + i.val) ∧
      (entry1230 i).charge = charge 92 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1236_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1230 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 93) (T 92 (220 + i.val + 1))
      (T 92 (220 + i.val)) (T 93 (220 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1230.entries OriginalRow227TriangleForward1230.checked
    ⟨i.val, by rw [size1230]; exact i.isLt⟩
  change (entry1230 i).check = true at h
  rcases fields1230 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1231 : OriginalRow227TriangleForward1231.entries.size = 32 := rfl

def entry1231 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1231.entries[i.val]'(by rw [size1231]; exact i.isLt)

theorem fields1231 (i : Fin 32) :
    (entry1231 i).IA = shift ∧ (entry1231 i).ID = S (252 + i.val + 1) ∧
      (entry1231 i).IC = S 93 ∧ (entry1231 i).Inext = T 92 (252 + i.val + 1) ∧
      (entry1231 i).Icur = T 92 (252 + i.val) ∧
      (entry1231 i).output = T 93 (252 + i.val) ∧
      (entry1231 i).charge = charge 92 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1237_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1231 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 93) (T 92 (252 + i.val + 1))
      (T 92 (252 + i.val)) (T 93 (252 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1231.entries OriginalRow227TriangleForward1231.checked
    ⟨i.val, by rw [size1231]; exact i.isLt⟩
  change (entry1231 i).check = true at h
  rcases fields1231 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1232 : OriginalRow227TriangleForward1232.entries.size = 32 := rfl

def entry1232 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1232.entries[i.val]'(by rw [size1232]; exact i.isLt)

theorem fields1232 (i : Fin 32) :
    (entry1232 i).IA = shift ∧ (entry1232 i).ID = S (284 + i.val + 1) ∧
      (entry1232 i).IC = S 93 ∧ (entry1232 i).Inext = T 92 (284 + i.val + 1) ∧
      (entry1232 i).Icur = T 92 (284 + i.val) ∧
      (entry1232 i).output = T 93 (284 + i.val) ∧
      (entry1232 i).charge = charge 92 (284 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1238_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1232 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (284 + i.val)) shift
      (S (284 + i.val + 1)) (S 93) (T 92 (284 + i.val + 1))
      (T 92 (284 + i.val)) (T 93 (284 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1232.entries OriginalRow227TriangleForward1232.checked
    ⟨i.val, by rw [size1232]; exact i.isLt⟩
  change (entry1232 i).check = true at h
  rcases fields1232 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1233 : OriginalRow227TriangleForward1233.entries.size = 32 := rfl

def entry1233 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1233.entries[i.val]'(by rw [size1233]; exact i.isLt)

theorem fields1233 (i : Fin 32) :
    (entry1233 i).IA = shift ∧ (entry1233 i).ID = S (316 + i.val + 1) ∧
      (entry1233 i).IC = S 93 ∧ (entry1233 i).Inext = T 92 (316 + i.val + 1) ∧
      (entry1233 i).Icur = T 92 (316 + i.val) ∧
      (entry1233 i).output = T 93 (316 + i.val) ∧
      (entry1233 i).charge = charge 92 (316 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1239_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1233 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (316 + i.val)) shift
      (S (316 + i.val + 1)) (S 93) (T 92 (316 + i.val + 1))
      (T 92 (316 + i.val)) (T 93 (316 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1233.entries OriginalRow227TriangleForward1233.checked
    ⟨i.val, by rw [size1233]; exact i.isLt⟩
  change (entry1233 i).check = true at h
  rcases fields1233 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1234 : OriginalRow227TriangleForward1234.entries.size = 32 := rfl

def entry1234 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1234.entries[i.val]'(by rw [size1234]; exact i.isLt)

theorem fields1234 (i : Fin 32) :
    (entry1234 i).IA = shift ∧ (entry1234 i).ID = S (348 + i.val + 1) ∧
      (entry1234 i).IC = S 93 ∧ (entry1234 i).Inext = T 92 (348 + i.val + 1) ∧
      (entry1234 i).Icur = T 92 (348 + i.val) ∧
      (entry1234 i).output = T 93 (348 + i.val) ∧
      (entry1234 i).charge = charge 92 (348 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1240_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1234 (i : Fin 32) :
    forwardStepOK (-768) (charge 92 (348 + i.val)) shift
      (S (348 + i.val + 1)) (S 93) (T 92 (348 + i.val + 1))
      (T 92 (348 + i.val)) (T 93 (348 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1234.entries OriginalRow227TriangleForward1234.checked
    ⟨i.val, by rw [size1234]; exact i.isLt⟩
  change (entry1234 i).check = true at h
  rcases fields1234 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1235 : OriginalRow227TriangleForward1235.entries.size = 29 := rfl

def entry1235 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1235.entries[i.val]'(by rw [size1235]; exact i.isLt)

theorem fields1235 (i : Fin 29) :
    (entry1235 i).IA = shift ∧ (entry1235 i).ID = S (380 + i.val + 1) ∧
      (entry1235 i).IC = S 93 ∧ (entry1235 i).Inext = T 92 (380 + i.val + 1) ∧
      (entry1235 i).Icur = T 92 (380 + i.val) ∧
      (entry1235 i).output = T 93 (380 + i.val) ∧
      (entry1235 i).charge = charge 92 (380 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root93).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow092.block1241_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1235 (i : Fin 29) :
    forwardStepOK (-768) (charge 92 (380 + i.val)) shift
      (S (380 + i.val + 1)) (S 93) (T 92 (380 + i.val + 1))
      (T 92 (380 + i.val)) (T 93 (380 + i.val))
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1235.entries OriginalRow227TriangleForward1235.checked
    ⟨i.val, by rw [size1235]; exact i.isLt⟩
  change (entry1235 i).check = true at h
  rcases fields1235 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 92 ≤ d) (hhi : d < 409) :
    forwardStepOK (-768) (charge 92 d) shift (S (d + 1)) (S 93)
      (T 92 (d + 1)) (T 92 d) (T 93 d)
      (OriginalRow227Roots.root_pos 93 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 92 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    by_cases h156 : d < 156
    ·
      by_cases h124 : d < 124
      ·
        have hi : d - 92 < 32 := by omega
        have heq : 92 + (d - 92) = d := by omega
        simpa only [heq] using step1226 ⟨d - 92, hi⟩
      ·
        have hi : d - 124 < 32 := by omega
        have heq : 124 + (d - 124) = d := by omega
        simpa only [heq] using step1227 ⟨d - 124, hi⟩
    ·
      by_cases h188 : d < 188
      ·
        have hi : d - 156 < 32 := by omega
        have heq : 156 + (d - 156) = d := by omega
        simpa only [heq] using step1228 ⟨d - 156, hi⟩
      ·
        by_cases h220 : d < 220
        ·
          have hi : d - 188 < 32 := by omega
          have heq : 188 + (d - 188) = d := by omega
          simpa only [heq] using step1229 ⟨d - 188, hi⟩
        ·
          have hi : d - 220 < 32 := by omega
          have heq : 220 + (d - 220) = d := by omega
          simpa only [heq] using step1230 ⟨d - 220, hi⟩
  ·
    by_cases h316 : d < 316
    ·
      by_cases h284 : d < 284
      ·
        have hi : d - 252 < 32 := by omega
        have heq : 252 + (d - 252) = d := by omega
        simpa only [heq] using step1231 ⟨d - 252, hi⟩
      ·
        have hi : d - 284 < 32 := by omega
        have heq : 284 + (d - 284) = d := by omega
        simpa only [heq] using step1232 ⟨d - 284, hi⟩
    ·
      by_cases h348 : d < 348
      ·
        have hi : d - 316 < 32 := by omega
        have heq : 316 + (d - 316) = d := by omega
        simpa only [heq] using step1233 ⟨d - 316, hi⟩
      ·
        by_cases h380 : d < 380
        ·
          have hi : d - 348 < 32 := by omega
          have heq : 348 + (d - 348) = d := by omega
          simpa only [heq] using step1234 ⟨d - 348, hi⟩
        ·
          have hi : d - 380 < 29 := by omega
          have heq : 380 + (d - 380) = d := by omega
          simpa only [heq] using step1235 ⟨d - 380, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1226,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1226,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1227,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1227,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1228,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1228,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1229,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1229,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1230,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1230,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1231,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1231,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1232,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1232,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1233,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1233,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1234,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1234,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.fields1235,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.step1235,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow093
