import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow098
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow099
import Grothe.UpperChaos.OriginalRow227TriangleForward1286
import Grothe.UpperChaos.OriginalRow227TriangleForward1287
import Grothe.UpperChaos.OriginalRow227TriangleForward1288
import Grothe.UpperChaos.OriginalRow227TriangleForward1289
import Grothe.UpperChaos.OriginalRow227TriangleForward1290
import Grothe.UpperChaos.OriginalRow227TriangleForward1291
import Grothe.UpperChaos.OriginalRow227TriangleForward1292
import Grothe.UpperChaos.OriginalRow227TriangleForward1293
import Grothe.UpperChaos.OriginalRow227TriangleForward1294
import Grothe.UpperChaos.OriginalRow227TriangleForward1295

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1286 : OriginalRow227TriangleForward1286.entries.size = 32 := rfl

def entry1286 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1286.entries[i.val]'(by rw [size1286]; exact i.isLt)

theorem fields1286 (i : Fin 32) :
    (entry1286 i).IA = shift ∧ (entry1286 i).ID = S (98 + i.val + 1) ∧
      (entry1286 i).IC = S 99 ∧ (entry1286 i).Inext = T 98 (98 + i.val + 1) ∧
      (entry1286 i).Icur = T 98 (98 + i.val) ∧
      (entry1286 i).output = T 99 (98 + i.val) ∧
      (entry1286 i).charge = charge 98 (98 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1292_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1302_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1286 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (98 + i.val)) shift
      (S (98 + i.val + 1)) (S 99) (T 98 (98 + i.val + 1))
      (T 98 (98 + i.val)) (T 99 (98 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1286.entries OriginalRow227TriangleForward1286.checked
    ⟨i.val, by rw [size1286]; exact i.isLt⟩
  change (entry1286 i).check = true at h
  rcases fields1286 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1287 : OriginalRow227TriangleForward1287.entries.size = 32 := rfl

def entry1287 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1287.entries[i.val]'(by rw [size1287]; exact i.isLt)

theorem fields1287 (i : Fin 32) :
    (entry1287 i).IA = shift ∧ (entry1287 i).ID = S (130 + i.val + 1) ∧
      (entry1287 i).IC = S 99 ∧ (entry1287 i).Inext = T 98 (130 + i.val + 1) ∧
      (entry1287 i).Icur = T 98 (130 + i.val) ∧
      (entry1287 i).output = T 99 (130 + i.val) ∧
      (entry1287 i).charge = charge 98 (130 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1293_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1303_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1287 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (130 + i.val)) shift
      (S (130 + i.val + 1)) (S 99) (T 98 (130 + i.val + 1))
      (T 98 (130 + i.val)) (T 99 (130 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1287.entries OriginalRow227TriangleForward1287.checked
    ⟨i.val, by rw [size1287]; exact i.isLt⟩
  change (entry1287 i).check = true at h
  rcases fields1287 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1288 : OriginalRow227TriangleForward1288.entries.size = 32 := rfl

def entry1288 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1288.entries[i.val]'(by rw [size1288]; exact i.isLt)

theorem fields1288 (i : Fin 32) :
    (entry1288 i).IA = shift ∧ (entry1288 i).ID = S (162 + i.val + 1) ∧
      (entry1288 i).IC = S 99 ∧ (entry1288 i).Inext = T 98 (162 + i.val + 1) ∧
      (entry1288 i).Icur = T 98 (162 + i.val) ∧
      (entry1288 i).output = T 99 (162 + i.val) ∧
      (entry1288 i).charge = charge 98 (162 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1294_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1304_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1288 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (162 + i.val)) shift
      (S (162 + i.val + 1)) (S 99) (T 98 (162 + i.val + 1))
      (T 98 (162 + i.val)) (T 99 (162 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1288.entries OriginalRow227TriangleForward1288.checked
    ⟨i.val, by rw [size1288]; exact i.isLt⟩
  change (entry1288 i).check = true at h
  rcases fields1288 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1289 : OriginalRow227TriangleForward1289.entries.size = 32 := rfl

def entry1289 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1289.entries[i.val]'(by rw [size1289]; exact i.isLt)

theorem fields1289 (i : Fin 32) :
    (entry1289 i).IA = shift ∧ (entry1289 i).ID = S (194 + i.val + 1) ∧
      (entry1289 i).IC = S 99 ∧ (entry1289 i).Inext = T 98 (194 + i.val + 1) ∧
      (entry1289 i).Icur = T 98 (194 + i.val) ∧
      (entry1289 i).output = T 99 (194 + i.val) ∧
      (entry1289 i).charge = charge 98 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1295_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1305_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1289 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 99) (T 98 (194 + i.val + 1))
      (T 98 (194 + i.val)) (T 99 (194 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1289.entries OriginalRow227TriangleForward1289.checked
    ⟨i.val, by rw [size1289]; exact i.isLt⟩
  change (entry1289 i).check = true at h
  rcases fields1289 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1290 : OriginalRow227TriangleForward1290.entries.size = 32 := rfl

def entry1290 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1290.entries[i.val]'(by rw [size1290]; exact i.isLt)

theorem fields1290 (i : Fin 32) :
    (entry1290 i).IA = shift ∧ (entry1290 i).ID = S (226 + i.val + 1) ∧
      (entry1290 i).IC = S 99 ∧ (entry1290 i).Inext = T 98 (226 + i.val + 1) ∧
      (entry1290 i).Icur = T 98 (226 + i.val) ∧
      (entry1290 i).output = T 99 (226 + i.val) ∧
      (entry1290 i).charge = charge 98 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1296_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1306_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1290 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 99) (T 98 (226 + i.val + 1))
      (T 98 (226 + i.val)) (T 99 (226 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1290.entries OriginalRow227TriangleForward1290.checked
    ⟨i.val, by rw [size1290]; exact i.isLt⟩
  change (entry1290 i).check = true at h
  rcases fields1290 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1291 : OriginalRow227TriangleForward1291.entries.size = 32 := rfl

def entry1291 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1291.entries[i.val]'(by rw [size1291]; exact i.isLt)

theorem fields1291 (i : Fin 32) :
    (entry1291 i).IA = shift ∧ (entry1291 i).ID = S (258 + i.val + 1) ∧
      (entry1291 i).IC = S 99 ∧ (entry1291 i).Inext = T 98 (258 + i.val + 1) ∧
      (entry1291 i).Icur = T 98 (258 + i.val) ∧
      (entry1291 i).output = T 99 (258 + i.val) ∧
      (entry1291 i).charge = charge 98 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1297_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1307_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1291 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 99) (T 98 (258 + i.val + 1))
      (T 98 (258 + i.val)) (T 99 (258 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1291.entries OriginalRow227TriangleForward1291.checked
    ⟨i.val, by rw [size1291]; exact i.isLt⟩
  change (entry1291 i).check = true at h
  rcases fields1291 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1292 : OriginalRow227TriangleForward1292.entries.size = 32 := rfl

def entry1292 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1292.entries[i.val]'(by rw [size1292]; exact i.isLt)

theorem fields1292 (i : Fin 32) :
    (entry1292 i).IA = shift ∧ (entry1292 i).ID = S (290 + i.val + 1) ∧
      (entry1292 i).IC = S 99 ∧ (entry1292 i).Inext = T 98 (290 + i.val + 1) ∧
      (entry1292 i).Icur = T 98 (290 + i.val) ∧
      (entry1292 i).output = T 99 (290 + i.val) ∧
      (entry1292 i).charge = charge 98 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1298_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1308_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1292 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 99) (T 98 (290 + i.val + 1))
      (T 98 (290 + i.val)) (T 99 (290 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1292.entries OriginalRow227TriangleForward1292.checked
    ⟨i.val, by rw [size1292]; exact i.isLt⟩
  change (entry1292 i).check = true at h
  rcases fields1292 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1293 : OriginalRow227TriangleForward1293.entries.size = 32 := rfl

def entry1293 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1293.entries[i.val]'(by rw [size1293]; exact i.isLt)

theorem fields1293 (i : Fin 32) :
    (entry1293 i).IA = shift ∧ (entry1293 i).ID = S (322 + i.val + 1) ∧
      (entry1293 i).IC = S 99 ∧ (entry1293 i).Inext = T 98 (322 + i.val + 1) ∧
      (entry1293 i).Icur = T 98 (322 + i.val) ∧
      (entry1293 i).output = T 99 (322 + i.val) ∧
      (entry1293 i).charge = charge 98 (322 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1299_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1309_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1293 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (322 + i.val)) shift
      (S (322 + i.val + 1)) (S 99) (T 98 (322 + i.val + 1))
      (T 98 (322 + i.val)) (T 99 (322 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1293.entries OriginalRow227TriangleForward1293.checked
    ⟨i.val, by rw [size1293]; exact i.isLt⟩
  change (entry1293 i).check = true at h
  rcases fields1293 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1294 : OriginalRow227TriangleForward1294.entries.size = 32 := rfl

def entry1294 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1294.entries[i.val]'(by rw [size1294]; exact i.isLt)

theorem fields1294 (i : Fin 32) :
    (entry1294 i).IA = shift ∧ (entry1294 i).ID = S (354 + i.val + 1) ∧
      (entry1294 i).IC = S 99 ∧ (entry1294 i).Inext = T 98 (354 + i.val + 1) ∧
      (entry1294 i).Icur = T 98 (354 + i.val) ∧
      (entry1294 i).output = T 99 (354 + i.val) ∧
      (entry1294 i).charge = charge 98 (354 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1300_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1310_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1294 (i : Fin 32) :
    forwardStepOK (-768) (charge 98 (354 + i.val)) shift
      (S (354 + i.val + 1)) (S 99) (T 98 (354 + i.val + 1))
      (T 98 (354 + i.val)) (T 99 (354 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1294.entries OriginalRow227TriangleForward1294.checked
    ⟨i.val, by rw [size1294]; exact i.isLt⟩
  change (entry1294 i).check = true at h
  rcases fields1294 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1295 : OriginalRow227TriangleForward1295.entries.size = 17 := rfl

def entry1295 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1295.entries[i.val]'(by rw [size1295]; exact i.isLt)

theorem fields1295 (i : Fin 17) :
    (entry1295 i).IA = shift ∧ (entry1295 i).ID = S (386 + i.val + 1) ∧
      (entry1295 i).IC = S 99 ∧ (entry1295 i).Inext = T 98 (386 + i.val + 1) ∧
      (entry1295 i).Icur = T 98 (386 + i.val) ∧
      (entry1295 i).output = T 99 (386 + i.val) ∧
      (entry1295 i).charge = charge 98 (386 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings03.S_eq_root99).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow098.block1301_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow099.block1311_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1295 (i : Fin 17) :
    forwardStepOK (-768) (charge 98 (386 + i.val)) shift
      (S (386 + i.val + 1)) (S 99) (T 98 (386 + i.val + 1))
      (T 98 (386 + i.val)) (T 99 (386 + i.val))
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1295.entries OriginalRow227TriangleForward1295.checked
    ⟨i.val, by rw [size1295]; exact i.isLt⟩
  change (entry1295 i).check = true at h
  rcases fields1295 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 98 ≤ d) (hhi : d < 403) :
    forwardStepOK (-768) (charge 98 d) shift (S (d + 1)) (S 99)
      (T 98 (d + 1)) (T 98 d) (T 99 d)
      (OriginalRow227Roots.root_pos 99 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 98 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h162 : d < 162
    ·
      by_cases h130 : d < 130
      ·
        have hi : d - 98 < 32 := by omega
        have heq : 98 + (d - 98) = d := by omega
        simpa only [heq] using step1286 ⟨d - 98, hi⟩
      ·
        have hi : d - 130 < 32 := by omega
        have heq : 130 + (d - 130) = d := by omega
        simpa only [heq] using step1287 ⟨d - 130, hi⟩
    ·
      by_cases h194 : d < 194
      ·
        have hi : d - 162 < 32 := by omega
        have heq : 162 + (d - 162) = d := by omega
        simpa only [heq] using step1288 ⟨d - 162, hi⟩
      ·
        by_cases h226 : d < 226
        ·
          have hi : d - 194 < 32 := by omega
          have heq : 194 + (d - 194) = d := by omega
          simpa only [heq] using step1289 ⟨d - 194, hi⟩
        ·
          have hi : d - 226 < 32 := by omega
          have heq : 226 + (d - 226) = d := by omega
          simpa only [heq] using step1290 ⟨d - 226, hi⟩
  ·
    by_cases h322 : d < 322
    ·
      by_cases h290 : d < 290
      ·
        have hi : d - 258 < 32 := by omega
        have heq : 258 + (d - 258) = d := by omega
        simpa only [heq] using step1291 ⟨d - 258, hi⟩
      ·
        have hi : d - 290 < 32 := by omega
        have heq : 290 + (d - 290) = d := by omega
        simpa only [heq] using step1292 ⟨d - 290, hi⟩
    ·
      by_cases h354 : d < 354
      ·
        have hi : d - 322 < 32 := by omega
        have heq : 322 + (d - 322) = d := by omega
        simpa only [heq] using step1293 ⟨d - 322, hi⟩
      ·
        by_cases h386 : d < 386
        ·
          have hi : d - 354 < 32 := by omega
          have heq : 354 + (d - 354) = d := by omega
          simpa only [heq] using step1294 ⟨d - 354, hi⟩
        ·
          have hi : d - 386 < 17 := by omega
          have heq : 386 + (d - 386) = d := by omega
          simpa only [heq] using step1295 ⟨d - 386, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1286,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1286,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1287,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1287,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1288,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1288,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1289,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1289,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1290,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1290,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1291,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1291,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1292,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1292,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1293,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1293,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1294,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1294,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.fields1295,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.step1295,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow099
