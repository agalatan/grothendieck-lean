import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016
import Grothe.UpperChaos.OriginalRow227TriangleForward0236
import Grothe.UpperChaos.OriginalRow227TriangleForward0237
import Grothe.UpperChaos.OriginalRow227TriangleForward0238
import Grothe.UpperChaos.OriginalRow227TriangleForward0239
import Grothe.UpperChaos.OriginalRow227TriangleForward0240
import Grothe.UpperChaos.OriginalRow227TriangleForward0241
import Grothe.UpperChaos.OriginalRow227TriangleForward0242
import Grothe.UpperChaos.OriginalRow227TriangleForward0243
import Grothe.UpperChaos.OriginalRow227TriangleForward0244
import Grothe.UpperChaos.OriginalRow227TriangleForward0245
import Grothe.UpperChaos.OriginalRow227TriangleForward0246
import Grothe.UpperChaos.OriginalRow227TriangleForward0247
import Grothe.UpperChaos.OriginalRow227TriangleForward0248
import Grothe.UpperChaos.OriginalRow227TriangleForward0249
import Grothe.UpperChaos.OriginalRow227TriangleForward0250

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0236 : OriginalRow227TriangleForward0236.entries.size = 32 := rfl

def entry0236 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0236.entries[i.val]'(by rw [size0236]; exact i.isLt)

theorem fields0236 (i : Fin 32) :
    (entry0236 i).IA = shift ∧ (entry0236 i).ID = S (15 + i.val + 1) ∧
      (entry0236 i).IC = S 16 ∧ (entry0236 i).Inext = T 15 (15 + i.val + 1) ∧
      (entry0236 i).Icur = T 15 (15 + i.val) ∧
      (entry0236 i).output = T 16 (15 + i.val) ∧
      (entry0236 i).charge = charge 15 (15 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0252_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0236 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (15 + i.val)) shift
      (S (15 + i.val + 1)) (S 16) (T 15 (15 + i.val + 1))
      (T 15 (15 + i.val)) (T 16 (15 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0236.entries OriginalRow227TriangleForward0236.checked
    ⟨i.val, by rw [size0236]; exact i.isLt⟩
  change (entry0236 i).check = true at h
  rcases fields0236 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0237 : OriginalRow227TriangleForward0237.entries.size = 32 := rfl

def entry0237 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0237.entries[i.val]'(by rw [size0237]; exact i.isLt)

theorem fields0237 (i : Fin 32) :
    (entry0237 i).IA = shift ∧ (entry0237 i).ID = S (47 + i.val + 1) ∧
      (entry0237 i).IC = S 16 ∧ (entry0237 i).Inext = T 15 (47 + i.val + 1) ∧
      (entry0237 i).Icur = T 15 (47 + i.val) ∧
      (entry0237 i).output = T 16 (47 + i.val) ∧
      (entry0237 i).charge = charge 15 (47 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0253_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0237 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (47 + i.val)) shift
      (S (47 + i.val + 1)) (S 16) (T 15 (47 + i.val + 1))
      (T 15 (47 + i.val)) (T 16 (47 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0237.entries OriginalRow227TriangleForward0237.checked
    ⟨i.val, by rw [size0237]; exact i.isLt⟩
  change (entry0237 i).check = true at h
  rcases fields0237 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0238 : OriginalRow227TriangleForward0238.entries.size = 32 := rfl

def entry0238 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0238.entries[i.val]'(by rw [size0238]; exact i.isLt)

theorem fields0238 (i : Fin 32) :
    (entry0238 i).IA = shift ∧ (entry0238 i).ID = S (79 + i.val + 1) ∧
      (entry0238 i).IC = S 16 ∧ (entry0238 i).Inext = T 15 (79 + i.val + 1) ∧
      (entry0238 i).Icur = T 15 (79 + i.val) ∧
      (entry0238 i).output = T 16 (79 + i.val) ∧
      (entry0238 i).charge = charge 15 (79 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0254_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0238 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (79 + i.val)) shift
      (S (79 + i.val + 1)) (S 16) (T 15 (79 + i.val + 1))
      (T 15 (79 + i.val)) (T 16 (79 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0238.entries OriginalRow227TriangleForward0238.checked
    ⟨i.val, by rw [size0238]; exact i.isLt⟩
  change (entry0238 i).check = true at h
  rcases fields0238 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0239 : OriginalRow227TriangleForward0239.entries.size = 32 := rfl

def entry0239 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0239.entries[i.val]'(by rw [size0239]; exact i.isLt)

theorem fields0239 (i : Fin 32) :
    (entry0239 i).IA = shift ∧ (entry0239 i).ID = S (111 + i.val + 1) ∧
      (entry0239 i).IC = S 16 ∧ (entry0239 i).Inext = T 15 (111 + i.val + 1) ∧
      (entry0239 i).Icur = T 15 (111 + i.val) ∧
      (entry0239 i).output = T 16 (111 + i.val) ∧
      (entry0239 i).charge = charge 15 (111 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0255_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0239 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (111 + i.val)) shift
      (S (111 + i.val + 1)) (S 16) (T 15 (111 + i.val + 1))
      (T 15 (111 + i.val)) (T 16 (111 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0239.entries OriginalRow227TriangleForward0239.checked
    ⟨i.val, by rw [size0239]; exact i.isLt⟩
  change (entry0239 i).check = true at h
  rcases fields0239 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0240 : OriginalRow227TriangleForward0240.entries.size = 32 := rfl

def entry0240 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0240.entries[i.val]'(by rw [size0240]; exact i.isLt)

theorem fields0240 (i : Fin 32) :
    (entry0240 i).IA = shift ∧ (entry0240 i).ID = S (143 + i.val + 1) ∧
      (entry0240 i).IC = S 16 ∧ (entry0240 i).Inext = T 15 (143 + i.val + 1) ∧
      (entry0240 i).Icur = T 15 (143 + i.val) ∧
      (entry0240 i).output = T 16 (143 + i.val) ∧
      (entry0240 i).charge = charge 15 (143 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0256_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0240 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (143 + i.val)) shift
      (S (143 + i.val + 1)) (S 16) (T 15 (143 + i.val + 1))
      (T 15 (143 + i.val)) (T 16 (143 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0240.entries OriginalRow227TriangleForward0240.checked
    ⟨i.val, by rw [size0240]; exact i.isLt⟩
  change (entry0240 i).check = true at h
  rcases fields0240 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0241 : OriginalRow227TriangleForward0241.entries.size = 32 := rfl

def entry0241 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0241.entries[i.val]'(by rw [size0241]; exact i.isLt)

theorem fields0241 (i : Fin 32) :
    (entry0241 i).IA = shift ∧ (entry0241 i).ID = S (175 + i.val + 1) ∧
      (entry0241 i).IC = S 16 ∧ (entry0241 i).Inext = T 15 (175 + i.val + 1) ∧
      (entry0241 i).Icur = T 15 (175 + i.val) ∧
      (entry0241 i).output = T 16 (175 + i.val) ∧
      (entry0241 i).charge = charge 15 (175 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0257_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0241 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (175 + i.val)) shift
      (S (175 + i.val + 1)) (S 16) (T 15 (175 + i.val + 1))
      (T 15 (175 + i.val)) (T 16 (175 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0241.entries OriginalRow227TriangleForward0241.checked
    ⟨i.val, by rw [size0241]; exact i.isLt⟩
  change (entry0241 i).check = true at h
  rcases fields0241 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0242 : OriginalRow227TriangleForward0242.entries.size = 32 := rfl

def entry0242 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0242.entries[i.val]'(by rw [size0242]; exact i.isLt)

theorem fields0242 (i : Fin 32) :
    (entry0242 i).IA = shift ∧ (entry0242 i).ID = S (207 + i.val + 1) ∧
      (entry0242 i).IC = S 16 ∧ (entry0242 i).Inext = T 15 (207 + i.val + 1) ∧
      (entry0242 i).Icur = T 15 (207 + i.val) ∧
      (entry0242 i).output = T 16 (207 + i.val) ∧
      (entry0242 i).charge = charge 15 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0258_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0242 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 16) (T 15 (207 + i.val + 1))
      (T 15 (207 + i.val)) (T 16 (207 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0242.entries OriginalRow227TriangleForward0242.checked
    ⟨i.val, by rw [size0242]; exact i.isLt⟩
  change (entry0242 i).check = true at h
  rcases fields0242 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0243 : OriginalRow227TriangleForward0243.entries.size = 32 := rfl

def entry0243 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0243.entries[i.val]'(by rw [size0243]; exact i.isLt)

theorem fields0243 (i : Fin 32) :
    (entry0243 i).IA = shift ∧ (entry0243 i).ID = S (239 + i.val + 1) ∧
      (entry0243 i).IC = S 16 ∧ (entry0243 i).Inext = T 15 (239 + i.val + 1) ∧
      (entry0243 i).Icur = T 15 (239 + i.val) ∧
      (entry0243 i).output = T 16 (239 + i.val) ∧
      (entry0243 i).charge = charge 15 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0259_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0243 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 16) (T 15 (239 + i.val + 1))
      (T 15 (239 + i.val)) (T 16 (239 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0243.entries OriginalRow227TriangleForward0243.checked
    ⟨i.val, by rw [size0243]; exact i.isLt⟩
  change (entry0243 i).check = true at h
  rcases fields0243 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0244 : OriginalRow227TriangleForward0244.entries.size = 32 := rfl

def entry0244 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0244.entries[i.val]'(by rw [size0244]; exact i.isLt)

theorem fields0244 (i : Fin 32) :
    (entry0244 i).IA = shift ∧ (entry0244 i).ID = S (271 + i.val + 1) ∧
      (entry0244 i).IC = S 16 ∧ (entry0244 i).Inext = T 15 (271 + i.val + 1) ∧
      (entry0244 i).Icur = T 15 (271 + i.val) ∧
      (entry0244 i).output = T 16 (271 + i.val) ∧
      (entry0244 i).charge = charge 15 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0260_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0244 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 16) (T 15 (271 + i.val + 1))
      (T 15 (271 + i.val)) (T 16 (271 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0244.entries OriginalRow227TriangleForward0244.checked
    ⟨i.val, by rw [size0244]; exact i.isLt⟩
  change (entry0244 i).check = true at h
  rcases fields0244 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0245 : OriginalRow227TriangleForward0245.entries.size = 32 := rfl

def entry0245 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0245.entries[i.val]'(by rw [size0245]; exact i.isLt)

theorem fields0245 (i : Fin 32) :
    (entry0245 i).IA = shift ∧ (entry0245 i).ID = S (303 + i.val + 1) ∧
      (entry0245 i).IC = S 16 ∧ (entry0245 i).Inext = T 15 (303 + i.val + 1) ∧
      (entry0245 i).Icur = T 15 (303 + i.val) ∧
      (entry0245 i).output = T 16 (303 + i.val) ∧
      (entry0245 i).charge = charge 15 (303 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0261_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0245 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (303 + i.val)) shift
      (S (303 + i.val + 1)) (S 16) (T 15 (303 + i.val + 1))
      (T 15 (303 + i.val)) (T 16 (303 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0245.entries OriginalRow227TriangleForward0245.checked
    ⟨i.val, by rw [size0245]; exact i.isLt⟩
  change (entry0245 i).check = true at h
  rcases fields0245 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0246 : OriginalRow227TriangleForward0246.entries.size = 32 := rfl

def entry0246 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0246.entries[i.val]'(by rw [size0246]; exact i.isLt)

theorem fields0246 (i : Fin 32) :
    (entry0246 i).IA = shift ∧ (entry0246 i).ID = S (335 + i.val + 1) ∧
      (entry0246 i).IC = S 16 ∧ (entry0246 i).Inext = T 15 (335 + i.val + 1) ∧
      (entry0246 i).Icur = T 15 (335 + i.val) ∧
      (entry0246 i).output = T 16 (335 + i.val) ∧
      (entry0246 i).charge = charge 15 (335 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0262_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0246 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (335 + i.val)) shift
      (S (335 + i.val + 1)) (S 16) (T 15 (335 + i.val + 1))
      (T 15 (335 + i.val)) (T 16 (335 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0246.entries OriginalRow227TriangleForward0246.checked
    ⟨i.val, by rw [size0246]; exact i.isLt⟩
  change (entry0246 i).check = true at h
  rcases fields0246 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0247 : OriginalRow227TriangleForward0247.entries.size = 32 := rfl

def entry0247 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0247.entries[i.val]'(by rw [size0247]; exact i.isLt)

theorem fields0247 (i : Fin 32) :
    (entry0247 i).IA = shift ∧ (entry0247 i).ID = S (367 + i.val + 1) ∧
      (entry0247 i).IC = S 16 ∧ (entry0247 i).Inext = T 15 (367 + i.val + 1) ∧
      (entry0247 i).Icur = T 15 (367 + i.val) ∧
      (entry0247 i).output = T 16 (367 + i.val) ∧
      (entry0247 i).charge = charge 15 (367 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0263_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0247 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (367 + i.val)) shift
      (S (367 + i.val + 1)) (S 16) (T 15 (367 + i.val + 1))
      (T 15 (367 + i.val)) (T 16 (367 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0247.entries OriginalRow227TriangleForward0247.checked
    ⟨i.val, by rw [size0247]; exact i.isLt⟩
  change (entry0247 i).check = true at h
  rcases fields0247 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0248 : OriginalRow227TriangleForward0248.entries.size = 32 := rfl

def entry0248 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0248.entries[i.val]'(by rw [size0248]; exact i.isLt)

theorem fields0248 (i : Fin 32) :
    (entry0248 i).IA = shift ∧ (entry0248 i).ID = S (399 + i.val + 1) ∧
      (entry0248 i).IC = S 16 ∧ (entry0248 i).Inext = T 15 (399 + i.val + 1) ∧
      (entry0248 i).Icur = T 15 (399 + i.val) ∧
      (entry0248 i).output = T 16 (399 + i.val) ∧
      (entry0248 i).charge = charge 15 (399 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0264_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0248 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (399 + i.val)) shift
      (S (399 + i.val + 1)) (S 16) (T 15 (399 + i.val + 1))
      (T 15 (399 + i.val)) (T 16 (399 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0248.entries OriginalRow227TriangleForward0248.checked
    ⟨i.val, by rw [size0248]; exact i.isLt⟩
  change (entry0248 i).check = true at h
  rcases fields0248 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0249 : OriginalRow227TriangleForward0249.entries.size = 32 := rfl

def entry0249 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0249.entries[i.val]'(by rw [size0249]; exact i.isLt)

theorem fields0249 (i : Fin 32) :
    (entry0249 i).IA = shift ∧ (entry0249 i).ID = S (431 + i.val + 1) ∧
      (entry0249 i).IC = S 16 ∧ (entry0249 i).Inext = T 15 (431 + i.val + 1) ∧
      (entry0249 i).Icur = T 15 (431 + i.val) ∧
      (entry0249 i).output = T 16 (431 + i.val) ∧
      (entry0249 i).charge = charge 15 (431 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0265_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0249 (i : Fin 32) :
    forwardStepOK (-768) (charge 15 (431 + i.val)) shift
      (S (431 + i.val + 1)) (S 16) (T 15 (431 + i.val + 1))
      (T 15 (431 + i.val)) (T 16 (431 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0249.entries OriginalRow227TriangleForward0249.checked
    ⟨i.val, by rw [size0249]; exact i.isLt⟩
  change (entry0249 i).check = true at h
  rcases fields0249 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0250 : OriginalRow227TriangleForward0250.entries.size = 23 := rfl

def entry0250 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0250.entries[i.val]'(by rw [size0250]; exact i.isLt)

theorem fields0250 (i : Fin 23) :
    (entry0250 i).IA = shift ∧ (entry0250 i).ID = S (463 + i.val + 1) ∧
      (entry0250 i).IC = S 16 ∧ (entry0250 i).Inext = T 15 (463 + i.val + 1) ∧
      (entry0250 i).Icur = T 15 (463 + i.val) ∧
      (entry0250 i).output = T 16 (463 + i.val) ∧
      (entry0250 i).charge = charge 15 (463 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root16).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow016.block0266_value ⟨22, by decide⟩).symm, rfl⟩

theorem step0250 (i : Fin 23) :
    forwardStepOK (-768) (charge 15 (463 + i.val)) shift
      (S (463 + i.val + 1)) (S 16) (T 15 (463 + i.val + 1))
      (T 15 (463 + i.val)) (T 16 (463 + i.val))
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0250.entries OriginalRow227TriangleForward0250.checked
    ⟨i.val, by rw [size0250]; exact i.isLt⟩
  change (entry0250 i).check = true at h
  rcases fields0250 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 15 ≤ d) (hhi : d < 486) :
    forwardStepOK (-768) (charge 15 d) shift (S (d + 1)) (S 16)
      (T 15 (d + 1)) (T 15 d) (T 16 d)
      (OriginalRow227Roots.root_pos 16 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 15 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    by_cases h111 : d < 111
    ·
      by_cases h47 : d < 47
      ·
        have hi : d - 15 < 32 := by omega
        have heq : 15 + (d - 15) = d := by omega
        simpa only [heq] using step0236 ⟨d - 15, hi⟩
      ·
        by_cases h79 : d < 79
        ·
          have hi : d - 47 < 32 := by omega
          have heq : 47 + (d - 47) = d := by omega
          simpa only [heq] using step0237 ⟨d - 47, hi⟩
        ·
          have hi : d - 79 < 32 := by omega
          have heq : 79 + (d - 79) = d := by omega
          simpa only [heq] using step0238 ⟨d - 79, hi⟩
    ·
      by_cases h175 : d < 175
      ·
        by_cases h143 : d < 143
        ·
          have hi : d - 111 < 32 := by omega
          have heq : 111 + (d - 111) = d := by omega
          simpa only [heq] using step0239 ⟨d - 111, hi⟩
        ·
          have hi : d - 143 < 32 := by omega
          have heq : 143 + (d - 143) = d := by omega
          simpa only [heq] using step0240 ⟨d - 143, hi⟩
      ·
        by_cases h207 : d < 207
        ·
          have hi : d - 175 < 32 := by omega
          have heq : 175 + (d - 175) = d := by omega
          simpa only [heq] using step0241 ⟨d - 175, hi⟩
        ·
          have hi : d - 207 < 32 := by omega
          have heq : 207 + (d - 207) = d := by omega
          simpa only [heq] using step0242 ⟨d - 207, hi⟩
  ·
    by_cases h367 : d < 367
    ·
      by_cases h303 : d < 303
      ·
        by_cases h271 : d < 271
        ·
          have hi : d - 239 < 32 := by omega
          have heq : 239 + (d - 239) = d := by omega
          simpa only [heq] using step0243 ⟨d - 239, hi⟩
        ·
          have hi : d - 271 < 32 := by omega
          have heq : 271 + (d - 271) = d := by omega
          simpa only [heq] using step0244 ⟨d - 271, hi⟩
      ·
        by_cases h335 : d < 335
        ·
          have hi : d - 303 < 32 := by omega
          have heq : 303 + (d - 303) = d := by omega
          simpa only [heq] using step0245 ⟨d - 303, hi⟩
        ·
          have hi : d - 335 < 32 := by omega
          have heq : 335 + (d - 335) = d := by omega
          simpa only [heq] using step0246 ⟨d - 335, hi⟩
    ·
      by_cases h431 : d < 431
      ·
        by_cases h399 : d < 399
        ·
          have hi : d - 367 < 32 := by omega
          have heq : 367 + (d - 367) = d := by omega
          simpa only [heq] using step0247 ⟨d - 367, hi⟩
        ·
          have hi : d - 399 < 32 := by omega
          have heq : 399 + (d - 399) = d := by omega
          simpa only [heq] using step0248 ⟨d - 399, hi⟩
      ·
        by_cases h463 : d < 463
        ·
          have hi : d - 431 < 32 := by omega
          have heq : 431 + (d - 431) = d := by omega
          simpa only [heq] using step0249 ⟨d - 431, hi⟩
        ·
          have hi : d - 463 < 23 := by omega
          have heq : 463 + (d - 463) = d := by omega
          simpa only [heq] using step0250 ⟨d - 463, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0236,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0236,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0237,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0237,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0238,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0238,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0239,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0239,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0240,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0240,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0241,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0241,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0242,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0242,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0243,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0243,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0244,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0244,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0245,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0245,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0246,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0246,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0247,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0247,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0248,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0248,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0249,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0249,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.fields0250,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.step0250,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow016
