import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow093
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow094
import Grothe.UpperChaos.OriginalRow227TriangleForward1236
import Grothe.UpperChaos.OriginalRow227TriangleForward1237
import Grothe.UpperChaos.OriginalRow227TriangleForward1238
import Grothe.UpperChaos.OriginalRow227TriangleForward1239
import Grothe.UpperChaos.OriginalRow227TriangleForward1240
import Grothe.UpperChaos.OriginalRow227TriangleForward1241
import Grothe.UpperChaos.OriginalRow227TriangleForward1242
import Grothe.UpperChaos.OriginalRow227TriangleForward1243
import Grothe.UpperChaos.OriginalRow227TriangleForward1244
import Grothe.UpperChaos.OriginalRow227TriangleForward1245

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1236 : OriginalRow227TriangleForward1236.entries.size = 32 := rfl

def entry1236 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1236.entries[i.val]'(by rw [size1236]; exact i.isLt)

theorem fields1236 (i : Fin 32) :
    (entry1236 i).IA = shift ∧ (entry1236 i).ID = S (93 + i.val + 1) ∧
      (entry1236 i).IC = S 94 ∧ (entry1236 i).Inext = T 93 (93 + i.val + 1) ∧
      (entry1236 i).Icur = T 93 (93 + i.val) ∧
      (entry1236 i).output = T 94 (93 + i.val) ∧
      (entry1236 i).charge = charge 93 (93 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1242_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1236 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (93 + i.val)) shift
      (S (93 + i.val + 1)) (S 94) (T 93 (93 + i.val + 1))
      (T 93 (93 + i.val)) (T 94 (93 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1236.entries OriginalRow227TriangleForward1236.checked
    ⟨i.val, by rw [size1236]; exact i.isLt⟩
  change (entry1236 i).check = true at h
  rcases fields1236 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1237 : OriginalRow227TriangleForward1237.entries.size = 32 := rfl

def entry1237 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1237.entries[i.val]'(by rw [size1237]; exact i.isLt)

theorem fields1237 (i : Fin 32) :
    (entry1237 i).IA = shift ∧ (entry1237 i).ID = S (125 + i.val + 1) ∧
      (entry1237 i).IC = S 94 ∧ (entry1237 i).Inext = T 93 (125 + i.val + 1) ∧
      (entry1237 i).Icur = T 93 (125 + i.val) ∧
      (entry1237 i).output = T 94 (125 + i.val) ∧
      (entry1237 i).charge = charge 93 (125 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1243_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1237 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (125 + i.val)) shift
      (S (125 + i.val + 1)) (S 94) (T 93 (125 + i.val + 1))
      (T 93 (125 + i.val)) (T 94 (125 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1237.entries OriginalRow227TriangleForward1237.checked
    ⟨i.val, by rw [size1237]; exact i.isLt⟩
  change (entry1237 i).check = true at h
  rcases fields1237 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1238 : OriginalRow227TriangleForward1238.entries.size = 32 := rfl

def entry1238 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1238.entries[i.val]'(by rw [size1238]; exact i.isLt)

theorem fields1238 (i : Fin 32) :
    (entry1238 i).IA = shift ∧ (entry1238 i).ID = S (157 + i.val + 1) ∧
      (entry1238 i).IC = S 94 ∧ (entry1238 i).Inext = T 93 (157 + i.val + 1) ∧
      (entry1238 i).Icur = T 93 (157 + i.val) ∧
      (entry1238 i).output = T 94 (157 + i.val) ∧
      (entry1238 i).charge = charge 93 (157 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1244_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1238 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (157 + i.val)) shift
      (S (157 + i.val + 1)) (S 94) (T 93 (157 + i.val + 1))
      (T 93 (157 + i.val)) (T 94 (157 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1238.entries OriginalRow227TriangleForward1238.checked
    ⟨i.val, by rw [size1238]; exact i.isLt⟩
  change (entry1238 i).check = true at h
  rcases fields1238 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1239 : OriginalRow227TriangleForward1239.entries.size = 32 := rfl

def entry1239 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1239.entries[i.val]'(by rw [size1239]; exact i.isLt)

theorem fields1239 (i : Fin 32) :
    (entry1239 i).IA = shift ∧ (entry1239 i).ID = S (189 + i.val + 1) ∧
      (entry1239 i).IC = S 94 ∧ (entry1239 i).Inext = T 93 (189 + i.val + 1) ∧
      (entry1239 i).Icur = T 93 (189 + i.val) ∧
      (entry1239 i).output = T 94 (189 + i.val) ∧
      (entry1239 i).charge = charge 93 (189 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1245_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1239 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (189 + i.val)) shift
      (S (189 + i.val + 1)) (S 94) (T 93 (189 + i.val + 1))
      (T 93 (189 + i.val)) (T 94 (189 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1239.entries OriginalRow227TriangleForward1239.checked
    ⟨i.val, by rw [size1239]; exact i.isLt⟩
  change (entry1239 i).check = true at h
  rcases fields1239 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1240 : OriginalRow227TriangleForward1240.entries.size = 32 := rfl

def entry1240 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1240.entries[i.val]'(by rw [size1240]; exact i.isLt)

theorem fields1240 (i : Fin 32) :
    (entry1240 i).IA = shift ∧ (entry1240 i).ID = S (221 + i.val + 1) ∧
      (entry1240 i).IC = S 94 ∧ (entry1240 i).Inext = T 93 (221 + i.val + 1) ∧
      (entry1240 i).Icur = T 93 (221 + i.val) ∧
      (entry1240 i).output = T 94 (221 + i.val) ∧
      (entry1240 i).charge = charge 93 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1246_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1240 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 94) (T 93 (221 + i.val + 1))
      (T 93 (221 + i.val)) (T 94 (221 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1240.entries OriginalRow227TriangleForward1240.checked
    ⟨i.val, by rw [size1240]; exact i.isLt⟩
  change (entry1240 i).check = true at h
  rcases fields1240 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1241 : OriginalRow227TriangleForward1241.entries.size = 32 := rfl

def entry1241 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1241.entries[i.val]'(by rw [size1241]; exact i.isLt)

theorem fields1241 (i : Fin 32) :
    (entry1241 i).IA = shift ∧ (entry1241 i).ID = S (253 + i.val + 1) ∧
      (entry1241 i).IC = S 94 ∧ (entry1241 i).Inext = T 93 (253 + i.val + 1) ∧
      (entry1241 i).Icur = T 93 (253 + i.val) ∧
      (entry1241 i).output = T 94 (253 + i.val) ∧
      (entry1241 i).charge = charge 93 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1247_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1241 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 94) (T 93 (253 + i.val + 1))
      (T 93 (253 + i.val)) (T 94 (253 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1241.entries OriginalRow227TriangleForward1241.checked
    ⟨i.val, by rw [size1241]; exact i.isLt⟩
  change (entry1241 i).check = true at h
  rcases fields1241 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1242 : OriginalRow227TriangleForward1242.entries.size = 32 := rfl

def entry1242 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1242.entries[i.val]'(by rw [size1242]; exact i.isLt)

theorem fields1242 (i : Fin 32) :
    (entry1242 i).IA = shift ∧ (entry1242 i).ID = S (285 + i.val + 1) ∧
      (entry1242 i).IC = S 94 ∧ (entry1242 i).Inext = T 93 (285 + i.val + 1) ∧
      (entry1242 i).Icur = T 93 (285 + i.val) ∧
      (entry1242 i).output = T 94 (285 + i.val) ∧
      (entry1242 i).charge = charge 93 (285 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1248_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1242 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (285 + i.val)) shift
      (S (285 + i.val + 1)) (S 94) (T 93 (285 + i.val + 1))
      (T 93 (285 + i.val)) (T 94 (285 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1242.entries OriginalRow227TriangleForward1242.checked
    ⟨i.val, by rw [size1242]; exact i.isLt⟩
  change (entry1242 i).check = true at h
  rcases fields1242 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1243 : OriginalRow227TriangleForward1243.entries.size = 32 := rfl

def entry1243 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1243.entries[i.val]'(by rw [size1243]; exact i.isLt)

theorem fields1243 (i : Fin 32) :
    (entry1243 i).IA = shift ∧ (entry1243 i).ID = S (317 + i.val + 1) ∧
      (entry1243 i).IC = S 94 ∧ (entry1243 i).Inext = T 93 (317 + i.val + 1) ∧
      (entry1243 i).Icur = T 93 (317 + i.val) ∧
      (entry1243 i).output = T 94 (317 + i.val) ∧
      (entry1243 i).charge = charge 93 (317 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1249_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1243 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (317 + i.val)) shift
      (S (317 + i.val + 1)) (S 94) (T 93 (317 + i.val + 1))
      (T 93 (317 + i.val)) (T 94 (317 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1243.entries OriginalRow227TriangleForward1243.checked
    ⟨i.val, by rw [size1243]; exact i.isLt⟩
  change (entry1243 i).check = true at h
  rcases fields1243 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1244 : OriginalRow227TriangleForward1244.entries.size = 32 := rfl

def entry1244 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1244.entries[i.val]'(by rw [size1244]; exact i.isLt)

theorem fields1244 (i : Fin 32) :
    (entry1244 i).IA = shift ∧ (entry1244 i).ID = S (349 + i.val + 1) ∧
      (entry1244 i).IC = S 94 ∧ (entry1244 i).Inext = T 93 (349 + i.val + 1) ∧
      (entry1244 i).Icur = T 93 (349 + i.val) ∧
      (entry1244 i).output = T 94 (349 + i.val) ∧
      (entry1244 i).charge = charge 93 (349 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1250_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1244 (i : Fin 32) :
    forwardStepOK (-768) (charge 93 (349 + i.val)) shift
      (S (349 + i.val + 1)) (S 94) (T 93 (349 + i.val + 1))
      (T 93 (349 + i.val)) (T 94 (349 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1244.entries OriginalRow227TriangleForward1244.checked
    ⟨i.val, by rw [size1244]; exact i.isLt⟩
  change (entry1244 i).check = true at h
  rcases fields1244 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1245 : OriginalRow227TriangleForward1245.entries.size = 27 := rfl

def entry1245 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1245.entries[i.val]'(by rw [size1245]; exact i.isLt)

theorem fields1245 (i : Fin 27) :
    (entry1245 i).IA = shift ∧ (entry1245 i).ID = S (381 + i.val + 1) ∧
      (entry1245 i).IC = S 94 ∧ (entry1245 i).Inext = T 93 (381 + i.val + 1) ∧
      (entry1245 i).Icur = T 93 (381 + i.val) ∧
      (entry1245 i).output = T 94 (381 + i.val) ∧
      (entry1245 i).charge = charge 93 (381 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root94).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow093.block1251_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1245 (i : Fin 27) :
    forwardStepOK (-768) (charge 93 (381 + i.val)) shift
      (S (381 + i.val + 1)) (S 94) (T 93 (381 + i.val + 1))
      (T 93 (381 + i.val)) (T 94 (381 + i.val))
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1245.entries OriginalRow227TriangleForward1245.checked
    ⟨i.val, by rw [size1245]; exact i.isLt⟩
  change (entry1245 i).check = true at h
  rcases fields1245 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 93 ≤ d) (hhi : d < 408) :
    forwardStepOK (-768) (charge 93 d) shift (S (d + 1)) (S 94)
      (T 93 (d + 1)) (T 93 d) (T 94 d)
      (OriginalRow227Roots.root_pos 94 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 93 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    by_cases h157 : d < 157
    ·
      by_cases h125 : d < 125
      ·
        have hi : d - 93 < 32 := by omega
        have heq : 93 + (d - 93) = d := by omega
        simpa only [heq] using step1236 ⟨d - 93, hi⟩
      ·
        have hi : d - 125 < 32 := by omega
        have heq : 125 + (d - 125) = d := by omega
        simpa only [heq] using step1237 ⟨d - 125, hi⟩
    ·
      by_cases h189 : d < 189
      ·
        have hi : d - 157 < 32 := by omega
        have heq : 157 + (d - 157) = d := by omega
        simpa only [heq] using step1238 ⟨d - 157, hi⟩
      ·
        by_cases h221 : d < 221
        ·
          have hi : d - 189 < 32 := by omega
          have heq : 189 + (d - 189) = d := by omega
          simpa only [heq] using step1239 ⟨d - 189, hi⟩
        ·
          have hi : d - 221 < 32 := by omega
          have heq : 221 + (d - 221) = d := by omega
          simpa only [heq] using step1240 ⟨d - 221, hi⟩
  ·
    by_cases h317 : d < 317
    ·
      by_cases h285 : d < 285
      ·
        have hi : d - 253 < 32 := by omega
        have heq : 253 + (d - 253) = d := by omega
        simpa only [heq] using step1241 ⟨d - 253, hi⟩
      ·
        have hi : d - 285 < 32 := by omega
        have heq : 285 + (d - 285) = d := by omega
        simpa only [heq] using step1242 ⟨d - 285, hi⟩
    ·
      by_cases h349 : d < 349
      ·
        have hi : d - 317 < 32 := by omega
        have heq : 317 + (d - 317) = d := by omega
        simpa only [heq] using step1243 ⟨d - 317, hi⟩
      ·
        by_cases h381 : d < 381
        ·
          have hi : d - 349 < 32 := by omega
          have heq : 349 + (d - 349) = d := by omega
          simpa only [heq] using step1244 ⟨d - 349, hi⟩
        ·
          have hi : d - 381 < 27 := by omega
          have heq : 381 + (d - 381) = d := by omega
          simpa only [heq] using step1245 ⟨d - 381, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1236,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1236,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1237,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1237,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1238,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1238,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1239,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1239,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1240,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1240,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1241,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1241,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1242,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1242,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1243,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1243,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1244,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1244,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.fields1245,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.step1245,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow094
