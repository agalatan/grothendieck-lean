import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017
import Grothe.UpperChaos.OriginalRow227TriangleForward0251
import Grothe.UpperChaos.OriginalRow227TriangleForward0252
import Grothe.UpperChaos.OriginalRow227TriangleForward0253
import Grothe.UpperChaos.OriginalRow227TriangleForward0254
import Grothe.UpperChaos.OriginalRow227TriangleForward0255
import Grothe.UpperChaos.OriginalRow227TriangleForward0256
import Grothe.UpperChaos.OriginalRow227TriangleForward0257
import Grothe.UpperChaos.OriginalRow227TriangleForward0258
import Grothe.UpperChaos.OriginalRow227TriangleForward0259
import Grothe.UpperChaos.OriginalRow227TriangleForward0260
import Grothe.UpperChaos.OriginalRow227TriangleForward0261
import Grothe.UpperChaos.OriginalRow227TriangleForward0262
import Grothe.UpperChaos.OriginalRow227TriangleForward0263
import Grothe.UpperChaos.OriginalRow227TriangleForward0264
import Grothe.UpperChaos.OriginalRow227TriangleForward0265

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0251 : OriginalRow227TriangleForward0251.entries.size = 32 := rfl

def entry0251 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0251.entries[i.val]'(by rw [size0251]; exact i.isLt)

theorem fields0251 (i : Fin 32) :
    (entry0251 i).IA = shift ∧ (entry0251 i).ID = S (16 + i.val + 1) ∧
      (entry0251 i).IC = S 17 ∧ (entry0251 i).Inext = T 16 (16 + i.val + 1) ∧
      (entry0251 i).Icur = T 16 (16 + i.val) ∧
      (entry0251 i).output = T 17 (16 + i.val) ∧
      (entry0251 i).charge = charge 16 (16 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0267_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0251 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (16 + i.val)) shift
      (S (16 + i.val + 1)) (S 17) (T 16 (16 + i.val + 1))
      (T 16 (16 + i.val)) (T 17 (16 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0251.entries OriginalRow227TriangleForward0251.checked
    ⟨i.val, by rw [size0251]; exact i.isLt⟩
  change (entry0251 i).check = true at h
  rcases fields0251 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0252 : OriginalRow227TriangleForward0252.entries.size = 32 := rfl

def entry0252 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0252.entries[i.val]'(by rw [size0252]; exact i.isLt)

theorem fields0252 (i : Fin 32) :
    (entry0252 i).IA = shift ∧ (entry0252 i).ID = S (48 + i.val + 1) ∧
      (entry0252 i).IC = S 17 ∧ (entry0252 i).Inext = T 16 (48 + i.val + 1) ∧
      (entry0252 i).Icur = T 16 (48 + i.val) ∧
      (entry0252 i).output = T 17 (48 + i.val) ∧
      (entry0252 i).charge = charge 16 (48 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0268_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0252 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (48 + i.val)) shift
      (S (48 + i.val + 1)) (S 17) (T 16 (48 + i.val + 1))
      (T 16 (48 + i.val)) (T 17 (48 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0252.entries OriginalRow227TriangleForward0252.checked
    ⟨i.val, by rw [size0252]; exact i.isLt⟩
  change (entry0252 i).check = true at h
  rcases fields0252 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0253 : OriginalRow227TriangleForward0253.entries.size = 32 := rfl

def entry0253 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0253.entries[i.val]'(by rw [size0253]; exact i.isLt)

theorem fields0253 (i : Fin 32) :
    (entry0253 i).IA = shift ∧ (entry0253 i).ID = S (80 + i.val + 1) ∧
      (entry0253 i).IC = S 17 ∧ (entry0253 i).Inext = T 16 (80 + i.val + 1) ∧
      (entry0253 i).Icur = T 16 (80 + i.val) ∧
      (entry0253 i).output = T 17 (80 + i.val) ∧
      (entry0253 i).charge = charge 16 (80 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0269_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0253 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (80 + i.val)) shift
      (S (80 + i.val + 1)) (S 17) (T 16 (80 + i.val + 1))
      (T 16 (80 + i.val)) (T 17 (80 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0253.entries OriginalRow227TriangleForward0253.checked
    ⟨i.val, by rw [size0253]; exact i.isLt⟩
  change (entry0253 i).check = true at h
  rcases fields0253 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0254 : OriginalRow227TriangleForward0254.entries.size = 32 := rfl

def entry0254 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0254.entries[i.val]'(by rw [size0254]; exact i.isLt)

theorem fields0254 (i : Fin 32) :
    (entry0254 i).IA = shift ∧ (entry0254 i).ID = S (112 + i.val + 1) ∧
      (entry0254 i).IC = S 17 ∧ (entry0254 i).Inext = T 16 (112 + i.val + 1) ∧
      (entry0254 i).Icur = T 16 (112 + i.val) ∧
      (entry0254 i).output = T 17 (112 + i.val) ∧
      (entry0254 i).charge = charge 16 (112 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0270_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0254 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (112 + i.val)) shift
      (S (112 + i.val + 1)) (S 17) (T 16 (112 + i.val + 1))
      (T 16 (112 + i.val)) (T 17 (112 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0254.entries OriginalRow227TriangleForward0254.checked
    ⟨i.val, by rw [size0254]; exact i.isLt⟩
  change (entry0254 i).check = true at h
  rcases fields0254 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0255 : OriginalRow227TriangleForward0255.entries.size = 32 := rfl

def entry0255 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0255.entries[i.val]'(by rw [size0255]; exact i.isLt)

theorem fields0255 (i : Fin 32) :
    (entry0255 i).IA = shift ∧ (entry0255 i).ID = S (144 + i.val + 1) ∧
      (entry0255 i).IC = S 17 ∧ (entry0255 i).Inext = T 16 (144 + i.val + 1) ∧
      (entry0255 i).Icur = T 16 (144 + i.val) ∧
      (entry0255 i).output = T 17 (144 + i.val) ∧
      (entry0255 i).charge = charge 16 (144 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0271_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0255 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (144 + i.val)) shift
      (S (144 + i.val + 1)) (S 17) (T 16 (144 + i.val + 1))
      (T 16 (144 + i.val)) (T 17 (144 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0255.entries OriginalRow227TriangleForward0255.checked
    ⟨i.val, by rw [size0255]; exact i.isLt⟩
  change (entry0255 i).check = true at h
  rcases fields0255 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0256 : OriginalRow227TriangleForward0256.entries.size = 32 := rfl

def entry0256 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0256.entries[i.val]'(by rw [size0256]; exact i.isLt)

theorem fields0256 (i : Fin 32) :
    (entry0256 i).IA = shift ∧ (entry0256 i).ID = S (176 + i.val + 1) ∧
      (entry0256 i).IC = S 17 ∧ (entry0256 i).Inext = T 16 (176 + i.val + 1) ∧
      (entry0256 i).Icur = T 16 (176 + i.val) ∧
      (entry0256 i).output = T 17 (176 + i.val) ∧
      (entry0256 i).charge = charge 16 (176 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0272_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0256 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (176 + i.val)) shift
      (S (176 + i.val + 1)) (S 17) (T 16 (176 + i.val + 1))
      (T 16 (176 + i.val)) (T 17 (176 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0256.entries OriginalRow227TriangleForward0256.checked
    ⟨i.val, by rw [size0256]; exact i.isLt⟩
  change (entry0256 i).check = true at h
  rcases fields0256 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0257 : OriginalRow227TriangleForward0257.entries.size = 32 := rfl

def entry0257 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0257.entries[i.val]'(by rw [size0257]; exact i.isLt)

theorem fields0257 (i : Fin 32) :
    (entry0257 i).IA = shift ∧ (entry0257 i).ID = S (208 + i.val + 1) ∧
      (entry0257 i).IC = S 17 ∧ (entry0257 i).Inext = T 16 (208 + i.val + 1) ∧
      (entry0257 i).Icur = T 16 (208 + i.val) ∧
      (entry0257 i).output = T 17 (208 + i.val) ∧
      (entry0257 i).charge = charge 16 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0273_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0257 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 17) (T 16 (208 + i.val + 1))
      (T 16 (208 + i.val)) (T 17 (208 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0257.entries OriginalRow227TriangleForward0257.checked
    ⟨i.val, by rw [size0257]; exact i.isLt⟩
  change (entry0257 i).check = true at h
  rcases fields0257 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0258 : OriginalRow227TriangleForward0258.entries.size = 32 := rfl

def entry0258 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0258.entries[i.val]'(by rw [size0258]; exact i.isLt)

theorem fields0258 (i : Fin 32) :
    (entry0258 i).IA = shift ∧ (entry0258 i).ID = S (240 + i.val + 1) ∧
      (entry0258 i).IC = S 17 ∧ (entry0258 i).Inext = T 16 (240 + i.val + 1) ∧
      (entry0258 i).Icur = T 16 (240 + i.val) ∧
      (entry0258 i).output = T 17 (240 + i.val) ∧
      (entry0258 i).charge = charge 16 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0274_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0258 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 17) (T 16 (240 + i.val + 1))
      (T 16 (240 + i.val)) (T 17 (240 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0258.entries OriginalRow227TriangleForward0258.checked
    ⟨i.val, by rw [size0258]; exact i.isLt⟩
  change (entry0258 i).check = true at h
  rcases fields0258 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0259 : OriginalRow227TriangleForward0259.entries.size = 32 := rfl

def entry0259 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0259.entries[i.val]'(by rw [size0259]; exact i.isLt)

theorem fields0259 (i : Fin 32) :
    (entry0259 i).IA = shift ∧ (entry0259 i).ID = S (272 + i.val + 1) ∧
      (entry0259 i).IC = S 17 ∧ (entry0259 i).Inext = T 16 (272 + i.val + 1) ∧
      (entry0259 i).Icur = T 16 (272 + i.val) ∧
      (entry0259 i).output = T 17 (272 + i.val) ∧
      (entry0259 i).charge = charge 16 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0275_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0259 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 17) (T 16 (272 + i.val + 1))
      (T 16 (272 + i.val)) (T 17 (272 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0259.entries OriginalRow227TriangleForward0259.checked
    ⟨i.val, by rw [size0259]; exact i.isLt⟩
  change (entry0259 i).check = true at h
  rcases fields0259 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0260 : OriginalRow227TriangleForward0260.entries.size = 32 := rfl

def entry0260 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0260.entries[i.val]'(by rw [size0260]; exact i.isLt)

theorem fields0260 (i : Fin 32) :
    (entry0260 i).IA = shift ∧ (entry0260 i).ID = S (304 + i.val + 1) ∧
      (entry0260 i).IC = S 17 ∧ (entry0260 i).Inext = T 16 (304 + i.val + 1) ∧
      (entry0260 i).Icur = T 16 (304 + i.val) ∧
      (entry0260 i).output = T 17 (304 + i.val) ∧
      (entry0260 i).charge = charge 16 (304 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0276_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0260 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (304 + i.val)) shift
      (S (304 + i.val + 1)) (S 17) (T 16 (304 + i.val + 1))
      (T 16 (304 + i.val)) (T 17 (304 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0260.entries OriginalRow227TriangleForward0260.checked
    ⟨i.val, by rw [size0260]; exact i.isLt⟩
  change (entry0260 i).check = true at h
  rcases fields0260 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0261 : OriginalRow227TriangleForward0261.entries.size = 32 := rfl

def entry0261 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0261.entries[i.val]'(by rw [size0261]; exact i.isLt)

theorem fields0261 (i : Fin 32) :
    (entry0261 i).IA = shift ∧ (entry0261 i).ID = S (336 + i.val + 1) ∧
      (entry0261 i).IC = S 17 ∧ (entry0261 i).Inext = T 16 (336 + i.val + 1) ∧
      (entry0261 i).Icur = T 16 (336 + i.val) ∧
      (entry0261 i).output = T 17 (336 + i.val) ∧
      (entry0261 i).charge = charge 16 (336 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0277_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0261 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (336 + i.val)) shift
      (S (336 + i.val + 1)) (S 17) (T 16 (336 + i.val + 1))
      (T 16 (336 + i.val)) (T 17 (336 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0261.entries OriginalRow227TriangleForward0261.checked
    ⟨i.val, by rw [size0261]; exact i.isLt⟩
  change (entry0261 i).check = true at h
  rcases fields0261 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0262 : OriginalRow227TriangleForward0262.entries.size = 32 := rfl

def entry0262 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0262.entries[i.val]'(by rw [size0262]; exact i.isLt)

theorem fields0262 (i : Fin 32) :
    (entry0262 i).IA = shift ∧ (entry0262 i).ID = S (368 + i.val + 1) ∧
      (entry0262 i).IC = S 17 ∧ (entry0262 i).Inext = T 16 (368 + i.val + 1) ∧
      (entry0262 i).Icur = T 16 (368 + i.val) ∧
      (entry0262 i).output = T 17 (368 + i.val) ∧
      (entry0262 i).charge = charge 16 (368 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0278_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0262 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (368 + i.val)) shift
      (S (368 + i.val + 1)) (S 17) (T 16 (368 + i.val + 1))
      (T 16 (368 + i.val)) (T 17 (368 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0262.entries OriginalRow227TriangleForward0262.checked
    ⟨i.val, by rw [size0262]; exact i.isLt⟩
  change (entry0262 i).check = true at h
  rcases fields0262 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0263 : OriginalRow227TriangleForward0263.entries.size = 32 := rfl

def entry0263 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0263.entries[i.val]'(by rw [size0263]; exact i.isLt)

theorem fields0263 (i : Fin 32) :
    (entry0263 i).IA = shift ∧ (entry0263 i).ID = S (400 + i.val + 1) ∧
      (entry0263 i).IC = S 17 ∧ (entry0263 i).Inext = T 16 (400 + i.val + 1) ∧
      (entry0263 i).Icur = T 16 (400 + i.val) ∧
      (entry0263 i).output = T 17 (400 + i.val) ∧
      (entry0263 i).charge = charge 16 (400 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0279_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0263 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (400 + i.val)) shift
      (S (400 + i.val + 1)) (S 17) (T 16 (400 + i.val + 1))
      (T 16 (400 + i.val)) (T 17 (400 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0263.entries OriginalRow227TriangleForward0263.checked
    ⟨i.val, by rw [size0263]; exact i.isLt⟩
  change (entry0263 i).check = true at h
  rcases fields0263 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0264 : OriginalRow227TriangleForward0264.entries.size = 32 := rfl

def entry0264 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0264.entries[i.val]'(by rw [size0264]; exact i.isLt)

theorem fields0264 (i : Fin 32) :
    (entry0264 i).IA = shift ∧ (entry0264 i).ID = S (432 + i.val + 1) ∧
      (entry0264 i).IC = S 17 ∧ (entry0264 i).Inext = T 16 (432 + i.val + 1) ∧
      (entry0264 i).Icur = T 16 (432 + i.val) ∧
      (entry0264 i).output = T 17 (432 + i.val) ∧
      (entry0264 i).charge = charge 16 (432 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0280_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0264 (i : Fin 32) :
    forwardStepOK (-768) (charge 16 (432 + i.val)) shift
      (S (432 + i.val + 1)) (S 17) (T 16 (432 + i.val + 1))
      (T 16 (432 + i.val)) (T 17 (432 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0264.entries OriginalRow227TriangleForward0264.checked
    ⟨i.val, by rw [size0264]; exact i.isLt⟩
  change (entry0264 i).check = true at h
  rcases fields0264 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0265 : OriginalRow227TriangleForward0265.entries.size = 21 := rfl

def entry0265 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0265.entries[i.val]'(by rw [size0265]; exact i.isLt)

theorem fields0265 (i : Fin 21) :
    (entry0265 i).IA = shift ∧ (entry0265 i).ID = S (464 + i.val + 1) ∧
      (entry0265 i).IC = S 17 ∧ (entry0265 i).Inext = T 16 (464 + i.val + 1) ∧
      (entry0265 i).Icur = T 16 (464 + i.val) ∧
      (entry0265 i).output = T 17 (464 + i.val) ∧
      (entry0265 i).charge = charge 16 (464 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root17).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow017.block0281_value ⟨20, by decide⟩).symm, rfl⟩

theorem step0265 (i : Fin 21) :
    forwardStepOK (-768) (charge 16 (464 + i.val)) shift
      (S (464 + i.val + 1)) (S 17) (T 16 (464 + i.val + 1))
      (T 16 (464 + i.val)) (T 17 (464 + i.val))
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0265.entries OriginalRow227TriangleForward0265.checked
    ⟨i.val, by rw [size0265]; exact i.isLt⟩
  change (entry0265 i).check = true at h
  rcases fields0265 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 16 ≤ d) (hhi : d < 485) :
    forwardStepOK (-768) (charge 16 d) shift (S (d + 1)) (S 17)
      (T 16 (d + 1)) (T 16 d) (T 17 d)
      (OriginalRow227Roots.root_pos 17 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 16 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    by_cases h112 : d < 112
    ·
      by_cases h48 : d < 48
      ·
        have hi : d - 16 < 32 := by omega
        have heq : 16 + (d - 16) = d := by omega
        simpa only [heq] using step0251 ⟨d - 16, hi⟩
      ·
        by_cases h80 : d < 80
        ·
          have hi : d - 48 < 32 := by omega
          have heq : 48 + (d - 48) = d := by omega
          simpa only [heq] using step0252 ⟨d - 48, hi⟩
        ·
          have hi : d - 80 < 32 := by omega
          have heq : 80 + (d - 80) = d := by omega
          simpa only [heq] using step0253 ⟨d - 80, hi⟩
    ·
      by_cases h176 : d < 176
      ·
        by_cases h144 : d < 144
        ·
          have hi : d - 112 < 32 := by omega
          have heq : 112 + (d - 112) = d := by omega
          simpa only [heq] using step0254 ⟨d - 112, hi⟩
        ·
          have hi : d - 144 < 32 := by omega
          have heq : 144 + (d - 144) = d := by omega
          simpa only [heq] using step0255 ⟨d - 144, hi⟩
      ·
        by_cases h208 : d < 208
        ·
          have hi : d - 176 < 32 := by omega
          have heq : 176 + (d - 176) = d := by omega
          simpa only [heq] using step0256 ⟨d - 176, hi⟩
        ·
          have hi : d - 208 < 32 := by omega
          have heq : 208 + (d - 208) = d := by omega
          simpa only [heq] using step0257 ⟨d - 208, hi⟩
  ·
    by_cases h368 : d < 368
    ·
      by_cases h304 : d < 304
      ·
        by_cases h272 : d < 272
        ·
          have hi : d - 240 < 32 := by omega
          have heq : 240 + (d - 240) = d := by omega
          simpa only [heq] using step0258 ⟨d - 240, hi⟩
        ·
          have hi : d - 272 < 32 := by omega
          have heq : 272 + (d - 272) = d := by omega
          simpa only [heq] using step0259 ⟨d - 272, hi⟩
      ·
        by_cases h336 : d < 336
        ·
          have hi : d - 304 < 32 := by omega
          have heq : 304 + (d - 304) = d := by omega
          simpa only [heq] using step0260 ⟨d - 304, hi⟩
        ·
          have hi : d - 336 < 32 := by omega
          have heq : 336 + (d - 336) = d := by omega
          simpa only [heq] using step0261 ⟨d - 336, hi⟩
    ·
      by_cases h432 : d < 432
      ·
        by_cases h400 : d < 400
        ·
          have hi : d - 368 < 32 := by omega
          have heq : 368 + (d - 368) = d := by omega
          simpa only [heq] using step0262 ⟨d - 368, hi⟩
        ·
          have hi : d - 400 < 32 := by omega
          have heq : 400 + (d - 400) = d := by omega
          simpa only [heq] using step0263 ⟨d - 400, hi⟩
      ·
        by_cases h464 : d < 464
        ·
          have hi : d - 432 < 32 := by omega
          have heq : 432 + (d - 432) = d := by omega
          simpa only [heq] using step0264 ⟨d - 432, hi⟩
        ·
          have hi : d - 464 < 21 := by omega
          have heq : 464 + (d - 464) = d := by omega
          simpa only [heq] using step0265 ⟨d - 464, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0251,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0251,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0252,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0252,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0253,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0253,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0254,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0254,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0255,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0255,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0256,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0256,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0257,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0257,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0258,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0258,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0259,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0259,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0260,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0260,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0261,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0261,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0262,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0262,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0263,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0263,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0264,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0264,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.fields0265,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.step0265,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow017
