import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024
import Grothe.UpperChaos.OriginalRow227TriangleForward0356
import Grothe.UpperChaos.OriginalRow227TriangleForward0357
import Grothe.UpperChaos.OriginalRow227TriangleForward0358
import Grothe.UpperChaos.OriginalRow227TriangleForward0359
import Grothe.UpperChaos.OriginalRow227TriangleForward0360
import Grothe.UpperChaos.OriginalRow227TriangleForward0361
import Grothe.UpperChaos.OriginalRow227TriangleForward0362
import Grothe.UpperChaos.OriginalRow227TriangleForward0363
import Grothe.UpperChaos.OriginalRow227TriangleForward0364
import Grothe.UpperChaos.OriginalRow227TriangleForward0365
import Grothe.UpperChaos.OriginalRow227TriangleForward0366
import Grothe.UpperChaos.OriginalRow227TriangleForward0367
import Grothe.UpperChaos.OriginalRow227TriangleForward0368
import Grothe.UpperChaos.OriginalRow227TriangleForward0369
import Grothe.UpperChaos.OriginalRow227TriangleForward0370

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0356 : OriginalRow227TriangleForward0356.entries.size = 32 := rfl

def entry0356 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0356.entries[i.val]'(by rw [size0356]; exact i.isLt)

theorem fields0356 (i : Fin 32) :
    (entry0356 i).IA = shift ∧ (entry0356 i).ID = S (23 + i.val + 1) ∧
      (entry0356 i).IC = S 24 ∧ (entry0356 i).Inext = T 23 (23 + i.val + 1) ∧
      (entry0356 i).Icur = T 23 (23 + i.val) ∧
      (entry0356 i).output = T 24 (23 + i.val) ∧
      (entry0356 i).charge = charge 23 (23 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0357_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0372_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0356 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (23 + i.val)) shift
      (S (23 + i.val + 1)) (S 24) (T 23 (23 + i.val + 1))
      (T 23 (23 + i.val)) (T 24 (23 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0356.entries OriginalRow227TriangleForward0356.checked
    ⟨i.val, by rw [size0356]; exact i.isLt⟩
  change (entry0356 i).check = true at h
  rcases fields0356 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0357 : OriginalRow227TriangleForward0357.entries.size = 32 := rfl

def entry0357 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0357.entries[i.val]'(by rw [size0357]; exact i.isLt)

theorem fields0357 (i : Fin 32) :
    (entry0357 i).IA = shift ∧ (entry0357 i).ID = S (55 + i.val + 1) ∧
      (entry0357 i).IC = S 24 ∧ (entry0357 i).Inext = T 23 (55 + i.val + 1) ∧
      (entry0357 i).Icur = T 23 (55 + i.val) ∧
      (entry0357 i).output = T 24 (55 + i.val) ∧
      (entry0357 i).charge = charge 23 (55 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0358_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0373_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0357 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (55 + i.val)) shift
      (S (55 + i.val + 1)) (S 24) (T 23 (55 + i.val + 1))
      (T 23 (55 + i.val)) (T 24 (55 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0357.entries OriginalRow227TriangleForward0357.checked
    ⟨i.val, by rw [size0357]; exact i.isLt⟩
  change (entry0357 i).check = true at h
  rcases fields0357 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0358 : OriginalRow227TriangleForward0358.entries.size = 32 := rfl

def entry0358 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0358.entries[i.val]'(by rw [size0358]; exact i.isLt)

theorem fields0358 (i : Fin 32) :
    (entry0358 i).IA = shift ∧ (entry0358 i).ID = S (87 + i.val + 1) ∧
      (entry0358 i).IC = S 24 ∧ (entry0358 i).Inext = T 23 (87 + i.val + 1) ∧
      (entry0358 i).Icur = T 23 (87 + i.val) ∧
      (entry0358 i).output = T 24 (87 + i.val) ∧
      (entry0358 i).charge = charge 23 (87 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0359_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0374_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0358 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (87 + i.val)) shift
      (S (87 + i.val + 1)) (S 24) (T 23 (87 + i.val + 1))
      (T 23 (87 + i.val)) (T 24 (87 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0358.entries OriginalRow227TriangleForward0358.checked
    ⟨i.val, by rw [size0358]; exact i.isLt⟩
  change (entry0358 i).check = true at h
  rcases fields0358 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0359 : OriginalRow227TriangleForward0359.entries.size = 32 := rfl

def entry0359 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0359.entries[i.val]'(by rw [size0359]; exact i.isLt)

theorem fields0359 (i : Fin 32) :
    (entry0359 i).IA = shift ∧ (entry0359 i).ID = S (119 + i.val + 1) ∧
      (entry0359 i).IC = S 24 ∧ (entry0359 i).Inext = T 23 (119 + i.val + 1) ∧
      (entry0359 i).Icur = T 23 (119 + i.val) ∧
      (entry0359 i).output = T 24 (119 + i.val) ∧
      (entry0359 i).charge = charge 23 (119 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0360_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0375_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0359 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (119 + i.val)) shift
      (S (119 + i.val + 1)) (S 24) (T 23 (119 + i.val + 1))
      (T 23 (119 + i.val)) (T 24 (119 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0359.entries OriginalRow227TriangleForward0359.checked
    ⟨i.val, by rw [size0359]; exact i.isLt⟩
  change (entry0359 i).check = true at h
  rcases fields0359 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0360 : OriginalRow227TriangleForward0360.entries.size = 32 := rfl

def entry0360 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0360.entries[i.val]'(by rw [size0360]; exact i.isLt)

theorem fields0360 (i : Fin 32) :
    (entry0360 i).IA = shift ∧ (entry0360 i).ID = S (151 + i.val + 1) ∧
      (entry0360 i).IC = S 24 ∧ (entry0360 i).Inext = T 23 (151 + i.val + 1) ∧
      (entry0360 i).Icur = T 23 (151 + i.val) ∧
      (entry0360 i).output = T 24 (151 + i.val) ∧
      (entry0360 i).charge = charge 23 (151 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0361_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0376_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0360 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (151 + i.val)) shift
      (S (151 + i.val + 1)) (S 24) (T 23 (151 + i.val + 1))
      (T 23 (151 + i.val)) (T 24 (151 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0360.entries OriginalRow227TriangleForward0360.checked
    ⟨i.val, by rw [size0360]; exact i.isLt⟩
  change (entry0360 i).check = true at h
  rcases fields0360 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0361 : OriginalRow227TriangleForward0361.entries.size = 32 := rfl

def entry0361 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0361.entries[i.val]'(by rw [size0361]; exact i.isLt)

theorem fields0361 (i : Fin 32) :
    (entry0361 i).IA = shift ∧ (entry0361 i).ID = S (183 + i.val + 1) ∧
      (entry0361 i).IC = S 24 ∧ (entry0361 i).Inext = T 23 (183 + i.val + 1) ∧
      (entry0361 i).Icur = T 23 (183 + i.val) ∧
      (entry0361 i).output = T 24 (183 + i.val) ∧
      (entry0361 i).charge = charge 23 (183 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0362_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0377_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0361 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (183 + i.val)) shift
      (S (183 + i.val + 1)) (S 24) (T 23 (183 + i.val + 1))
      (T 23 (183 + i.val)) (T 24 (183 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0361.entries OriginalRow227TriangleForward0361.checked
    ⟨i.val, by rw [size0361]; exact i.isLt⟩
  change (entry0361 i).check = true at h
  rcases fields0361 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0362 : OriginalRow227TriangleForward0362.entries.size = 32 := rfl

def entry0362 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0362.entries[i.val]'(by rw [size0362]; exact i.isLt)

theorem fields0362 (i : Fin 32) :
    (entry0362 i).IA = shift ∧ (entry0362 i).ID = S (215 + i.val + 1) ∧
      (entry0362 i).IC = S 24 ∧ (entry0362 i).Inext = T 23 (215 + i.val + 1) ∧
      (entry0362 i).Icur = T 23 (215 + i.val) ∧
      (entry0362 i).output = T 24 (215 + i.val) ∧
      (entry0362 i).charge = charge 23 (215 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0363_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0378_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0362 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (215 + i.val)) shift
      (S (215 + i.val + 1)) (S 24) (T 23 (215 + i.val + 1))
      (T 23 (215 + i.val)) (T 24 (215 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0362.entries OriginalRow227TriangleForward0362.checked
    ⟨i.val, by rw [size0362]; exact i.isLt⟩
  change (entry0362 i).check = true at h
  rcases fields0362 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0363 : OriginalRow227TriangleForward0363.entries.size = 32 := rfl

def entry0363 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0363.entries[i.val]'(by rw [size0363]; exact i.isLt)

theorem fields0363 (i : Fin 32) :
    (entry0363 i).IA = shift ∧ (entry0363 i).ID = S (247 + i.val + 1) ∧
      (entry0363 i).IC = S 24 ∧ (entry0363 i).Inext = T 23 (247 + i.val + 1) ∧
      (entry0363 i).Icur = T 23 (247 + i.val) ∧
      (entry0363 i).output = T 24 (247 + i.val) ∧
      (entry0363 i).charge = charge 23 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0364_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0379_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0363 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 24) (T 23 (247 + i.val + 1))
      (T 23 (247 + i.val)) (T 24 (247 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0363.entries OriginalRow227TriangleForward0363.checked
    ⟨i.val, by rw [size0363]; exact i.isLt⟩
  change (entry0363 i).check = true at h
  rcases fields0363 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0364 : OriginalRow227TriangleForward0364.entries.size = 32 := rfl

def entry0364 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0364.entries[i.val]'(by rw [size0364]; exact i.isLt)

theorem fields0364 (i : Fin 32) :
    (entry0364 i).IA = shift ∧ (entry0364 i).ID = S (279 + i.val + 1) ∧
      (entry0364 i).IC = S 24 ∧ (entry0364 i).Inext = T 23 (279 + i.val + 1) ∧
      (entry0364 i).Icur = T 23 (279 + i.val) ∧
      (entry0364 i).output = T 24 (279 + i.val) ∧
      (entry0364 i).charge = charge 23 (279 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0365_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0380_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0364 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (279 + i.val)) shift
      (S (279 + i.val + 1)) (S 24) (T 23 (279 + i.val + 1))
      (T 23 (279 + i.val)) (T 24 (279 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0364.entries OriginalRow227TriangleForward0364.checked
    ⟨i.val, by rw [size0364]; exact i.isLt⟩
  change (entry0364 i).check = true at h
  rcases fields0364 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0365 : OriginalRow227TriangleForward0365.entries.size = 32 := rfl

def entry0365 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0365.entries[i.val]'(by rw [size0365]; exact i.isLt)

theorem fields0365 (i : Fin 32) :
    (entry0365 i).IA = shift ∧ (entry0365 i).ID = S (311 + i.val + 1) ∧
      (entry0365 i).IC = S 24 ∧ (entry0365 i).Inext = T 23 (311 + i.val + 1) ∧
      (entry0365 i).Icur = T 23 (311 + i.val) ∧
      (entry0365 i).output = T 24 (311 + i.val) ∧
      (entry0365 i).charge = charge 23 (311 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0366_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0381_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0365 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (311 + i.val)) shift
      (S (311 + i.val + 1)) (S 24) (T 23 (311 + i.val + 1))
      (T 23 (311 + i.val)) (T 24 (311 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0365.entries OriginalRow227TriangleForward0365.checked
    ⟨i.val, by rw [size0365]; exact i.isLt⟩
  change (entry0365 i).check = true at h
  rcases fields0365 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0366 : OriginalRow227TriangleForward0366.entries.size = 32 := rfl

def entry0366 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0366.entries[i.val]'(by rw [size0366]; exact i.isLt)

theorem fields0366 (i : Fin 32) :
    (entry0366 i).IA = shift ∧ (entry0366 i).ID = S (343 + i.val + 1) ∧
      (entry0366 i).IC = S 24 ∧ (entry0366 i).Inext = T 23 (343 + i.val + 1) ∧
      (entry0366 i).Icur = T 23 (343 + i.val) ∧
      (entry0366 i).output = T 24 (343 + i.val) ∧
      (entry0366 i).charge = charge 23 (343 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0367_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0382_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0366 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (343 + i.val)) shift
      (S (343 + i.val + 1)) (S 24) (T 23 (343 + i.val + 1))
      (T 23 (343 + i.val)) (T 24 (343 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0366.entries OriginalRow227TriangleForward0366.checked
    ⟨i.val, by rw [size0366]; exact i.isLt⟩
  change (entry0366 i).check = true at h
  rcases fields0366 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0367 : OriginalRow227TriangleForward0367.entries.size = 32 := rfl

def entry0367 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0367.entries[i.val]'(by rw [size0367]; exact i.isLt)

theorem fields0367 (i : Fin 32) :
    (entry0367 i).IA = shift ∧ (entry0367 i).ID = S (375 + i.val + 1) ∧
      (entry0367 i).IC = S 24 ∧ (entry0367 i).Inext = T 23 (375 + i.val + 1) ∧
      (entry0367 i).Icur = T 23 (375 + i.val) ∧
      (entry0367 i).output = T 24 (375 + i.val) ∧
      (entry0367 i).charge = charge 23 (375 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0368_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0383_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0367 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (375 + i.val)) shift
      (S (375 + i.val + 1)) (S 24) (T 23 (375 + i.val + 1))
      (T 23 (375 + i.val)) (T 24 (375 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0367.entries OriginalRow227TriangleForward0367.checked
    ⟨i.val, by rw [size0367]; exact i.isLt⟩
  change (entry0367 i).check = true at h
  rcases fields0367 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0368 : OriginalRow227TriangleForward0368.entries.size = 32 := rfl

def entry0368 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0368.entries[i.val]'(by rw [size0368]; exact i.isLt)

theorem fields0368 (i : Fin 32) :
    (entry0368 i).IA = shift ∧ (entry0368 i).ID = S (407 + i.val + 1) ∧
      (entry0368 i).IC = S 24 ∧ (entry0368 i).Inext = T 23 (407 + i.val + 1) ∧
      (entry0368 i).Icur = T 23 (407 + i.val) ∧
      (entry0368 i).output = T 24 (407 + i.val) ∧
      (entry0368 i).charge = charge 23 (407 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0369_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0384_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0368 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (407 + i.val)) shift
      (S (407 + i.val + 1)) (S 24) (T 23 (407 + i.val + 1))
      (T 23 (407 + i.val)) (T 24 (407 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0368.entries OriginalRow227TriangleForward0368.checked
    ⟨i.val, by rw [size0368]; exact i.isLt⟩
  change (entry0368 i).check = true at h
  rcases fields0368 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0369 : OriginalRow227TriangleForward0369.entries.size = 32 := rfl

def entry0369 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0369.entries[i.val]'(by rw [size0369]; exact i.isLt)

theorem fields0369 (i : Fin 32) :
    (entry0369 i).IA = shift ∧ (entry0369 i).ID = S (439 + i.val + 1) ∧
      (entry0369 i).IC = S 24 ∧ (entry0369 i).Inext = T 23 (439 + i.val + 1) ∧
      (entry0369 i).Icur = T 23 (439 + i.val) ∧
      (entry0369 i).output = T 24 (439 + i.val) ∧
      (entry0369 i).charge = charge 23 (439 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0370_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0385_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0369 (i : Fin 32) :
    forwardStepOK (-768) (charge 23 (439 + i.val)) shift
      (S (439 + i.val + 1)) (S 24) (T 23 (439 + i.val + 1))
      (T 23 (439 + i.val)) (T 24 (439 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0369.entries OriginalRow227TriangleForward0369.checked
    ⟨i.val, by rw [size0369]; exact i.isLt⟩
  change (entry0369 i).check = true at h
  rcases fields0369 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0370 : OriginalRow227TriangleForward0370.entries.size = 7 := rfl

def entry0370 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0370.entries[i.val]'(by rw [size0370]; exact i.isLt)

theorem fields0370 (i : Fin 7) :
    (entry0370 i).IA = shift ∧ (entry0370 i).ID = S (471 + i.val + 1) ∧
      (entry0370 i).IC = S 24 ∧ (entry0370 i).Inext = T 23 (471 + i.val + 1) ∧
      (entry0370 i).Icur = T 23 (471 + i.val) ∧
      (entry0370 i).output = T 24 (471 + i.val) ∧
      (entry0370 i).charge = charge 23 (471 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root24).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow023.block0371_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow024.block0386_value ⟨6, by decide⟩).symm, rfl⟩

theorem step0370 (i : Fin 7) :
    forwardStepOK (-768) (charge 23 (471 + i.val)) shift
      (S (471 + i.val + 1)) (S 24) (T 23 (471 + i.val + 1))
      (T 23 (471 + i.val)) (T 24 (471 + i.val))
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0370.entries OriginalRow227TriangleForward0370.checked
    ⟨i.val, by rw [size0370]; exact i.isLt⟩
  change (entry0370 i).check = true at h
  rcases fields0370 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 23 ≤ d) (hhi : d < 478) :
    forwardStepOK (-768) (charge 23 d) shift (S (d + 1)) (S 24)
      (T 23 (d + 1)) (T 23 d) (T 24 d)
      (OriginalRow227Roots.root_pos 24 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 23 (by decide)) = true := by
  by_cases h247 : d < 247
  ·
    by_cases h119 : d < 119
    ·
      by_cases h55 : d < 55
      ·
        have hi : d - 23 < 32 := by omega
        have heq : 23 + (d - 23) = d := by omega
        simpa only [heq] using step0356 ⟨d - 23, hi⟩
      ·
        by_cases h87 : d < 87
        ·
          have hi : d - 55 < 32 := by omega
          have heq : 55 + (d - 55) = d := by omega
          simpa only [heq] using step0357 ⟨d - 55, hi⟩
        ·
          have hi : d - 87 < 32 := by omega
          have heq : 87 + (d - 87) = d := by omega
          simpa only [heq] using step0358 ⟨d - 87, hi⟩
    ·
      by_cases h183 : d < 183
      ·
        by_cases h151 : d < 151
        ·
          have hi : d - 119 < 32 := by omega
          have heq : 119 + (d - 119) = d := by omega
          simpa only [heq] using step0359 ⟨d - 119, hi⟩
        ·
          have hi : d - 151 < 32 := by omega
          have heq : 151 + (d - 151) = d := by omega
          simpa only [heq] using step0360 ⟨d - 151, hi⟩
      ·
        by_cases h215 : d < 215
        ·
          have hi : d - 183 < 32 := by omega
          have heq : 183 + (d - 183) = d := by omega
          simpa only [heq] using step0361 ⟨d - 183, hi⟩
        ·
          have hi : d - 215 < 32 := by omega
          have heq : 215 + (d - 215) = d := by omega
          simpa only [heq] using step0362 ⟨d - 215, hi⟩
  ·
    by_cases h375 : d < 375
    ·
      by_cases h311 : d < 311
      ·
        by_cases h279 : d < 279
        ·
          have hi : d - 247 < 32 := by omega
          have heq : 247 + (d - 247) = d := by omega
          simpa only [heq] using step0363 ⟨d - 247, hi⟩
        ·
          have hi : d - 279 < 32 := by omega
          have heq : 279 + (d - 279) = d := by omega
          simpa only [heq] using step0364 ⟨d - 279, hi⟩
      ·
        by_cases h343 : d < 343
        ·
          have hi : d - 311 < 32 := by omega
          have heq : 311 + (d - 311) = d := by omega
          simpa only [heq] using step0365 ⟨d - 311, hi⟩
        ·
          have hi : d - 343 < 32 := by omega
          have heq : 343 + (d - 343) = d := by omega
          simpa only [heq] using step0366 ⟨d - 343, hi⟩
    ·
      by_cases h439 : d < 439
      ·
        by_cases h407 : d < 407
        ·
          have hi : d - 375 < 32 := by omega
          have heq : 375 + (d - 375) = d := by omega
          simpa only [heq] using step0367 ⟨d - 375, hi⟩
        ·
          have hi : d - 407 < 32 := by omega
          have heq : 407 + (d - 407) = d := by omega
          simpa only [heq] using step0368 ⟨d - 407, hi⟩
      ·
        by_cases h471 : d < 471
        ·
          have hi : d - 439 < 32 := by omega
          have heq : 439 + (d - 439) = d := by omega
          simpa only [heq] using step0369 ⟨d - 439, hi⟩
        ·
          have hi : d - 471 < 7 := by omega
          have heq : 471 + (d - 471) = d := by omega
          simpa only [heq] using step0370 ⟨d - 471, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0356,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0356,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0357,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0357,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0358,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0358,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0359,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0359,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0360,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0360,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0361,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0361,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0362,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0362,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0363,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0363,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0364,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0364,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0365,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0365,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0366,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0366,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0367,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0367,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0368,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0368,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0369,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0369,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.fields0370,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.step0370,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow024
