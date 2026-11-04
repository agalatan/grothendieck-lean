import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051
import Grothe.UpperChaos.OriginalRow227TriangleForward0731
import Grothe.UpperChaos.OriginalRow227TriangleForward0732
import Grothe.UpperChaos.OriginalRow227TriangleForward0733
import Grothe.UpperChaos.OriginalRow227TriangleForward0734
import Grothe.UpperChaos.OriginalRow227TriangleForward0735
import Grothe.UpperChaos.OriginalRow227TriangleForward0736
import Grothe.UpperChaos.OriginalRow227TriangleForward0737
import Grothe.UpperChaos.OriginalRow227TriangleForward0738
import Grothe.UpperChaos.OriginalRow227TriangleForward0739
import Grothe.UpperChaos.OriginalRow227TriangleForward0740
import Grothe.UpperChaos.OriginalRow227TriangleForward0741
import Grothe.UpperChaos.OriginalRow227TriangleForward0742
import Grothe.UpperChaos.OriginalRow227TriangleForward0743

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0731 : OriginalRow227TriangleForward0731.entries.size = 32 := rfl

def entry0731 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0731.entries[i.val]'(by rw [size0731]; exact i.isLt)

theorem fields0731 (i : Fin 32) :
    (entry0731 i).IA = shift ∧ (entry0731 i).ID = S (50 + i.val + 1) ∧
      (entry0731 i).IC = S 51 ∧ (entry0731 i).Inext = T 50 (50 + i.val + 1) ∧
      (entry0731 i).Icur = T 50 (50 + i.val) ∧
      (entry0731 i).output = T 51 (50 + i.val) ∧
      (entry0731 i).charge = charge 50 (50 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0731 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (50 + i.val)) shift
      (S (50 + i.val + 1)) (S 51) (T 50 (50 + i.val + 1))
      (T 50 (50 + i.val)) (T 51 (50 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0731.entries OriginalRow227TriangleForward0731.checked
    ⟨i.val, by rw [size0731]; exact i.isLt⟩
  change (entry0731 i).check = true at h
  rcases fields0731 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0732 : OriginalRow227TriangleForward0732.entries.size = 32 := rfl

def entry0732 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0732.entries[i.val]'(by rw [size0732]; exact i.isLt)

theorem fields0732 (i : Fin 32) :
    (entry0732 i).IA = shift ∧ (entry0732 i).ID = S (82 + i.val + 1) ∧
      (entry0732 i).IC = S 51 ∧ (entry0732 i).Inext = T 50 (82 + i.val + 1) ∧
      (entry0732 i).Icur = T 50 (82 + i.val) ∧
      (entry0732 i).output = T 51 (82 + i.val) ∧
      (entry0732 i).charge = charge 50 (82 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0732 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (82 + i.val)) shift
      (S (82 + i.val + 1)) (S 51) (T 50 (82 + i.val + 1))
      (T 50 (82 + i.val)) (T 51 (82 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0732.entries OriginalRow227TriangleForward0732.checked
    ⟨i.val, by rw [size0732]; exact i.isLt⟩
  change (entry0732 i).check = true at h
  rcases fields0732 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0733 : OriginalRow227TriangleForward0733.entries.size = 32 := rfl

def entry0733 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0733.entries[i.val]'(by rw [size0733]; exact i.isLt)

theorem fields0733 (i : Fin 32) :
    (entry0733 i).IA = shift ∧ (entry0733 i).ID = S (114 + i.val + 1) ∧
      (entry0733 i).IC = S 51 ∧ (entry0733 i).Inext = T 50 (114 + i.val + 1) ∧
      (entry0733 i).Icur = T 50 (114 + i.val) ∧
      (entry0733 i).output = T 51 (114 + i.val) ∧
      (entry0733 i).charge = charge 50 (114 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0733 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (114 + i.val)) shift
      (S (114 + i.val + 1)) (S 51) (T 50 (114 + i.val + 1))
      (T 50 (114 + i.val)) (T 51 (114 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0733.entries OriginalRow227TriangleForward0733.checked
    ⟨i.val, by rw [size0733]; exact i.isLt⟩
  change (entry0733 i).check = true at h
  rcases fields0733 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0734 : OriginalRow227TriangleForward0734.entries.size = 32 := rfl

def entry0734 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0734.entries[i.val]'(by rw [size0734]; exact i.isLt)

theorem fields0734 (i : Fin 32) :
    (entry0734 i).IA = shift ∧ (entry0734 i).ID = S (146 + i.val + 1) ∧
      (entry0734 i).IC = S 51 ∧ (entry0734 i).Inext = T 50 (146 + i.val + 1) ∧
      (entry0734 i).Icur = T 50 (146 + i.val) ∧
      (entry0734 i).output = T 51 (146 + i.val) ∧
      (entry0734 i).charge = charge 50 (146 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0734 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (146 + i.val)) shift
      (S (146 + i.val + 1)) (S 51) (T 50 (146 + i.val + 1))
      (T 50 (146 + i.val)) (T 51 (146 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0734.entries OriginalRow227TriangleForward0734.checked
    ⟨i.val, by rw [size0734]; exact i.isLt⟩
  change (entry0734 i).check = true at h
  rcases fields0734 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0735 : OriginalRow227TriangleForward0735.entries.size = 32 := rfl

def entry0735 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0735.entries[i.val]'(by rw [size0735]; exact i.isLt)

theorem fields0735 (i : Fin 32) :
    (entry0735 i).IA = shift ∧ (entry0735 i).ID = S (178 + i.val + 1) ∧
      (entry0735 i).IC = S 51 ∧ (entry0735 i).Inext = T 50 (178 + i.val + 1) ∧
      (entry0735 i).Icur = T 50 (178 + i.val) ∧
      (entry0735 i).output = T 51 (178 + i.val) ∧
      (entry0735 i).charge = charge 50 (178 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0735 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (178 + i.val)) shift
      (S (178 + i.val + 1)) (S 51) (T 50 (178 + i.val + 1))
      (T 50 (178 + i.val)) (T 51 (178 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0735.entries OriginalRow227TriangleForward0735.checked
    ⟨i.val, by rw [size0735]; exact i.isLt⟩
  change (entry0735 i).check = true at h
  rcases fields0735 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0736 : OriginalRow227TriangleForward0736.entries.size = 32 := rfl

def entry0736 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0736.entries[i.val]'(by rw [size0736]; exact i.isLt)

theorem fields0736 (i : Fin 32) :
    (entry0736 i).IA = shift ∧ (entry0736 i).ID = S (210 + i.val + 1) ∧
      (entry0736 i).IC = S 51 ∧ (entry0736 i).Inext = T 50 (210 + i.val + 1) ∧
      (entry0736 i).Icur = T 50 (210 + i.val) ∧
      (entry0736 i).output = T 51 (210 + i.val) ∧
      (entry0736 i).charge = charge 50 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0736 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 51) (T 50 (210 + i.val + 1))
      (T 50 (210 + i.val)) (T 51 (210 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0736.entries OriginalRow227TriangleForward0736.checked
    ⟨i.val, by rw [size0736]; exact i.isLt⟩
  change (entry0736 i).check = true at h
  rcases fields0736 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0737 : OriginalRow227TriangleForward0737.entries.size = 32 := rfl

def entry0737 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0737.entries[i.val]'(by rw [size0737]; exact i.isLt)

theorem fields0737 (i : Fin 32) :
    (entry0737 i).IA = shift ∧ (entry0737 i).ID = S (242 + i.val + 1) ∧
      (entry0737 i).IC = S 51 ∧ (entry0737 i).Inext = T 50 (242 + i.val + 1) ∧
      (entry0737 i).Icur = T 50 (242 + i.val) ∧
      (entry0737 i).output = T 51 (242 + i.val) ∧
      (entry0737 i).charge = charge 50 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0737 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 51) (T 50 (242 + i.val + 1))
      (T 50 (242 + i.val)) (T 51 (242 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0737.entries OriginalRow227TriangleForward0737.checked
    ⟨i.val, by rw [size0737]; exact i.isLt⟩
  change (entry0737 i).check = true at h
  rcases fields0737 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0738 : OriginalRow227TriangleForward0738.entries.size = 32 := rfl

def entry0738 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0738.entries[i.val]'(by rw [size0738]; exact i.isLt)

theorem fields0738 (i : Fin 32) :
    (entry0738 i).IA = shift ∧ (entry0738 i).ID = S (274 + i.val + 1) ∧
      (entry0738 i).IC = S 51 ∧ (entry0738 i).Inext = T 50 (274 + i.val + 1) ∧
      (entry0738 i).Icur = T 50 (274 + i.val) ∧
      (entry0738 i).output = T 51 (274 + i.val) ∧
      (entry0738 i).charge = charge 50 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0738 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 51) (T 50 (274 + i.val + 1))
      (T 50 (274 + i.val)) (T 51 (274 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0738.entries OriginalRow227TriangleForward0738.checked
    ⟨i.val, by rw [size0738]; exact i.isLt⟩
  change (entry0738 i).check = true at h
  rcases fields0738 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0739 : OriginalRow227TriangleForward0739.entries.size = 32 := rfl

def entry0739 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0739.entries[i.val]'(by rw [size0739]; exact i.isLt)

theorem fields0739 (i : Fin 32) :
    (entry0739 i).IA = shift ∧ (entry0739 i).ID = S (306 + i.val + 1) ∧
      (entry0739 i).IC = S 51 ∧ (entry0739 i).Inext = T 50 (306 + i.val + 1) ∧
      (entry0739 i).Icur = T 50 (306 + i.val) ∧
      (entry0739 i).output = T 51 (306 + i.val) ∧
      (entry0739 i).charge = charge 50 (306 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0739 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (306 + i.val)) shift
      (S (306 + i.val + 1)) (S 51) (T 50 (306 + i.val + 1))
      (T 50 (306 + i.val)) (T 51 (306 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0739.entries OriginalRow227TriangleForward0739.checked
    ⟨i.val, by rw [size0739]; exact i.isLt⟩
  change (entry0739 i).check = true at h
  rcases fields0739 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0740 : OriginalRow227TriangleForward0740.entries.size = 32 := rfl

def entry0740 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0740.entries[i.val]'(by rw [size0740]; exact i.isLt)

theorem fields0740 (i : Fin 32) :
    (entry0740 i).IA = shift ∧ (entry0740 i).ID = S (338 + i.val + 1) ∧
      (entry0740 i).IC = S 51 ∧ (entry0740 i).Inext = T 50 (338 + i.val + 1) ∧
      (entry0740 i).Icur = T 50 (338 + i.val) ∧
      (entry0740 i).output = T 51 (338 + i.val) ∧
      (entry0740 i).charge = charge 50 (338 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0740 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (338 + i.val)) shift
      (S (338 + i.val + 1)) (S 51) (T 50 (338 + i.val + 1))
      (T 50 (338 + i.val)) (T 51 (338 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0740.entries OriginalRow227TriangleForward0740.checked
    ⟨i.val, by rw [size0740]; exact i.isLt⟩
  change (entry0740 i).check = true at h
  rcases fields0740 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0741 : OriginalRow227TriangleForward0741.entries.size = 32 := rfl

def entry0741 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0741.entries[i.val]'(by rw [size0741]; exact i.isLt)

theorem fields0741 (i : Fin 32) :
    (entry0741 i).IA = shift ∧ (entry0741 i).ID = S (370 + i.val + 1) ∧
      (entry0741 i).IC = S 51 ∧ (entry0741 i).Inext = T 50 (370 + i.val + 1) ∧
      (entry0741 i).Icur = T 50 (370 + i.val) ∧
      (entry0741 i).output = T 51 (370 + i.val) ∧
      (entry0741 i).charge = charge 50 (370 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0741 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (370 + i.val)) shift
      (S (370 + i.val + 1)) (S 51) (T 50 (370 + i.val + 1))
      (T 50 (370 + i.val)) (T 51 (370 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0741.entries OriginalRow227TriangleForward0741.checked
    ⟨i.val, by rw [size0741]; exact i.isLt⟩
  change (entry0741 i).check = true at h
  rcases fields0741 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0742 : OriginalRow227TriangleForward0742.entries.size = 32 := rfl

def entry0742 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0742.entries[i.val]'(by rw [size0742]; exact i.isLt)

theorem fields0742 (i : Fin 32) :
    (entry0742 i).IA = shift ∧ (entry0742 i).ID = S (402 + i.val + 1) ∧
      (entry0742 i).IC = S 51 ∧ (entry0742 i).Inext = T 50 (402 + i.val + 1) ∧
      (entry0742 i).Icur = T 50 (402 + i.val) ∧
      (entry0742 i).output = T 51 (402 + i.val) ∧
      (entry0742 i).charge = charge 50 (402 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0742 (i : Fin 32) :
    forwardStepOK (-768) (charge 50 (402 + i.val)) shift
      (S (402 + i.val + 1)) (S 51) (T 50 (402 + i.val + 1))
      (T 50 (402 + i.val)) (T 51 (402 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0742.entries OriginalRow227TriangleForward0742.checked
    ⟨i.val, by rw [size0742]; exact i.isLt⟩
  change (entry0742 i).check = true at h
  rcases fields0742 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0743 : OriginalRow227TriangleForward0743.entries.size = 17 := rfl

def entry0743 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0743.entries[i.val]'(by rw [size0743]; exact i.isLt)

theorem fields0743 (i : Fin 17) :
    (entry0743 i).IA = shift ∧ (entry0743 i).ID = S (434 + i.val + 1) ∧
      (entry0743 i).IC = S 51 ∧ (entry0743 i).Inext = T 50 (434 + i.val + 1) ∧
      (entry0743 i).Icur = T 50 (434 + i.val) ∧
      (entry0743 i).output = T 51 (434 + i.val) ∧
      (entry0743 i).charge = charge 50 (434 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root51).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨16, by decide⟩).symm, rfl⟩

theorem step0743 (i : Fin 17) :
    forwardStepOK (-768) (charge 50 (434 + i.val)) shift
      (S (434 + i.val + 1)) (S 51) (T 50 (434 + i.val + 1))
      (T 50 (434 + i.val)) (T 51 (434 + i.val))
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0743.entries OriginalRow227TriangleForward0743.checked
    ⟨i.val, by rw [size0743]; exact i.isLt⟩
  change (entry0743 i).check = true at h
  rcases fields0743 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 50 ≤ d) (hhi : d < 451) :
    forwardStepOK (-768) (charge 50 d) shift (S (d + 1)) (S 51)
      (T 50 (d + 1)) (T 50 d) (T 51 d)
      (OriginalRow227Roots.root_pos 51 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 50 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    by_cases h146 : d < 146
    ·
      by_cases h82 : d < 82
      ·
        have hi : d - 50 < 32 := by omega
        have heq : 50 + (d - 50) = d := by omega
        simpa only [heq] using step0731 ⟨d - 50, hi⟩
      ·
        by_cases h114 : d < 114
        ·
          have hi : d - 82 < 32 := by omega
          have heq : 82 + (d - 82) = d := by omega
          simpa only [heq] using step0732 ⟨d - 82, hi⟩
        ·
          have hi : d - 114 < 32 := by omega
          have heq : 114 + (d - 114) = d := by omega
          simpa only [heq] using step0733 ⟨d - 114, hi⟩
    ·
      by_cases h178 : d < 178
      ·
        have hi : d - 146 < 32 := by omega
        have heq : 146 + (d - 146) = d := by omega
        simpa only [heq] using step0734 ⟨d - 146, hi⟩
      ·
        by_cases h210 : d < 210
        ·
          have hi : d - 178 < 32 := by omega
          have heq : 178 + (d - 178) = d := by omega
          simpa only [heq] using step0735 ⟨d - 178, hi⟩
        ·
          have hi : d - 210 < 32 := by omega
          have heq : 210 + (d - 210) = d := by omega
          simpa only [heq] using step0736 ⟨d - 210, hi⟩
  ·
    by_cases h338 : d < 338
    ·
      by_cases h274 : d < 274
      ·
        have hi : d - 242 < 32 := by omega
        have heq : 242 + (d - 242) = d := by omega
        simpa only [heq] using step0737 ⟨d - 242, hi⟩
      ·
        by_cases h306 : d < 306
        ·
          have hi : d - 274 < 32 := by omega
          have heq : 274 + (d - 274) = d := by omega
          simpa only [heq] using step0738 ⟨d - 274, hi⟩
        ·
          have hi : d - 306 < 32 := by omega
          have heq : 306 + (d - 306) = d := by omega
          simpa only [heq] using step0739 ⟨d - 306, hi⟩
    ·
      by_cases h402 : d < 402
      ·
        by_cases h370 : d < 370
        ·
          have hi : d - 338 < 32 := by omega
          have heq : 338 + (d - 338) = d := by omega
          simpa only [heq] using step0740 ⟨d - 338, hi⟩
        ·
          have hi : d - 370 < 32 := by omega
          have heq : 370 + (d - 370) = d := by omega
          simpa only [heq] using step0741 ⟨d - 370, hi⟩
      ·
        by_cases h434 : d < 434
        ·
          have hi : d - 402 < 32 := by omega
          have heq : 402 + (d - 402) = d := by omega
          simpa only [heq] using step0742 ⟨d - 402, hi⟩
        ·
          have hi : d - 434 < 17 := by omega
          have heq : 434 + (d - 434) = d := by omega
          simpa only [heq] using step0743 ⟨d - 434, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0731,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0731,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0732,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0732,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0733,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0733,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0734,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0734,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0735,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0735,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0736,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0736,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0737,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0737,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0738,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0738,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0739,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0739,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0740,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0740,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0741,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0741,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0742,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0742,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.fields0743,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.step0743,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow051
