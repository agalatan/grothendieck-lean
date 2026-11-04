import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow050
import Grothe.UpperChaos.OriginalRow227TriangleForward0718
import Grothe.UpperChaos.OriginalRow227TriangleForward0719
import Grothe.UpperChaos.OriginalRow227TriangleForward0720
import Grothe.UpperChaos.OriginalRow227TriangleForward0721
import Grothe.UpperChaos.OriginalRow227TriangleForward0722
import Grothe.UpperChaos.OriginalRow227TriangleForward0723
import Grothe.UpperChaos.OriginalRow227TriangleForward0724
import Grothe.UpperChaos.OriginalRow227TriangleForward0725
import Grothe.UpperChaos.OriginalRow227TriangleForward0726
import Grothe.UpperChaos.OriginalRow227TriangleForward0727
import Grothe.UpperChaos.OriginalRow227TriangleForward0728
import Grothe.UpperChaos.OriginalRow227TriangleForward0729
import Grothe.UpperChaos.OriginalRow227TriangleForward0730

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0718 : OriginalRow227TriangleForward0718.entries.size = 32 := rfl

def entry0718 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0718.entries[i.val]'(by rw [size0718]; exact i.isLt)

theorem fields0718 (i : Fin 32) :
    (entry0718 i).IA = shift ∧ (entry0718 i).ID = S (49 + i.val + 1) ∧
      (entry0718 i).IC = S 50 ∧ (entry0718 i).Inext = T 49 (49 + i.val + 1) ∧
      (entry0718 i).Icur = T 49 (49 + i.val) ∧
      (entry0718 i).output = T 50 (49 + i.val) ∧
      (entry0718 i).charge = charge 49 (49 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0734_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0718 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (49 + i.val)) shift
      (S (49 + i.val + 1)) (S 50) (T 49 (49 + i.val + 1))
      (T 49 (49 + i.val)) (T 50 (49 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0718.entries OriginalRow227TriangleForward0718.checked
    ⟨i.val, by rw [size0718]; exact i.isLt⟩
  change (entry0718 i).check = true at h
  rcases fields0718 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0719 : OriginalRow227TriangleForward0719.entries.size = 32 := rfl

def entry0719 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0719.entries[i.val]'(by rw [size0719]; exact i.isLt)

theorem fields0719 (i : Fin 32) :
    (entry0719 i).IA = shift ∧ (entry0719 i).ID = S (81 + i.val + 1) ∧
      (entry0719 i).IC = S 50 ∧ (entry0719 i).Inext = T 49 (81 + i.val + 1) ∧
      (entry0719 i).Icur = T 49 (81 + i.val) ∧
      (entry0719 i).output = T 50 (81 + i.val) ∧
      (entry0719 i).charge = charge 49 (81 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0735_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0719 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (81 + i.val)) shift
      (S (81 + i.val + 1)) (S 50) (T 49 (81 + i.val + 1))
      (T 49 (81 + i.val)) (T 50 (81 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0719.entries OriginalRow227TriangleForward0719.checked
    ⟨i.val, by rw [size0719]; exact i.isLt⟩
  change (entry0719 i).check = true at h
  rcases fields0719 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0720 : OriginalRow227TriangleForward0720.entries.size = 32 := rfl

def entry0720 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0720.entries[i.val]'(by rw [size0720]; exact i.isLt)

theorem fields0720 (i : Fin 32) :
    (entry0720 i).IA = shift ∧ (entry0720 i).ID = S (113 + i.val + 1) ∧
      (entry0720 i).IC = S 50 ∧ (entry0720 i).Inext = T 49 (113 + i.val + 1) ∧
      (entry0720 i).Icur = T 49 (113 + i.val) ∧
      (entry0720 i).output = T 50 (113 + i.val) ∧
      (entry0720 i).charge = charge 49 (113 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0736_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0720 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (113 + i.val)) shift
      (S (113 + i.val + 1)) (S 50) (T 49 (113 + i.val + 1))
      (T 49 (113 + i.val)) (T 50 (113 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0720.entries OriginalRow227TriangleForward0720.checked
    ⟨i.val, by rw [size0720]; exact i.isLt⟩
  change (entry0720 i).check = true at h
  rcases fields0720 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0721 : OriginalRow227TriangleForward0721.entries.size = 32 := rfl

def entry0721 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0721.entries[i.val]'(by rw [size0721]; exact i.isLt)

theorem fields0721 (i : Fin 32) :
    (entry0721 i).IA = shift ∧ (entry0721 i).ID = S (145 + i.val + 1) ∧
      (entry0721 i).IC = S 50 ∧ (entry0721 i).Inext = T 49 (145 + i.val + 1) ∧
      (entry0721 i).Icur = T 49 (145 + i.val) ∧
      (entry0721 i).output = T 50 (145 + i.val) ∧
      (entry0721 i).charge = charge 49 (145 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0737_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0721 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (145 + i.val)) shift
      (S (145 + i.val + 1)) (S 50) (T 49 (145 + i.val + 1))
      (T 49 (145 + i.val)) (T 50 (145 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0721.entries OriginalRow227TriangleForward0721.checked
    ⟨i.val, by rw [size0721]; exact i.isLt⟩
  change (entry0721 i).check = true at h
  rcases fields0721 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0722 : OriginalRow227TriangleForward0722.entries.size = 32 := rfl

def entry0722 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0722.entries[i.val]'(by rw [size0722]; exact i.isLt)

theorem fields0722 (i : Fin 32) :
    (entry0722 i).IA = shift ∧ (entry0722 i).ID = S (177 + i.val + 1) ∧
      (entry0722 i).IC = S 50 ∧ (entry0722 i).Inext = T 49 (177 + i.val + 1) ∧
      (entry0722 i).Icur = T 49 (177 + i.val) ∧
      (entry0722 i).output = T 50 (177 + i.val) ∧
      (entry0722 i).charge = charge 49 (177 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0738_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0722 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (177 + i.val)) shift
      (S (177 + i.val + 1)) (S 50) (T 49 (177 + i.val + 1))
      (T 49 (177 + i.val)) (T 50 (177 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0722.entries OriginalRow227TriangleForward0722.checked
    ⟨i.val, by rw [size0722]; exact i.isLt⟩
  change (entry0722 i).check = true at h
  rcases fields0722 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0723 : OriginalRow227TriangleForward0723.entries.size = 32 := rfl

def entry0723 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0723.entries[i.val]'(by rw [size0723]; exact i.isLt)

theorem fields0723 (i : Fin 32) :
    (entry0723 i).IA = shift ∧ (entry0723 i).ID = S (209 + i.val + 1) ∧
      (entry0723 i).IC = S 50 ∧ (entry0723 i).Inext = T 49 (209 + i.val + 1) ∧
      (entry0723 i).Icur = T 49 (209 + i.val) ∧
      (entry0723 i).output = T 50 (209 + i.val) ∧
      (entry0723 i).charge = charge 49 (209 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0739_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0723 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (209 + i.val)) shift
      (S (209 + i.val + 1)) (S 50) (T 49 (209 + i.val + 1))
      (T 49 (209 + i.val)) (T 50 (209 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0723.entries OriginalRow227TriangleForward0723.checked
    ⟨i.val, by rw [size0723]; exact i.isLt⟩
  change (entry0723 i).check = true at h
  rcases fields0723 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0724 : OriginalRow227TriangleForward0724.entries.size = 32 := rfl

def entry0724 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0724.entries[i.val]'(by rw [size0724]; exact i.isLt)

theorem fields0724 (i : Fin 32) :
    (entry0724 i).IA = shift ∧ (entry0724 i).ID = S (241 + i.val + 1) ∧
      (entry0724 i).IC = S 50 ∧ (entry0724 i).Inext = T 49 (241 + i.val + 1) ∧
      (entry0724 i).Icur = T 49 (241 + i.val) ∧
      (entry0724 i).output = T 50 (241 + i.val) ∧
      (entry0724 i).charge = charge 49 (241 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0740_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0724 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (241 + i.val)) shift
      (S (241 + i.val + 1)) (S 50) (T 49 (241 + i.val + 1))
      (T 49 (241 + i.val)) (T 50 (241 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0724.entries OriginalRow227TriangleForward0724.checked
    ⟨i.val, by rw [size0724]; exact i.isLt⟩
  change (entry0724 i).check = true at h
  rcases fields0724 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0725 : OriginalRow227TriangleForward0725.entries.size = 32 := rfl

def entry0725 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0725.entries[i.val]'(by rw [size0725]; exact i.isLt)

theorem fields0725 (i : Fin 32) :
    (entry0725 i).IA = shift ∧ (entry0725 i).ID = S (273 + i.val + 1) ∧
      (entry0725 i).IC = S 50 ∧ (entry0725 i).Inext = T 49 (273 + i.val + 1) ∧
      (entry0725 i).Icur = T 49 (273 + i.val) ∧
      (entry0725 i).output = T 50 (273 + i.val) ∧
      (entry0725 i).charge = charge 49 (273 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0741_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0725 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (273 + i.val)) shift
      (S (273 + i.val + 1)) (S 50) (T 49 (273 + i.val + 1))
      (T 49 (273 + i.val)) (T 50 (273 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0725.entries OriginalRow227TriangleForward0725.checked
    ⟨i.val, by rw [size0725]; exact i.isLt⟩
  change (entry0725 i).check = true at h
  rcases fields0725 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0726 : OriginalRow227TriangleForward0726.entries.size = 32 := rfl

def entry0726 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0726.entries[i.val]'(by rw [size0726]; exact i.isLt)

theorem fields0726 (i : Fin 32) :
    (entry0726 i).IA = shift ∧ (entry0726 i).ID = S (305 + i.val + 1) ∧
      (entry0726 i).IC = S 50 ∧ (entry0726 i).Inext = T 49 (305 + i.val + 1) ∧
      (entry0726 i).Icur = T 49 (305 + i.val) ∧
      (entry0726 i).output = T 50 (305 + i.val) ∧
      (entry0726 i).charge = charge 49 (305 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0742_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0726 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (305 + i.val)) shift
      (S (305 + i.val + 1)) (S 50) (T 49 (305 + i.val + 1))
      (T 49 (305 + i.val)) (T 50 (305 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0726.entries OriginalRow227TriangleForward0726.checked
    ⟨i.val, by rw [size0726]; exact i.isLt⟩
  change (entry0726 i).check = true at h
  rcases fields0726 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0727 : OriginalRow227TriangleForward0727.entries.size = 32 := rfl

def entry0727 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0727.entries[i.val]'(by rw [size0727]; exact i.isLt)

theorem fields0727 (i : Fin 32) :
    (entry0727 i).IA = shift ∧ (entry0727 i).ID = S (337 + i.val + 1) ∧
      (entry0727 i).IC = S 50 ∧ (entry0727 i).Inext = T 49 (337 + i.val + 1) ∧
      (entry0727 i).Icur = T 49 (337 + i.val) ∧
      (entry0727 i).output = T 50 (337 + i.val) ∧
      (entry0727 i).charge = charge 49 (337 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0743_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0727 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (337 + i.val)) shift
      (S (337 + i.val + 1)) (S 50) (T 49 (337 + i.val + 1))
      (T 49 (337 + i.val)) (T 50 (337 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0727.entries OriginalRow227TriangleForward0727.checked
    ⟨i.val, by rw [size0727]; exact i.isLt⟩
  change (entry0727 i).check = true at h
  rcases fields0727 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0728 : OriginalRow227TriangleForward0728.entries.size = 32 := rfl

def entry0728 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0728.entries[i.val]'(by rw [size0728]; exact i.isLt)

theorem fields0728 (i : Fin 32) :
    (entry0728 i).IA = shift ∧ (entry0728 i).ID = S (369 + i.val + 1) ∧
      (entry0728 i).IC = S 50 ∧ (entry0728 i).Inext = T 49 (369 + i.val + 1) ∧
      (entry0728 i).Icur = T 49 (369 + i.val) ∧
      (entry0728 i).output = T 50 (369 + i.val) ∧
      (entry0728 i).charge = charge 49 (369 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0744_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0728 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (369 + i.val)) shift
      (S (369 + i.val + 1)) (S 50) (T 49 (369 + i.val + 1))
      (T 49 (369 + i.val)) (T 50 (369 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0728.entries OriginalRow227TriangleForward0728.checked
    ⟨i.val, by rw [size0728]; exact i.isLt⟩
  change (entry0728 i).check = true at h
  rcases fields0728 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0729 : OriginalRow227TriangleForward0729.entries.size = 32 := rfl

def entry0729 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0729.entries[i.val]'(by rw [size0729]; exact i.isLt)

theorem fields0729 (i : Fin 32) :
    (entry0729 i).IA = shift ∧ (entry0729 i).ID = S (401 + i.val + 1) ∧
      (entry0729 i).IC = S 50 ∧ (entry0729 i).Inext = T 49 (401 + i.val + 1) ∧
      (entry0729 i).Icur = T 49 (401 + i.val) ∧
      (entry0729 i).output = T 50 (401 + i.val) ∧
      (entry0729 i).charge = charge 49 (401 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0745_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0729 (i : Fin 32) :
    forwardStepOK (-768) (charge 49 (401 + i.val)) shift
      (S (401 + i.val + 1)) (S 50) (T 49 (401 + i.val + 1))
      (T 49 (401 + i.val)) (T 50 (401 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0729.entries OriginalRow227TriangleForward0729.checked
    ⟨i.val, by rw [size0729]; exact i.isLt⟩
  change (entry0729 i).check = true at h
  rcases fields0729 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0730 : OriginalRow227TriangleForward0730.entries.size = 19 := rfl

def entry0730 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0730.entries[i.val]'(by rw [size0730]; exact i.isLt)

theorem fields0730 (i : Fin 19) :
    (entry0730 i).IA = shift ∧ (entry0730 i).ID = S (433 + i.val + 1) ∧
      (entry0730 i).IC = S 50 ∧ (entry0730 i).Inext = T 49 (433 + i.val + 1) ∧
      (entry0730 i).Icur = T 49 (433 + i.val) ∧
      (entry0730 i).output = T 50 (433 + i.val) ∧
      (entry0730 i).charge = charge 49 (433 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root50).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow050.block0746_value ⟨18, by decide⟩).symm, rfl⟩

theorem step0730 (i : Fin 19) :
    forwardStepOK (-768) (charge 49 (433 + i.val)) shift
      (S (433 + i.val + 1)) (S 50) (T 49 (433 + i.val + 1))
      (T 49 (433 + i.val)) (T 50 (433 + i.val))
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0730.entries OriginalRow227TriangleForward0730.checked
    ⟨i.val, by rw [size0730]; exact i.isLt⟩
  change (entry0730 i).check = true at h
  rcases fields0730 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 49 ≤ d) (hhi : d < 452) :
    forwardStepOK (-768) (charge 49 d) shift (S (d + 1)) (S 50)
      (T 49 (d + 1)) (T 49 d) (T 50 d)
      (OriginalRow227Roots.root_pos 50 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 49 (by decide)) = true := by
  by_cases h241 : d < 241
  ·
    by_cases h145 : d < 145
    ·
      by_cases h81 : d < 81
      ·
        have hi : d - 49 < 32 := by omega
        have heq : 49 + (d - 49) = d := by omega
        simpa only [heq] using step0718 ⟨d - 49, hi⟩
      ·
        by_cases h113 : d < 113
        ·
          have hi : d - 81 < 32 := by omega
          have heq : 81 + (d - 81) = d := by omega
          simpa only [heq] using step0719 ⟨d - 81, hi⟩
        ·
          have hi : d - 113 < 32 := by omega
          have heq : 113 + (d - 113) = d := by omega
          simpa only [heq] using step0720 ⟨d - 113, hi⟩
    ·
      by_cases h177 : d < 177
      ·
        have hi : d - 145 < 32 := by omega
        have heq : 145 + (d - 145) = d := by omega
        simpa only [heq] using step0721 ⟨d - 145, hi⟩
      ·
        by_cases h209 : d < 209
        ·
          have hi : d - 177 < 32 := by omega
          have heq : 177 + (d - 177) = d := by omega
          simpa only [heq] using step0722 ⟨d - 177, hi⟩
        ·
          have hi : d - 209 < 32 := by omega
          have heq : 209 + (d - 209) = d := by omega
          simpa only [heq] using step0723 ⟨d - 209, hi⟩
  ·
    by_cases h337 : d < 337
    ·
      by_cases h273 : d < 273
      ·
        have hi : d - 241 < 32 := by omega
        have heq : 241 + (d - 241) = d := by omega
        simpa only [heq] using step0724 ⟨d - 241, hi⟩
      ·
        by_cases h305 : d < 305
        ·
          have hi : d - 273 < 32 := by omega
          have heq : 273 + (d - 273) = d := by omega
          simpa only [heq] using step0725 ⟨d - 273, hi⟩
        ·
          have hi : d - 305 < 32 := by omega
          have heq : 305 + (d - 305) = d := by omega
          simpa only [heq] using step0726 ⟨d - 305, hi⟩
    ·
      by_cases h401 : d < 401
      ·
        by_cases h369 : d < 369
        ·
          have hi : d - 337 < 32 := by omega
          have heq : 337 + (d - 337) = d := by omega
          simpa only [heq] using step0727 ⟨d - 337, hi⟩
        ·
          have hi : d - 369 < 32 := by omega
          have heq : 369 + (d - 369) = d := by omega
          simpa only [heq] using step0728 ⟨d - 369, hi⟩
      ·
        by_cases h433 : d < 433
        ·
          have hi : d - 401 < 32 := by omega
          have heq : 401 + (d - 401) = d := by omega
          simpa only [heq] using step0729 ⟨d - 401, hi⟩
        ·
          have hi : d - 433 < 19 := by omega
          have heq : 433 + (d - 433) = d := by omega
          simpa only [heq] using step0730 ⟨d - 433, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0718,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0718,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0719,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0719,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0720,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0720,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0721,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0721,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0722,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0722,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0723,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0723,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0724,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0724,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0725,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0725,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0726,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0726,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0727,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0727,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0728,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0728,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0729,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0729,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.fields0730,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.step0730,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow050
