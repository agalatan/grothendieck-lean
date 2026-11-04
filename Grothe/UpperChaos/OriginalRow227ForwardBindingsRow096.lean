import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow095
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow096
import Grothe.UpperChaos.OriginalRow227TriangleForward1256
import Grothe.UpperChaos.OriginalRow227TriangleForward1257
import Grothe.UpperChaos.OriginalRow227TriangleForward1258
import Grothe.UpperChaos.OriginalRow227TriangleForward1259
import Grothe.UpperChaos.OriginalRow227TriangleForward1260
import Grothe.UpperChaos.OriginalRow227TriangleForward1261
import Grothe.UpperChaos.OriginalRow227TriangleForward1262
import Grothe.UpperChaos.OriginalRow227TriangleForward1263
import Grothe.UpperChaos.OriginalRow227TriangleForward1264
import Grothe.UpperChaos.OriginalRow227TriangleForward1265

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1256 : OriginalRow227TriangleForward1256.entries.size = 32 := rfl

def entry1256 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1256.entries[i.val]'(by rw [size1256]; exact i.isLt)

theorem fields1256 (i : Fin 32) :
    (entry1256 i).IA = shift ∧ (entry1256 i).ID = S (95 + i.val + 1) ∧
      (entry1256 i).IC = S 96 ∧ (entry1256 i).Inext = T 95 (95 + i.val + 1) ∧
      (entry1256 i).Icur = T 95 (95 + i.val) ∧
      (entry1256 i).output = T 96 (95 + i.val) ∧
      (entry1256 i).charge = charge 95 (95 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1262_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1272_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1256 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (95 + i.val)) shift
      (S (95 + i.val + 1)) (S 96) (T 95 (95 + i.val + 1))
      (T 95 (95 + i.val)) (T 96 (95 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1256.entries OriginalRow227TriangleForward1256.checked
    ⟨i.val, by rw [size1256]; exact i.isLt⟩
  change (entry1256 i).check = true at h
  rcases fields1256 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1257 : OriginalRow227TriangleForward1257.entries.size = 32 := rfl

def entry1257 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1257.entries[i.val]'(by rw [size1257]; exact i.isLt)

theorem fields1257 (i : Fin 32) :
    (entry1257 i).IA = shift ∧ (entry1257 i).ID = S (127 + i.val + 1) ∧
      (entry1257 i).IC = S 96 ∧ (entry1257 i).Inext = T 95 (127 + i.val + 1) ∧
      (entry1257 i).Icur = T 95 (127 + i.val) ∧
      (entry1257 i).output = T 96 (127 + i.val) ∧
      (entry1257 i).charge = charge 95 (127 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1263_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1273_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1257 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (127 + i.val)) shift
      (S (127 + i.val + 1)) (S 96) (T 95 (127 + i.val + 1))
      (T 95 (127 + i.val)) (T 96 (127 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1257.entries OriginalRow227TriangleForward1257.checked
    ⟨i.val, by rw [size1257]; exact i.isLt⟩
  change (entry1257 i).check = true at h
  rcases fields1257 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1258 : OriginalRow227TriangleForward1258.entries.size = 32 := rfl

def entry1258 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1258.entries[i.val]'(by rw [size1258]; exact i.isLt)

theorem fields1258 (i : Fin 32) :
    (entry1258 i).IA = shift ∧ (entry1258 i).ID = S (159 + i.val + 1) ∧
      (entry1258 i).IC = S 96 ∧ (entry1258 i).Inext = T 95 (159 + i.val + 1) ∧
      (entry1258 i).Icur = T 95 (159 + i.val) ∧
      (entry1258 i).output = T 96 (159 + i.val) ∧
      (entry1258 i).charge = charge 95 (159 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1264_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1274_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1258 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (159 + i.val)) shift
      (S (159 + i.val + 1)) (S 96) (T 95 (159 + i.val + 1))
      (T 95 (159 + i.val)) (T 96 (159 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1258.entries OriginalRow227TriangleForward1258.checked
    ⟨i.val, by rw [size1258]; exact i.isLt⟩
  change (entry1258 i).check = true at h
  rcases fields1258 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1259 : OriginalRow227TriangleForward1259.entries.size = 32 := rfl

def entry1259 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1259.entries[i.val]'(by rw [size1259]; exact i.isLt)

theorem fields1259 (i : Fin 32) :
    (entry1259 i).IA = shift ∧ (entry1259 i).ID = S (191 + i.val + 1) ∧
      (entry1259 i).IC = S 96 ∧ (entry1259 i).Inext = T 95 (191 + i.val + 1) ∧
      (entry1259 i).Icur = T 95 (191 + i.val) ∧
      (entry1259 i).output = T 96 (191 + i.val) ∧
      (entry1259 i).charge = charge 95 (191 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1265_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1275_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1259 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (191 + i.val)) shift
      (S (191 + i.val + 1)) (S 96) (T 95 (191 + i.val + 1))
      (T 95 (191 + i.val)) (T 96 (191 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1259.entries OriginalRow227TriangleForward1259.checked
    ⟨i.val, by rw [size1259]; exact i.isLt⟩
  change (entry1259 i).check = true at h
  rcases fields1259 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1260 : OriginalRow227TriangleForward1260.entries.size = 32 := rfl

def entry1260 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1260.entries[i.val]'(by rw [size1260]; exact i.isLt)

theorem fields1260 (i : Fin 32) :
    (entry1260 i).IA = shift ∧ (entry1260 i).ID = S (223 + i.val + 1) ∧
      (entry1260 i).IC = S 96 ∧ (entry1260 i).Inext = T 95 (223 + i.val + 1) ∧
      (entry1260 i).Icur = T 95 (223 + i.val) ∧
      (entry1260 i).output = T 96 (223 + i.val) ∧
      (entry1260 i).charge = charge 95 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1266_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1276_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1260 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 96) (T 95 (223 + i.val + 1))
      (T 95 (223 + i.val)) (T 96 (223 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1260.entries OriginalRow227TriangleForward1260.checked
    ⟨i.val, by rw [size1260]; exact i.isLt⟩
  change (entry1260 i).check = true at h
  rcases fields1260 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1261 : OriginalRow227TriangleForward1261.entries.size = 32 := rfl

def entry1261 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1261.entries[i.val]'(by rw [size1261]; exact i.isLt)

theorem fields1261 (i : Fin 32) :
    (entry1261 i).IA = shift ∧ (entry1261 i).ID = S (255 + i.val + 1) ∧
      (entry1261 i).IC = S 96 ∧ (entry1261 i).Inext = T 95 (255 + i.val + 1) ∧
      (entry1261 i).Icur = T 95 (255 + i.val) ∧
      (entry1261 i).output = T 96 (255 + i.val) ∧
      (entry1261 i).charge = charge 95 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1267_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1277_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1261 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 96) (T 95 (255 + i.val + 1))
      (T 95 (255 + i.val)) (T 96 (255 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1261.entries OriginalRow227TriangleForward1261.checked
    ⟨i.val, by rw [size1261]; exact i.isLt⟩
  change (entry1261 i).check = true at h
  rcases fields1261 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1262 : OriginalRow227TriangleForward1262.entries.size = 32 := rfl

def entry1262 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1262.entries[i.val]'(by rw [size1262]; exact i.isLt)

theorem fields1262 (i : Fin 32) :
    (entry1262 i).IA = shift ∧ (entry1262 i).ID = S (287 + i.val + 1) ∧
      (entry1262 i).IC = S 96 ∧ (entry1262 i).Inext = T 95 (287 + i.val + 1) ∧
      (entry1262 i).Icur = T 95 (287 + i.val) ∧
      (entry1262 i).output = T 96 (287 + i.val) ∧
      (entry1262 i).charge = charge 95 (287 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1268_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1278_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1262 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (287 + i.val)) shift
      (S (287 + i.val + 1)) (S 96) (T 95 (287 + i.val + 1))
      (T 95 (287 + i.val)) (T 96 (287 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1262.entries OriginalRow227TriangleForward1262.checked
    ⟨i.val, by rw [size1262]; exact i.isLt⟩
  change (entry1262 i).check = true at h
  rcases fields1262 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1263 : OriginalRow227TriangleForward1263.entries.size = 32 := rfl

def entry1263 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1263.entries[i.val]'(by rw [size1263]; exact i.isLt)

theorem fields1263 (i : Fin 32) :
    (entry1263 i).IA = shift ∧ (entry1263 i).ID = S (319 + i.val + 1) ∧
      (entry1263 i).IC = S 96 ∧ (entry1263 i).Inext = T 95 (319 + i.val + 1) ∧
      (entry1263 i).Icur = T 95 (319 + i.val) ∧
      (entry1263 i).output = T 96 (319 + i.val) ∧
      (entry1263 i).charge = charge 95 (319 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1269_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1279_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1263 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (319 + i.val)) shift
      (S (319 + i.val + 1)) (S 96) (T 95 (319 + i.val + 1))
      (T 95 (319 + i.val)) (T 96 (319 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1263.entries OriginalRow227TriangleForward1263.checked
    ⟨i.val, by rw [size1263]; exact i.isLt⟩
  change (entry1263 i).check = true at h
  rcases fields1263 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1264 : OriginalRow227TriangleForward1264.entries.size = 32 := rfl

def entry1264 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1264.entries[i.val]'(by rw [size1264]; exact i.isLt)

theorem fields1264 (i : Fin 32) :
    (entry1264 i).IA = shift ∧ (entry1264 i).ID = S (351 + i.val + 1) ∧
      (entry1264 i).IC = S 96 ∧ (entry1264 i).Inext = T 95 (351 + i.val + 1) ∧
      (entry1264 i).Icur = T 95 (351 + i.val) ∧
      (entry1264 i).output = T 96 (351 + i.val) ∧
      (entry1264 i).charge = charge 95 (351 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1270_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1280_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1264 (i : Fin 32) :
    forwardStepOK (-768) (charge 95 (351 + i.val)) shift
      (S (351 + i.val + 1)) (S 96) (T 95 (351 + i.val + 1))
      (T 95 (351 + i.val)) (T 96 (351 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1264.entries OriginalRow227TriangleForward1264.checked
    ⟨i.val, by rw [size1264]; exact i.isLt⟩
  change (entry1264 i).check = true at h
  rcases fields1264 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1265 : OriginalRow227TriangleForward1265.entries.size = 23 := rfl

def entry1265 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1265.entries[i.val]'(by rw [size1265]; exact i.isLt)

theorem fields1265 (i : Fin 23) :
    (entry1265 i).IA = shift ∧ (entry1265 i).ID = S (383 + i.val + 1) ∧
      (entry1265 i).IC = S 96 ∧ (entry1265 i).Inext = T 95 (383 + i.val + 1) ∧
      (entry1265 i).Icur = T 95 (383 + i.val) ∧
      (entry1265 i).output = T 96 (383 + i.val) ∧
      (entry1265 i).charge = charge 95 (383 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root96).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow095.block1271_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow096.block1281_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1265 (i : Fin 23) :
    forwardStepOK (-768) (charge 95 (383 + i.val)) shift
      (S (383 + i.val + 1)) (S 96) (T 95 (383 + i.val + 1))
      (T 95 (383 + i.val)) (T 96 (383 + i.val))
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1265.entries OriginalRow227TriangleForward1265.checked
    ⟨i.val, by rw [size1265]; exact i.isLt⟩
  change (entry1265 i).check = true at h
  rcases fields1265 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 95 ≤ d) (hhi : d < 406) :
    forwardStepOK (-768) (charge 95 d) shift (S (d + 1)) (S 96)
      (T 95 (d + 1)) (T 95 d) (T 96 d)
      (OriginalRow227Roots.root_pos 96 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 95 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    by_cases h159 : d < 159
    ·
      by_cases h127 : d < 127
      ·
        have hi : d - 95 < 32 := by omega
        have heq : 95 + (d - 95) = d := by omega
        simpa only [heq] using step1256 ⟨d - 95, hi⟩
      ·
        have hi : d - 127 < 32 := by omega
        have heq : 127 + (d - 127) = d := by omega
        simpa only [heq] using step1257 ⟨d - 127, hi⟩
    ·
      by_cases h191 : d < 191
      ·
        have hi : d - 159 < 32 := by omega
        have heq : 159 + (d - 159) = d := by omega
        simpa only [heq] using step1258 ⟨d - 159, hi⟩
      ·
        by_cases h223 : d < 223
        ·
          have hi : d - 191 < 32 := by omega
          have heq : 191 + (d - 191) = d := by omega
          simpa only [heq] using step1259 ⟨d - 191, hi⟩
        ·
          have hi : d - 223 < 32 := by omega
          have heq : 223 + (d - 223) = d := by omega
          simpa only [heq] using step1260 ⟨d - 223, hi⟩
  ·
    by_cases h319 : d < 319
    ·
      by_cases h287 : d < 287
      ·
        have hi : d - 255 < 32 := by omega
        have heq : 255 + (d - 255) = d := by omega
        simpa only [heq] using step1261 ⟨d - 255, hi⟩
      ·
        have hi : d - 287 < 32 := by omega
        have heq : 287 + (d - 287) = d := by omega
        simpa only [heq] using step1262 ⟨d - 287, hi⟩
    ·
      by_cases h351 : d < 351
      ·
        have hi : d - 319 < 32 := by omega
        have heq : 319 + (d - 319) = d := by omega
        simpa only [heq] using step1263 ⟨d - 319, hi⟩
      ·
        by_cases h383 : d < 383
        ·
          have hi : d - 351 < 32 := by omega
          have heq : 351 + (d - 351) = d := by omega
          simpa only [heq] using step1264 ⟨d - 351, hi⟩
        ·
          have hi : d - 383 < 23 := by omega
          have heq : 383 + (d - 383) = d := by omega
          simpa only [heq] using step1265 ⟨d - 383, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1256,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1256,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1257,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1257,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1258,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1258,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1259,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1259,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1260,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1260,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1261,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1261,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1262,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1262,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1263,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1263,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1264,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1264,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.fields1265,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.step1265,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow096
