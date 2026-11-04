import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034
import Grothe.UpperChaos.OriginalRow227TriangleForward0500
import Grothe.UpperChaos.OriginalRow227TriangleForward0501
import Grothe.UpperChaos.OriginalRow227TriangleForward0502
import Grothe.UpperChaos.OriginalRow227TriangleForward0503
import Grothe.UpperChaos.OriginalRow227TriangleForward0504
import Grothe.UpperChaos.OriginalRow227TriangleForward0505
import Grothe.UpperChaos.OriginalRow227TriangleForward0506
import Grothe.UpperChaos.OriginalRow227TriangleForward0507
import Grothe.UpperChaos.OriginalRow227TriangleForward0508
import Grothe.UpperChaos.OriginalRow227TriangleForward0509
import Grothe.UpperChaos.OriginalRow227TriangleForward0510
import Grothe.UpperChaos.OriginalRow227TriangleForward0511
import Grothe.UpperChaos.OriginalRow227TriangleForward0512
import Grothe.UpperChaos.OriginalRow227TriangleForward0513

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0500 : OriginalRow227TriangleForward0500.entries.size = 32 := rfl

def entry0500 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0500.entries[i.val]'(by rw [size0500]; exact i.isLt)

theorem fields0500 (i : Fin 32) :
    (entry0500 i).IA = shift ∧ (entry0500 i).ID = S (33 + i.val + 1) ∧
      (entry0500 i).IC = S 34 ∧ (entry0500 i).Inext = T 33 (33 + i.val + 1) ∧
      (entry0500 i).Icur = T 33 (33 + i.val) ∧
      (entry0500 i).output = T 34 (33 + i.val) ∧
      (entry0500 i).charge = charge 33 (33 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0500 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (33 + i.val)) shift
      (S (33 + i.val + 1)) (S 34) (T 33 (33 + i.val + 1))
      (T 33 (33 + i.val)) (T 34 (33 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0500.entries OriginalRow227TriangleForward0500.checked
    ⟨i.val, by rw [size0500]; exact i.isLt⟩
  change (entry0500 i).check = true at h
  rcases fields0500 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0501 : OriginalRow227TriangleForward0501.entries.size = 32 := rfl

def entry0501 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0501.entries[i.val]'(by rw [size0501]; exact i.isLt)

theorem fields0501 (i : Fin 32) :
    (entry0501 i).IA = shift ∧ (entry0501 i).ID = S (65 + i.val + 1) ∧
      (entry0501 i).IC = S 34 ∧ (entry0501 i).Inext = T 33 (65 + i.val + 1) ∧
      (entry0501 i).Icur = T 33 (65 + i.val) ∧
      (entry0501 i).output = T 34 (65 + i.val) ∧
      (entry0501 i).charge = charge 33 (65 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0501 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (65 + i.val)) shift
      (S (65 + i.val + 1)) (S 34) (T 33 (65 + i.val + 1))
      (T 33 (65 + i.val)) (T 34 (65 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0501.entries OriginalRow227TriangleForward0501.checked
    ⟨i.val, by rw [size0501]; exact i.isLt⟩
  change (entry0501 i).check = true at h
  rcases fields0501 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0502 : OriginalRow227TriangleForward0502.entries.size = 32 := rfl

def entry0502 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0502.entries[i.val]'(by rw [size0502]; exact i.isLt)

theorem fields0502 (i : Fin 32) :
    (entry0502 i).IA = shift ∧ (entry0502 i).ID = S (97 + i.val + 1) ∧
      (entry0502 i).IC = S 34 ∧ (entry0502 i).Inext = T 33 (97 + i.val + 1) ∧
      (entry0502 i).Icur = T 33 (97 + i.val) ∧
      (entry0502 i).output = T 34 (97 + i.val) ∧
      (entry0502 i).charge = charge 33 (97 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0502 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (97 + i.val)) shift
      (S (97 + i.val + 1)) (S 34) (T 33 (97 + i.val + 1))
      (T 33 (97 + i.val)) (T 34 (97 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0502.entries OriginalRow227TriangleForward0502.checked
    ⟨i.val, by rw [size0502]; exact i.isLt⟩
  change (entry0502 i).check = true at h
  rcases fields0502 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0503 : OriginalRow227TriangleForward0503.entries.size = 32 := rfl

def entry0503 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0503.entries[i.val]'(by rw [size0503]; exact i.isLt)

theorem fields0503 (i : Fin 32) :
    (entry0503 i).IA = shift ∧ (entry0503 i).ID = S (129 + i.val + 1) ∧
      (entry0503 i).IC = S 34 ∧ (entry0503 i).Inext = T 33 (129 + i.val + 1) ∧
      (entry0503 i).Icur = T 33 (129 + i.val) ∧
      (entry0503 i).output = T 34 (129 + i.val) ∧
      (entry0503 i).charge = charge 33 (129 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0503 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (129 + i.val)) shift
      (S (129 + i.val + 1)) (S 34) (T 33 (129 + i.val + 1))
      (T 33 (129 + i.val)) (T 34 (129 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0503.entries OriginalRow227TriangleForward0503.checked
    ⟨i.val, by rw [size0503]; exact i.isLt⟩
  change (entry0503 i).check = true at h
  rcases fields0503 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0504 : OriginalRow227TriangleForward0504.entries.size = 32 := rfl

def entry0504 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0504.entries[i.val]'(by rw [size0504]; exact i.isLt)

theorem fields0504 (i : Fin 32) :
    (entry0504 i).IA = shift ∧ (entry0504 i).ID = S (161 + i.val + 1) ∧
      (entry0504 i).IC = S 34 ∧ (entry0504 i).Inext = T 33 (161 + i.val + 1) ∧
      (entry0504 i).Icur = T 33 (161 + i.val) ∧
      (entry0504 i).output = T 34 (161 + i.val) ∧
      (entry0504 i).charge = charge 33 (161 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0504 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (161 + i.val)) shift
      (S (161 + i.val + 1)) (S 34) (T 33 (161 + i.val + 1))
      (T 33 (161 + i.val)) (T 34 (161 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0504.entries OriginalRow227TriangleForward0504.checked
    ⟨i.val, by rw [size0504]; exact i.isLt⟩
  change (entry0504 i).check = true at h
  rcases fields0504 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0505 : OriginalRow227TriangleForward0505.entries.size = 32 := rfl

def entry0505 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0505.entries[i.val]'(by rw [size0505]; exact i.isLt)

theorem fields0505 (i : Fin 32) :
    (entry0505 i).IA = shift ∧ (entry0505 i).ID = S (193 + i.val + 1) ∧
      (entry0505 i).IC = S 34 ∧ (entry0505 i).Inext = T 33 (193 + i.val + 1) ∧
      (entry0505 i).Icur = T 33 (193 + i.val) ∧
      (entry0505 i).output = T 34 (193 + i.val) ∧
      (entry0505 i).charge = charge 33 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0505 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 34) (T 33 (193 + i.val + 1))
      (T 33 (193 + i.val)) (T 34 (193 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0505.entries OriginalRow227TriangleForward0505.checked
    ⟨i.val, by rw [size0505]; exact i.isLt⟩
  change (entry0505 i).check = true at h
  rcases fields0505 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0506 : OriginalRow227TriangleForward0506.entries.size = 32 := rfl

def entry0506 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0506.entries[i.val]'(by rw [size0506]; exact i.isLt)

theorem fields0506 (i : Fin 32) :
    (entry0506 i).IA = shift ∧ (entry0506 i).ID = S (225 + i.val + 1) ∧
      (entry0506 i).IC = S 34 ∧ (entry0506 i).Inext = T 33 (225 + i.val + 1) ∧
      (entry0506 i).Icur = T 33 (225 + i.val) ∧
      (entry0506 i).output = T 34 (225 + i.val) ∧
      (entry0506 i).charge = charge 33 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0506 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 34) (T 33 (225 + i.val + 1))
      (T 33 (225 + i.val)) (T 34 (225 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0506.entries OriginalRow227TriangleForward0506.checked
    ⟨i.val, by rw [size0506]; exact i.isLt⟩
  change (entry0506 i).check = true at h
  rcases fields0506 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0507 : OriginalRow227TriangleForward0507.entries.size = 32 := rfl

def entry0507 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0507.entries[i.val]'(by rw [size0507]; exact i.isLt)

theorem fields0507 (i : Fin 32) :
    (entry0507 i).IA = shift ∧ (entry0507 i).ID = S (257 + i.val + 1) ∧
      (entry0507 i).IC = S 34 ∧ (entry0507 i).Inext = T 33 (257 + i.val + 1) ∧
      (entry0507 i).Icur = T 33 (257 + i.val) ∧
      (entry0507 i).output = T 34 (257 + i.val) ∧
      (entry0507 i).charge = charge 33 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0507 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 34) (T 33 (257 + i.val + 1))
      (T 33 (257 + i.val)) (T 34 (257 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0507.entries OriginalRow227TriangleForward0507.checked
    ⟨i.val, by rw [size0507]; exact i.isLt⟩
  change (entry0507 i).check = true at h
  rcases fields0507 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0508 : OriginalRow227TriangleForward0508.entries.size = 32 := rfl

def entry0508 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0508.entries[i.val]'(by rw [size0508]; exact i.isLt)

theorem fields0508 (i : Fin 32) :
    (entry0508 i).IA = shift ∧ (entry0508 i).ID = S (289 + i.val + 1) ∧
      (entry0508 i).IC = S 34 ∧ (entry0508 i).Inext = T 33 (289 + i.val + 1) ∧
      (entry0508 i).Icur = T 33 (289 + i.val) ∧
      (entry0508 i).output = T 34 (289 + i.val) ∧
      (entry0508 i).charge = charge 33 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0508 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 34) (T 33 (289 + i.val + 1))
      (T 33 (289 + i.val)) (T 34 (289 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0508.entries OriginalRow227TriangleForward0508.checked
    ⟨i.val, by rw [size0508]; exact i.isLt⟩
  change (entry0508 i).check = true at h
  rcases fields0508 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0509 : OriginalRow227TriangleForward0509.entries.size = 32 := rfl

def entry0509 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0509.entries[i.val]'(by rw [size0509]; exact i.isLt)

theorem fields0509 (i : Fin 32) :
    (entry0509 i).IA = shift ∧ (entry0509 i).ID = S (321 + i.val + 1) ∧
      (entry0509 i).IC = S 34 ∧ (entry0509 i).Inext = T 33 (321 + i.val + 1) ∧
      (entry0509 i).Icur = T 33 (321 + i.val) ∧
      (entry0509 i).output = T 34 (321 + i.val) ∧
      (entry0509 i).charge = charge 33 (321 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0509 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (321 + i.val)) shift
      (S (321 + i.val + 1)) (S 34) (T 33 (321 + i.val + 1))
      (T 33 (321 + i.val)) (T 34 (321 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0509.entries OriginalRow227TriangleForward0509.checked
    ⟨i.val, by rw [size0509]; exact i.isLt⟩
  change (entry0509 i).check = true at h
  rcases fields0509 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0510 : OriginalRow227TriangleForward0510.entries.size = 32 := rfl

def entry0510 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0510.entries[i.val]'(by rw [size0510]; exact i.isLt)

theorem fields0510 (i : Fin 32) :
    (entry0510 i).IA = shift ∧ (entry0510 i).ID = S (353 + i.val + 1) ∧
      (entry0510 i).IC = S 34 ∧ (entry0510 i).Inext = T 33 (353 + i.val + 1) ∧
      (entry0510 i).Icur = T 33 (353 + i.val) ∧
      (entry0510 i).output = T 34 (353 + i.val) ∧
      (entry0510 i).charge = charge 33 (353 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0510 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (353 + i.val)) shift
      (S (353 + i.val + 1)) (S 34) (T 33 (353 + i.val + 1))
      (T 33 (353 + i.val)) (T 34 (353 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0510.entries OriginalRow227TriangleForward0510.checked
    ⟨i.val, by rw [size0510]; exact i.isLt⟩
  change (entry0510 i).check = true at h
  rcases fields0510 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0511 : OriginalRow227TriangleForward0511.entries.size = 32 := rfl

def entry0511 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0511.entries[i.val]'(by rw [size0511]; exact i.isLt)

theorem fields0511 (i : Fin 32) :
    (entry0511 i).IA = shift ∧ (entry0511 i).ID = S (385 + i.val + 1) ∧
      (entry0511 i).IC = S 34 ∧ (entry0511 i).Inext = T 33 (385 + i.val + 1) ∧
      (entry0511 i).Icur = T 33 (385 + i.val) ∧
      (entry0511 i).output = T 34 (385 + i.val) ∧
      (entry0511 i).charge = charge 33 (385 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0511 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (385 + i.val)) shift
      (S (385 + i.val + 1)) (S 34) (T 33 (385 + i.val + 1))
      (T 33 (385 + i.val)) (T 34 (385 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0511.entries OriginalRow227TriangleForward0511.checked
    ⟨i.val, by rw [size0511]; exact i.isLt⟩
  change (entry0511 i).check = true at h
  rcases fields0511 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0512 : OriginalRow227TriangleForward0512.entries.size = 32 := rfl

def entry0512 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0512.entries[i.val]'(by rw [size0512]; exact i.isLt)

theorem fields0512 (i : Fin 32) :
    (entry0512 i).IA = shift ∧ (entry0512 i).ID = S (417 + i.val + 1) ∧
      (entry0512 i).IC = S 34 ∧ (entry0512 i).Inext = T 33 (417 + i.val + 1) ∧
      (entry0512 i).Icur = T 33 (417 + i.val) ∧
      (entry0512 i).output = T 34 (417 + i.val) ∧
      (entry0512 i).charge = charge 33 (417 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0512 (i : Fin 32) :
    forwardStepOK (-768) (charge 33 (417 + i.val)) shift
      (S (417 + i.val + 1)) (S 34) (T 33 (417 + i.val + 1))
      (T 33 (417 + i.val)) (T 34 (417 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0512.entries OriginalRow227TriangleForward0512.checked
    ⟨i.val, by rw [size0512]; exact i.isLt⟩
  change (entry0512 i).check = true at h
  rcases fields0512 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0513 : OriginalRow227TriangleForward0513.entries.size = 19 := rfl

def entry0513 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0513.entries[i.val]'(by rw [size0513]; exact i.isLt)

theorem fields0513 (i : Fin 19) :
    (entry0513 i).IA = shift ∧ (entry0513 i).ID = S (449 + i.val + 1) ∧
      (entry0513 i).IC = S 34 ∧ (entry0513 i).Inext = T 33 (449 + i.val + 1) ∧
      (entry0513 i).Icur = T 33 (449 + i.val) ∧
      (entry0513 i).output = T 34 (449 + i.val) ∧
      (entry0513 i).charge = charge 33 (449 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings01.S_eq_root34).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨18, by decide⟩).symm, rfl⟩

theorem step0513 (i : Fin 19) :
    forwardStepOK (-768) (charge 33 (449 + i.val)) shift
      (S (449 + i.val + 1)) (S 34) (T 33 (449 + i.val + 1))
      (T 33 (449 + i.val)) (T 34 (449 + i.val))
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0513.entries OriginalRow227TriangleForward0513.checked
    ⟨i.val, by rw [size0513]; exact i.isLt⟩
  change (entry0513 i).check = true at h
  rcases fields0513 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 33 ≤ d) (hhi : d < 468) :
    forwardStepOK (-768) (charge 33 d) shift (S (d + 1)) (S 34)
      (T 33 (d + 1)) (T 33 d) (T 34 d)
      (OriginalRow227Roots.root_pos 34 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 33 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h129 : d < 129
    ·
      by_cases h65 : d < 65
      ·
        have hi : d - 33 < 32 := by omega
        have heq : 33 + (d - 33) = d := by omega
        simpa only [heq] using step0500 ⟨d - 33, hi⟩
      ·
        by_cases h97 : d < 97
        ·
          have hi : d - 65 < 32 := by omega
          have heq : 65 + (d - 65) = d := by omega
          simpa only [heq] using step0501 ⟨d - 65, hi⟩
        ·
          have hi : d - 97 < 32 := by omega
          have heq : 97 + (d - 97) = d := by omega
          simpa only [heq] using step0502 ⟨d - 97, hi⟩
    ·
      by_cases h193 : d < 193
      ·
        by_cases h161 : d < 161
        ·
          have hi : d - 129 < 32 := by omega
          have heq : 129 + (d - 129) = d := by omega
          simpa only [heq] using step0503 ⟨d - 129, hi⟩
        ·
          have hi : d - 161 < 32 := by omega
          have heq : 161 + (d - 161) = d := by omega
          simpa only [heq] using step0504 ⟨d - 161, hi⟩
      ·
        by_cases h225 : d < 225
        ·
          have hi : d - 193 < 32 := by omega
          have heq : 193 + (d - 193) = d := by omega
          simpa only [heq] using step0505 ⟨d - 193, hi⟩
        ·
          have hi : d - 225 < 32 := by omega
          have heq : 225 + (d - 225) = d := by omega
          simpa only [heq] using step0506 ⟨d - 225, hi⟩
  ·
    by_cases h353 : d < 353
    ·
      by_cases h289 : d < 289
      ·
        have hi : d - 257 < 32 := by omega
        have heq : 257 + (d - 257) = d := by omega
        simpa only [heq] using step0507 ⟨d - 257, hi⟩
      ·
        by_cases h321 : d < 321
        ·
          have hi : d - 289 < 32 := by omega
          have heq : 289 + (d - 289) = d := by omega
          simpa only [heq] using step0508 ⟨d - 289, hi⟩
        ·
          have hi : d - 321 < 32 := by omega
          have heq : 321 + (d - 321) = d := by omega
          simpa only [heq] using step0509 ⟨d - 321, hi⟩
    ·
      by_cases h417 : d < 417
      ·
        by_cases h385 : d < 385
        ·
          have hi : d - 353 < 32 := by omega
          have heq : 353 + (d - 353) = d := by omega
          simpa only [heq] using step0510 ⟨d - 353, hi⟩
        ·
          have hi : d - 385 < 32 := by omega
          have heq : 385 + (d - 385) = d := by omega
          simpa only [heq] using step0511 ⟨d - 385, hi⟩
      ·
        by_cases h449 : d < 449
        ·
          have hi : d - 417 < 32 := by omega
          have heq : 417 + (d - 417) = d := by omega
          simpa only [heq] using step0512 ⟨d - 417, hi⟩
        ·
          have hi : d - 449 < 19 := by omega
          have heq : 449 + (d - 449) = d := by omega
          simpa only [heq] using step0513 ⟨d - 449, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0500,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0500,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0501,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0501,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0502,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0502,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0503,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0503,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0504,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0504,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0505,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0505,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0506,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0506,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0507,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0507,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0508,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0508,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0509,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0509,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0510,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0510,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0511,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0511,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0512,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0512,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.fields0513,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.step0513,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow034
