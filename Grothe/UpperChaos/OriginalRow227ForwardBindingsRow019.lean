import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019
import Grothe.UpperChaos.OriginalRow227TriangleForward0281
import Grothe.UpperChaos.OriginalRow227TriangleForward0282
import Grothe.UpperChaos.OriginalRow227TriangleForward0283
import Grothe.UpperChaos.OriginalRow227TriangleForward0284
import Grothe.UpperChaos.OriginalRow227TriangleForward0285
import Grothe.UpperChaos.OriginalRow227TriangleForward0286
import Grothe.UpperChaos.OriginalRow227TriangleForward0287
import Grothe.UpperChaos.OriginalRow227TriangleForward0288
import Grothe.UpperChaos.OriginalRow227TriangleForward0289
import Grothe.UpperChaos.OriginalRow227TriangleForward0290
import Grothe.UpperChaos.OriginalRow227TriangleForward0291
import Grothe.UpperChaos.OriginalRow227TriangleForward0292
import Grothe.UpperChaos.OriginalRow227TriangleForward0293
import Grothe.UpperChaos.OriginalRow227TriangleForward0294
import Grothe.UpperChaos.OriginalRow227TriangleForward0295

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0281 : OriginalRow227TriangleForward0281.entries.size = 32 := rfl

def entry0281 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0281.entries[i.val]'(by rw [size0281]; exact i.isLt)

theorem fields0281 (i : Fin 32) :
    (entry0281 i).IA = shift ∧ (entry0281 i).ID = S (18 + i.val + 1) ∧
      (entry0281 i).IC = S 19 ∧ (entry0281 i).Inext = T 18 (18 + i.val + 1) ∧
      (entry0281 i).Icur = T 18 (18 + i.val) ∧
      (entry0281 i).output = T 19 (18 + i.val) ∧
      (entry0281 i).charge = charge 18 (18 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0282_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0297_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0281 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (18 + i.val)) shift
      (S (18 + i.val + 1)) (S 19) (T 18 (18 + i.val + 1))
      (T 18 (18 + i.val)) (T 19 (18 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0281.entries OriginalRow227TriangleForward0281.checked
    ⟨i.val, by rw [size0281]; exact i.isLt⟩
  change (entry0281 i).check = true at h
  rcases fields0281 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0282 : OriginalRow227TriangleForward0282.entries.size = 32 := rfl

def entry0282 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0282.entries[i.val]'(by rw [size0282]; exact i.isLt)

theorem fields0282 (i : Fin 32) :
    (entry0282 i).IA = shift ∧ (entry0282 i).ID = S (50 + i.val + 1) ∧
      (entry0282 i).IC = S 19 ∧ (entry0282 i).Inext = T 18 (50 + i.val + 1) ∧
      (entry0282 i).Icur = T 18 (50 + i.val) ∧
      (entry0282 i).output = T 19 (50 + i.val) ∧
      (entry0282 i).charge = charge 18 (50 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0283_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0298_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0282 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (50 + i.val)) shift
      (S (50 + i.val + 1)) (S 19) (T 18 (50 + i.val + 1))
      (T 18 (50 + i.val)) (T 19 (50 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0282.entries OriginalRow227TriangleForward0282.checked
    ⟨i.val, by rw [size0282]; exact i.isLt⟩
  change (entry0282 i).check = true at h
  rcases fields0282 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0283 : OriginalRow227TriangleForward0283.entries.size = 32 := rfl

def entry0283 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0283.entries[i.val]'(by rw [size0283]; exact i.isLt)

theorem fields0283 (i : Fin 32) :
    (entry0283 i).IA = shift ∧ (entry0283 i).ID = S (82 + i.val + 1) ∧
      (entry0283 i).IC = S 19 ∧ (entry0283 i).Inext = T 18 (82 + i.val + 1) ∧
      (entry0283 i).Icur = T 18 (82 + i.val) ∧
      (entry0283 i).output = T 19 (82 + i.val) ∧
      (entry0283 i).charge = charge 18 (82 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0284_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0299_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0283 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (82 + i.val)) shift
      (S (82 + i.val + 1)) (S 19) (T 18 (82 + i.val + 1))
      (T 18 (82 + i.val)) (T 19 (82 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0283.entries OriginalRow227TriangleForward0283.checked
    ⟨i.val, by rw [size0283]; exact i.isLt⟩
  change (entry0283 i).check = true at h
  rcases fields0283 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0284 : OriginalRow227TriangleForward0284.entries.size = 32 := rfl

def entry0284 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0284.entries[i.val]'(by rw [size0284]; exact i.isLt)

theorem fields0284 (i : Fin 32) :
    (entry0284 i).IA = shift ∧ (entry0284 i).ID = S (114 + i.val + 1) ∧
      (entry0284 i).IC = S 19 ∧ (entry0284 i).Inext = T 18 (114 + i.val + 1) ∧
      (entry0284 i).Icur = T 18 (114 + i.val) ∧
      (entry0284 i).output = T 19 (114 + i.val) ∧
      (entry0284 i).charge = charge 18 (114 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0285_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0300_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0284 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (114 + i.val)) shift
      (S (114 + i.val + 1)) (S 19) (T 18 (114 + i.val + 1))
      (T 18 (114 + i.val)) (T 19 (114 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0284.entries OriginalRow227TriangleForward0284.checked
    ⟨i.val, by rw [size0284]; exact i.isLt⟩
  change (entry0284 i).check = true at h
  rcases fields0284 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0285 : OriginalRow227TriangleForward0285.entries.size = 32 := rfl

def entry0285 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0285.entries[i.val]'(by rw [size0285]; exact i.isLt)

theorem fields0285 (i : Fin 32) :
    (entry0285 i).IA = shift ∧ (entry0285 i).ID = S (146 + i.val + 1) ∧
      (entry0285 i).IC = S 19 ∧ (entry0285 i).Inext = T 18 (146 + i.val + 1) ∧
      (entry0285 i).Icur = T 18 (146 + i.val) ∧
      (entry0285 i).output = T 19 (146 + i.val) ∧
      (entry0285 i).charge = charge 18 (146 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0286_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0301_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0285 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (146 + i.val)) shift
      (S (146 + i.val + 1)) (S 19) (T 18 (146 + i.val + 1))
      (T 18 (146 + i.val)) (T 19 (146 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0285.entries OriginalRow227TriangleForward0285.checked
    ⟨i.val, by rw [size0285]; exact i.isLt⟩
  change (entry0285 i).check = true at h
  rcases fields0285 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0286 : OriginalRow227TriangleForward0286.entries.size = 32 := rfl

def entry0286 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0286.entries[i.val]'(by rw [size0286]; exact i.isLt)

theorem fields0286 (i : Fin 32) :
    (entry0286 i).IA = shift ∧ (entry0286 i).ID = S (178 + i.val + 1) ∧
      (entry0286 i).IC = S 19 ∧ (entry0286 i).Inext = T 18 (178 + i.val + 1) ∧
      (entry0286 i).Icur = T 18 (178 + i.val) ∧
      (entry0286 i).output = T 19 (178 + i.val) ∧
      (entry0286 i).charge = charge 18 (178 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0287_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0302_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0286 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (178 + i.val)) shift
      (S (178 + i.val + 1)) (S 19) (T 18 (178 + i.val + 1))
      (T 18 (178 + i.val)) (T 19 (178 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0286.entries OriginalRow227TriangleForward0286.checked
    ⟨i.val, by rw [size0286]; exact i.isLt⟩
  change (entry0286 i).check = true at h
  rcases fields0286 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0287 : OriginalRow227TriangleForward0287.entries.size = 32 := rfl

def entry0287 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0287.entries[i.val]'(by rw [size0287]; exact i.isLt)

theorem fields0287 (i : Fin 32) :
    (entry0287 i).IA = shift ∧ (entry0287 i).ID = S (210 + i.val + 1) ∧
      (entry0287 i).IC = S 19 ∧ (entry0287 i).Inext = T 18 (210 + i.val + 1) ∧
      (entry0287 i).Icur = T 18 (210 + i.val) ∧
      (entry0287 i).output = T 19 (210 + i.val) ∧
      (entry0287 i).charge = charge 18 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0288_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0303_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0287 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 19) (T 18 (210 + i.val + 1))
      (T 18 (210 + i.val)) (T 19 (210 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0287.entries OriginalRow227TriangleForward0287.checked
    ⟨i.val, by rw [size0287]; exact i.isLt⟩
  change (entry0287 i).check = true at h
  rcases fields0287 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0288 : OriginalRow227TriangleForward0288.entries.size = 32 := rfl

def entry0288 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0288.entries[i.val]'(by rw [size0288]; exact i.isLt)

theorem fields0288 (i : Fin 32) :
    (entry0288 i).IA = shift ∧ (entry0288 i).ID = S (242 + i.val + 1) ∧
      (entry0288 i).IC = S 19 ∧ (entry0288 i).Inext = T 18 (242 + i.val + 1) ∧
      (entry0288 i).Icur = T 18 (242 + i.val) ∧
      (entry0288 i).output = T 19 (242 + i.val) ∧
      (entry0288 i).charge = charge 18 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0289_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0304_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0288 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 19) (T 18 (242 + i.val + 1))
      (T 18 (242 + i.val)) (T 19 (242 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0288.entries OriginalRow227TriangleForward0288.checked
    ⟨i.val, by rw [size0288]; exact i.isLt⟩
  change (entry0288 i).check = true at h
  rcases fields0288 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0289 : OriginalRow227TriangleForward0289.entries.size = 32 := rfl

def entry0289 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0289.entries[i.val]'(by rw [size0289]; exact i.isLt)

theorem fields0289 (i : Fin 32) :
    (entry0289 i).IA = shift ∧ (entry0289 i).ID = S (274 + i.val + 1) ∧
      (entry0289 i).IC = S 19 ∧ (entry0289 i).Inext = T 18 (274 + i.val + 1) ∧
      (entry0289 i).Icur = T 18 (274 + i.val) ∧
      (entry0289 i).output = T 19 (274 + i.val) ∧
      (entry0289 i).charge = charge 18 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0290_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0305_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0289 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 19) (T 18 (274 + i.val + 1))
      (T 18 (274 + i.val)) (T 19 (274 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0289.entries OriginalRow227TriangleForward0289.checked
    ⟨i.val, by rw [size0289]; exact i.isLt⟩
  change (entry0289 i).check = true at h
  rcases fields0289 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0290 : OriginalRow227TriangleForward0290.entries.size = 32 := rfl

def entry0290 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0290.entries[i.val]'(by rw [size0290]; exact i.isLt)

theorem fields0290 (i : Fin 32) :
    (entry0290 i).IA = shift ∧ (entry0290 i).ID = S (306 + i.val + 1) ∧
      (entry0290 i).IC = S 19 ∧ (entry0290 i).Inext = T 18 (306 + i.val + 1) ∧
      (entry0290 i).Icur = T 18 (306 + i.val) ∧
      (entry0290 i).output = T 19 (306 + i.val) ∧
      (entry0290 i).charge = charge 18 (306 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0291_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0306_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0290 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (306 + i.val)) shift
      (S (306 + i.val + 1)) (S 19) (T 18 (306 + i.val + 1))
      (T 18 (306 + i.val)) (T 19 (306 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0290.entries OriginalRow227TriangleForward0290.checked
    ⟨i.val, by rw [size0290]; exact i.isLt⟩
  change (entry0290 i).check = true at h
  rcases fields0290 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0291 : OriginalRow227TriangleForward0291.entries.size = 32 := rfl

def entry0291 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0291.entries[i.val]'(by rw [size0291]; exact i.isLt)

theorem fields0291 (i : Fin 32) :
    (entry0291 i).IA = shift ∧ (entry0291 i).ID = S (338 + i.val + 1) ∧
      (entry0291 i).IC = S 19 ∧ (entry0291 i).Inext = T 18 (338 + i.val + 1) ∧
      (entry0291 i).Icur = T 18 (338 + i.val) ∧
      (entry0291 i).output = T 19 (338 + i.val) ∧
      (entry0291 i).charge = charge 18 (338 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0292_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0307_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0291 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (338 + i.val)) shift
      (S (338 + i.val + 1)) (S 19) (T 18 (338 + i.val + 1))
      (T 18 (338 + i.val)) (T 19 (338 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0291.entries OriginalRow227TriangleForward0291.checked
    ⟨i.val, by rw [size0291]; exact i.isLt⟩
  change (entry0291 i).check = true at h
  rcases fields0291 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0292 : OriginalRow227TriangleForward0292.entries.size = 32 := rfl

def entry0292 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0292.entries[i.val]'(by rw [size0292]; exact i.isLt)

theorem fields0292 (i : Fin 32) :
    (entry0292 i).IA = shift ∧ (entry0292 i).ID = S (370 + i.val + 1) ∧
      (entry0292 i).IC = S 19 ∧ (entry0292 i).Inext = T 18 (370 + i.val + 1) ∧
      (entry0292 i).Icur = T 18 (370 + i.val) ∧
      (entry0292 i).output = T 19 (370 + i.val) ∧
      (entry0292 i).charge = charge 18 (370 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0293_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0308_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0292 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (370 + i.val)) shift
      (S (370 + i.val + 1)) (S 19) (T 18 (370 + i.val + 1))
      (T 18 (370 + i.val)) (T 19 (370 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0292.entries OriginalRow227TriangleForward0292.checked
    ⟨i.val, by rw [size0292]; exact i.isLt⟩
  change (entry0292 i).check = true at h
  rcases fields0292 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0293 : OriginalRow227TriangleForward0293.entries.size = 32 := rfl

def entry0293 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0293.entries[i.val]'(by rw [size0293]; exact i.isLt)

theorem fields0293 (i : Fin 32) :
    (entry0293 i).IA = shift ∧ (entry0293 i).ID = S (402 + i.val + 1) ∧
      (entry0293 i).IC = S 19 ∧ (entry0293 i).Inext = T 18 (402 + i.val + 1) ∧
      (entry0293 i).Icur = T 18 (402 + i.val) ∧
      (entry0293 i).output = T 19 (402 + i.val) ∧
      (entry0293 i).charge = charge 18 (402 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0294_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0309_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0293 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (402 + i.val)) shift
      (S (402 + i.val + 1)) (S 19) (T 18 (402 + i.val + 1))
      (T 18 (402 + i.val)) (T 19 (402 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0293.entries OriginalRow227TriangleForward0293.checked
    ⟨i.val, by rw [size0293]; exact i.isLt⟩
  change (entry0293 i).check = true at h
  rcases fields0293 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0294 : OriginalRow227TriangleForward0294.entries.size = 32 := rfl

def entry0294 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0294.entries[i.val]'(by rw [size0294]; exact i.isLt)

theorem fields0294 (i : Fin 32) :
    (entry0294 i).IA = shift ∧ (entry0294 i).ID = S (434 + i.val + 1) ∧
      (entry0294 i).IC = S 19 ∧ (entry0294 i).Inext = T 18 (434 + i.val + 1) ∧
      (entry0294 i).Icur = T 18 (434 + i.val) ∧
      (entry0294 i).output = T 19 (434 + i.val) ∧
      (entry0294 i).charge = charge 18 (434 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0295_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0310_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0294 (i : Fin 32) :
    forwardStepOK (-768) (charge 18 (434 + i.val)) shift
      (S (434 + i.val + 1)) (S 19) (T 18 (434 + i.val + 1))
      (T 18 (434 + i.val)) (T 19 (434 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0294.entries OriginalRow227TriangleForward0294.checked
    ⟨i.val, by rw [size0294]; exact i.isLt⟩
  change (entry0294 i).check = true at h
  rcases fields0294 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0295 : OriginalRow227TriangleForward0295.entries.size = 17 := rfl

def entry0295 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0295.entries[i.val]'(by rw [size0295]; exact i.isLt)

theorem fields0295 (i : Fin 17) :
    (entry0295 i).IA = shift ∧ (entry0295 i).ID = S (466 + i.val + 1) ∧
      (entry0295 i).IC = S 19 ∧ (entry0295 i).Inext = T 18 (466 + i.val + 1) ∧
      (entry0295 i).Icur = T 18 (466 + i.val) ∧
      (entry0295 i).output = T 19 (466 + i.val) ∧
      (entry0295 i).charge = charge 18 (466 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root19).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow018.block0296_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow019.block0311_value ⟨16, by decide⟩).symm, rfl⟩

theorem step0295 (i : Fin 17) :
    forwardStepOK (-768) (charge 18 (466 + i.val)) shift
      (S (466 + i.val + 1)) (S 19) (T 18 (466 + i.val + 1))
      (T 18 (466 + i.val)) (T 19 (466 + i.val))
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0295.entries OriginalRow227TriangleForward0295.checked
    ⟨i.val, by rw [size0295]; exact i.isLt⟩
  change (entry0295 i).check = true at h
  rcases fields0295 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 18 ≤ d) (hhi : d < 483) :
    forwardStepOK (-768) (charge 18 d) shift (S (d + 1)) (S 19)
      (T 18 (d + 1)) (T 18 d) (T 19 d)
      (OriginalRow227Roots.root_pos 19 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 18 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    by_cases h114 : d < 114
    ·
      by_cases h50 : d < 50
      ·
        have hi : d - 18 < 32 := by omega
        have heq : 18 + (d - 18) = d := by omega
        simpa only [heq] using step0281 ⟨d - 18, hi⟩
      ·
        by_cases h82 : d < 82
        ·
          have hi : d - 50 < 32 := by omega
          have heq : 50 + (d - 50) = d := by omega
          simpa only [heq] using step0282 ⟨d - 50, hi⟩
        ·
          have hi : d - 82 < 32 := by omega
          have heq : 82 + (d - 82) = d := by omega
          simpa only [heq] using step0283 ⟨d - 82, hi⟩
    ·
      by_cases h178 : d < 178
      ·
        by_cases h146 : d < 146
        ·
          have hi : d - 114 < 32 := by omega
          have heq : 114 + (d - 114) = d := by omega
          simpa only [heq] using step0284 ⟨d - 114, hi⟩
        ·
          have hi : d - 146 < 32 := by omega
          have heq : 146 + (d - 146) = d := by omega
          simpa only [heq] using step0285 ⟨d - 146, hi⟩
      ·
        by_cases h210 : d < 210
        ·
          have hi : d - 178 < 32 := by omega
          have heq : 178 + (d - 178) = d := by omega
          simpa only [heq] using step0286 ⟨d - 178, hi⟩
        ·
          have hi : d - 210 < 32 := by omega
          have heq : 210 + (d - 210) = d := by omega
          simpa only [heq] using step0287 ⟨d - 210, hi⟩
  ·
    by_cases h370 : d < 370
    ·
      by_cases h306 : d < 306
      ·
        by_cases h274 : d < 274
        ·
          have hi : d - 242 < 32 := by omega
          have heq : 242 + (d - 242) = d := by omega
          simpa only [heq] using step0288 ⟨d - 242, hi⟩
        ·
          have hi : d - 274 < 32 := by omega
          have heq : 274 + (d - 274) = d := by omega
          simpa only [heq] using step0289 ⟨d - 274, hi⟩
      ·
        by_cases h338 : d < 338
        ·
          have hi : d - 306 < 32 := by omega
          have heq : 306 + (d - 306) = d := by omega
          simpa only [heq] using step0290 ⟨d - 306, hi⟩
        ·
          have hi : d - 338 < 32 := by omega
          have heq : 338 + (d - 338) = d := by omega
          simpa only [heq] using step0291 ⟨d - 338, hi⟩
    ·
      by_cases h434 : d < 434
      ·
        by_cases h402 : d < 402
        ·
          have hi : d - 370 < 32 := by omega
          have heq : 370 + (d - 370) = d := by omega
          simpa only [heq] using step0292 ⟨d - 370, hi⟩
        ·
          have hi : d - 402 < 32 := by omega
          have heq : 402 + (d - 402) = d := by omega
          simpa only [heq] using step0293 ⟨d - 402, hi⟩
      ·
        by_cases h466 : d < 466
        ·
          have hi : d - 434 < 32 := by omega
          have heq : 434 + (d - 434) = d := by omega
          simpa only [heq] using step0294 ⟨d - 434, hi⟩
        ·
          have hi : d - 466 < 17 := by omega
          have heq : 466 + (d - 466) = d := by omega
          simpa only [heq] using step0295 ⟨d - 466, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0281,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0281,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0282,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0282,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0283,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0283,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0284,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0284,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0285,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0285,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0286,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0286,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0287,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0287,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0288,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0288,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0289,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0289,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0290,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0290,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0291,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0291,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0292,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0292,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0293,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0293,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0294,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0294,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.fields0295,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.step0295,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow019
