import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow094
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095
import Grothe.UpperChaos.OriginalRow227TriangleForward1246
import Grothe.UpperChaos.OriginalRow227TriangleForward1247
import Grothe.UpperChaos.OriginalRow227TriangleForward1248
import Grothe.UpperChaos.OriginalRow227TriangleForward1249
import Grothe.UpperChaos.OriginalRow227TriangleForward1250
import Grothe.UpperChaos.OriginalRow227TriangleForward1251
import Grothe.UpperChaos.OriginalRow227TriangleForward1252
import Grothe.UpperChaos.OriginalRow227TriangleForward1253
import Grothe.UpperChaos.OriginalRow227TriangleForward1254
import Grothe.UpperChaos.OriginalRow227TriangleForward1255

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1246 : OriginalRow227TriangleForward1246.entries.size = 32 := rfl

def entry1246 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1246.entries[i.val]'(by rw [size1246]; exact i.isLt)

theorem fields1246 (i : Fin 32) :
    (entry1246 i).IA = shift ∧ (entry1246 i).ID = S (94 + i.val + 1) ∧
      (entry1246 i).IC = S 95 ∧ (entry1246 i).Inext = T 94 (94 + i.val + 1) ∧
      (entry1246 i).Icur = T 94 (94 + i.val) ∧
      (entry1246 i).output = T 95 (94 + i.val) ∧
      (entry1246 i).charge = charge 94 (94 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1252_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1246 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (94 + i.val)) shift
      (S (94 + i.val + 1)) (S 95) (T 94 (94 + i.val + 1))
      (T 94 (94 + i.val)) (T 95 (94 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1246.entries OriginalRow227TriangleForward1246.checked
    ⟨i.val, by rw [size1246]; exact i.isLt⟩
  change (entry1246 i).check = true at h
  rcases fields1246 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1247 : OriginalRow227TriangleForward1247.entries.size = 32 := rfl

def entry1247 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1247.entries[i.val]'(by rw [size1247]; exact i.isLt)

theorem fields1247 (i : Fin 32) :
    (entry1247 i).IA = shift ∧ (entry1247 i).ID = S (126 + i.val + 1) ∧
      (entry1247 i).IC = S 95 ∧ (entry1247 i).Inext = T 94 (126 + i.val + 1) ∧
      (entry1247 i).Icur = T 94 (126 + i.val) ∧
      (entry1247 i).output = T 95 (126 + i.val) ∧
      (entry1247 i).charge = charge 94 (126 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1253_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1247 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (126 + i.val)) shift
      (S (126 + i.val + 1)) (S 95) (T 94 (126 + i.val + 1))
      (T 94 (126 + i.val)) (T 95 (126 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1247.entries OriginalRow227TriangleForward1247.checked
    ⟨i.val, by rw [size1247]; exact i.isLt⟩
  change (entry1247 i).check = true at h
  rcases fields1247 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1248 : OriginalRow227TriangleForward1248.entries.size = 32 := rfl

def entry1248 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1248.entries[i.val]'(by rw [size1248]; exact i.isLt)

theorem fields1248 (i : Fin 32) :
    (entry1248 i).IA = shift ∧ (entry1248 i).ID = S (158 + i.val + 1) ∧
      (entry1248 i).IC = S 95 ∧ (entry1248 i).Inext = T 94 (158 + i.val + 1) ∧
      (entry1248 i).Icur = T 94 (158 + i.val) ∧
      (entry1248 i).output = T 95 (158 + i.val) ∧
      (entry1248 i).charge = charge 94 (158 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1254_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1248 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (158 + i.val)) shift
      (S (158 + i.val + 1)) (S 95) (T 94 (158 + i.val + 1))
      (T 94 (158 + i.val)) (T 95 (158 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1248.entries OriginalRow227TriangleForward1248.checked
    ⟨i.val, by rw [size1248]; exact i.isLt⟩
  change (entry1248 i).check = true at h
  rcases fields1248 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1249 : OriginalRow227TriangleForward1249.entries.size = 32 := rfl

def entry1249 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1249.entries[i.val]'(by rw [size1249]; exact i.isLt)

theorem fields1249 (i : Fin 32) :
    (entry1249 i).IA = shift ∧ (entry1249 i).ID = S (190 + i.val + 1) ∧
      (entry1249 i).IC = S 95 ∧ (entry1249 i).Inext = T 94 (190 + i.val + 1) ∧
      (entry1249 i).Icur = T 94 (190 + i.val) ∧
      (entry1249 i).output = T 95 (190 + i.val) ∧
      (entry1249 i).charge = charge 94 (190 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1255_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1249 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (190 + i.val)) shift
      (S (190 + i.val + 1)) (S 95) (T 94 (190 + i.val + 1))
      (T 94 (190 + i.val)) (T 95 (190 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1249.entries OriginalRow227TriangleForward1249.checked
    ⟨i.val, by rw [size1249]; exact i.isLt⟩
  change (entry1249 i).check = true at h
  rcases fields1249 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1250 : OriginalRow227TriangleForward1250.entries.size = 32 := rfl

def entry1250 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1250.entries[i.val]'(by rw [size1250]; exact i.isLt)

theorem fields1250 (i : Fin 32) :
    (entry1250 i).IA = shift ∧ (entry1250 i).ID = S (222 + i.val + 1) ∧
      (entry1250 i).IC = S 95 ∧ (entry1250 i).Inext = T 94 (222 + i.val + 1) ∧
      (entry1250 i).Icur = T 94 (222 + i.val) ∧
      (entry1250 i).output = T 95 (222 + i.val) ∧
      (entry1250 i).charge = charge 94 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1256_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1250 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 95) (T 94 (222 + i.val + 1))
      (T 94 (222 + i.val)) (T 95 (222 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1250.entries OriginalRow227TriangleForward1250.checked
    ⟨i.val, by rw [size1250]; exact i.isLt⟩
  change (entry1250 i).check = true at h
  rcases fields1250 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1251 : OriginalRow227TriangleForward1251.entries.size = 32 := rfl

def entry1251 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1251.entries[i.val]'(by rw [size1251]; exact i.isLt)

theorem fields1251 (i : Fin 32) :
    (entry1251 i).IA = shift ∧ (entry1251 i).ID = S (254 + i.val + 1) ∧
      (entry1251 i).IC = S 95 ∧ (entry1251 i).Inext = T 94 (254 + i.val + 1) ∧
      (entry1251 i).Icur = T 94 (254 + i.val) ∧
      (entry1251 i).output = T 95 (254 + i.val) ∧
      (entry1251 i).charge = charge 94 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1257_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1251 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 95) (T 94 (254 + i.val + 1))
      (T 94 (254 + i.val)) (T 95 (254 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1251.entries OriginalRow227TriangleForward1251.checked
    ⟨i.val, by rw [size1251]; exact i.isLt⟩
  change (entry1251 i).check = true at h
  rcases fields1251 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1252 : OriginalRow227TriangleForward1252.entries.size = 32 := rfl

def entry1252 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1252.entries[i.val]'(by rw [size1252]; exact i.isLt)

theorem fields1252 (i : Fin 32) :
    (entry1252 i).IA = shift ∧ (entry1252 i).ID = S (286 + i.val + 1) ∧
      (entry1252 i).IC = S 95 ∧ (entry1252 i).Inext = T 94 (286 + i.val + 1) ∧
      (entry1252 i).Icur = T 94 (286 + i.val) ∧
      (entry1252 i).output = T 95 (286 + i.val) ∧
      (entry1252 i).charge = charge 94 (286 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1258_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1252 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (286 + i.val)) shift
      (S (286 + i.val + 1)) (S 95) (T 94 (286 + i.val + 1))
      (T 94 (286 + i.val)) (T 95 (286 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1252.entries OriginalRow227TriangleForward1252.checked
    ⟨i.val, by rw [size1252]; exact i.isLt⟩
  change (entry1252 i).check = true at h
  rcases fields1252 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1253 : OriginalRow227TriangleForward1253.entries.size = 32 := rfl

def entry1253 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1253.entries[i.val]'(by rw [size1253]; exact i.isLt)

theorem fields1253 (i : Fin 32) :
    (entry1253 i).IA = shift ∧ (entry1253 i).ID = S (318 + i.val + 1) ∧
      (entry1253 i).IC = S 95 ∧ (entry1253 i).Inext = T 94 (318 + i.val + 1) ∧
      (entry1253 i).Icur = T 94 (318 + i.val) ∧
      (entry1253 i).output = T 95 (318 + i.val) ∧
      (entry1253 i).charge = charge 94 (318 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1259_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1253 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (318 + i.val)) shift
      (S (318 + i.val + 1)) (S 95) (T 94 (318 + i.val + 1))
      (T 94 (318 + i.val)) (T 95 (318 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1253.entries OriginalRow227TriangleForward1253.checked
    ⟨i.val, by rw [size1253]; exact i.isLt⟩
  change (entry1253 i).check = true at h
  rcases fields1253 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1254 : OriginalRow227TriangleForward1254.entries.size = 32 := rfl

def entry1254 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1254.entries[i.val]'(by rw [size1254]; exact i.isLt)

theorem fields1254 (i : Fin 32) :
    (entry1254 i).IA = shift ∧ (entry1254 i).ID = S (350 + i.val + 1) ∧
      (entry1254 i).IC = S 95 ∧ (entry1254 i).Inext = T 94 (350 + i.val + 1) ∧
      (entry1254 i).Icur = T 94 (350 + i.val) ∧
      (entry1254 i).output = T 95 (350 + i.val) ∧
      (entry1254 i).charge = charge 94 (350 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1260_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1254 (i : Fin 32) :
    forwardStepOK (-768) (charge 94 (350 + i.val)) shift
      (S (350 + i.val + 1)) (S 95) (T 94 (350 + i.val + 1))
      (T 94 (350 + i.val)) (T 95 (350 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1254.entries OriginalRow227TriangleForward1254.checked
    ⟨i.val, by rw [size1254]; exact i.isLt⟩
  change (entry1254 i).check = true at h
  rcases fields1254 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1255 : OriginalRow227TriangleForward1255.entries.size = 25 := rfl

def entry1255 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1255.entries[i.val]'(by rw [size1255]; exact i.isLt)

theorem fields1255 (i : Fin 25) :
    (entry1255 i).IA = shift ∧ (entry1255 i).ID = S (382 + i.val + 1) ∧
      (entry1255 i).IC = S 95 ∧ (entry1255 i).Inext = T 94 (382 + i.val + 1) ∧
      (entry1255 i).Icur = T 94 (382 + i.val) ∧
      (entry1255 i).output = T 95 (382 + i.val) ∧
      (entry1255 i).charge = charge 94 (382 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root95).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow094.block1261_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1255 (i : Fin 25) :
    forwardStepOK (-768) (charge 94 (382 + i.val)) shift
      (S (382 + i.val + 1)) (S 95) (T 94 (382 + i.val + 1))
      (T 94 (382 + i.val)) (T 95 (382 + i.val))
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1255.entries OriginalRow227TriangleForward1255.checked
    ⟨i.val, by rw [size1255]; exact i.isLt⟩
  change (entry1255 i).check = true at h
  rcases fields1255 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 94 ≤ d) (hhi : d < 407) :
    forwardStepOK (-768) (charge 94 d) shift (S (d + 1)) (S 95)
      (T 94 (d + 1)) (T 94 d) (T 95 d)
      (OriginalRow227Roots.root_pos 95 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 94 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    by_cases h158 : d < 158
    ·
      by_cases h126 : d < 126
      ·
        have hi : d - 94 < 32 := by omega
        have heq : 94 + (d - 94) = d := by omega
        simpa only [heq] using step1246 ⟨d - 94, hi⟩
      ·
        have hi : d - 126 < 32 := by omega
        have heq : 126 + (d - 126) = d := by omega
        simpa only [heq] using step1247 ⟨d - 126, hi⟩
    ·
      by_cases h190 : d < 190
      ·
        have hi : d - 158 < 32 := by omega
        have heq : 158 + (d - 158) = d := by omega
        simpa only [heq] using step1248 ⟨d - 158, hi⟩
      ·
        by_cases h222 : d < 222
        ·
          have hi : d - 190 < 32 := by omega
          have heq : 190 + (d - 190) = d := by omega
          simpa only [heq] using step1249 ⟨d - 190, hi⟩
        ·
          have hi : d - 222 < 32 := by omega
          have heq : 222 + (d - 222) = d := by omega
          simpa only [heq] using step1250 ⟨d - 222, hi⟩
  ·
    by_cases h318 : d < 318
    ·
      by_cases h286 : d < 286
      ·
        have hi : d - 254 < 32 := by omega
        have heq : 254 + (d - 254) = d := by omega
        simpa only [heq] using step1251 ⟨d - 254, hi⟩
      ·
        have hi : d - 286 < 32 := by omega
        have heq : 286 + (d - 286) = d := by omega
        simpa only [heq] using step1252 ⟨d - 286, hi⟩
    ·
      by_cases h350 : d < 350
      ·
        have hi : d - 318 < 32 := by omega
        have heq : 318 + (d - 318) = d := by omega
        simpa only [heq] using step1253 ⟨d - 318, hi⟩
      ·
        by_cases h382 : d < 382
        ·
          have hi : d - 350 < 32 := by omega
          have heq : 350 + (d - 350) = d := by omega
          simpa only [heq] using step1254 ⟨d - 350, hi⟩
        ·
          have hi : d - 382 < 25 := by omega
          have heq : 382 + (d - 382) = d := by omega
          simpa only [heq] using step1255 ⟨d - 382, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1246,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1246,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1247,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1247,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1248,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1248,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1249,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1249,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1250,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1250,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1251,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1251,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1252,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1252,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1253,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1253,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1254,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1254,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.fields1255,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.step1255,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow095
